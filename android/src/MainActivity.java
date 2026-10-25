package dev.nothingx.lab;

import android.app.Activity;
import android.os.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.bluetooth.*;
import android.widget.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/** Small, dependency-free RFCOMM research client. No OTA or factory-reset commands. */
public class MainActivity extends Activity {
 private TextView output;
 private final ExecutorService worker=Executors.newSingleThreadExecutor();
 private final AtomicBoolean busy=new AtomicBoolean();
 private volatile BluetoothSocket socket;
 private volatile boolean closing;
 private int sequence=1;
 private final ConcurrentHashMap<Integer, byte[]> replies=new ConcurrentHashMap<>();
 private final Object logLock=new Object();
 private volatile int pendingCommand=-1;
 private volatile int pendingSequence=-1;
 public void onCreate(Bundle state) {
  super.onCreate(state);
  LinearLayout root=new LinearLayout(this); root.setOrientation(1); root.setPadding(24,24,24,24);
  TextView title=new TextView(this);title.setText("Buds Lab · CMF Buds Pro 2");title.setTextSize(22);root.addView(title);
  TextView info=new TextView(this);info.setText("Connect your buds first. Snapshot saves firmware, wear detection and button mappings. Close Nothing X if it holds the control connection.");root.addView(info);
  button(root,"Read settings", "snapshot"); button(root,"Disable in-ear auto-pause", "wear-off");
  button(root,"Enable in-ear auto-pause", "wear-on"); button(root,"Capture events for 30 seconds", "capture");
  button(root,"Left double-tap hold → custom trigger (experimental)", "custom-trigger");
  button(root,"Disable dial rotation (also disables dial volume)", "quiet-dial");
  button(root,"Restore saved gesture mappings", "restore-gestures");
  button(root,"Listen for custom triggers (5 minutes)", "bridge");
  Button stop=new Button(this);stop.setText("Stop capture / bridge");stop.setOnClickListener(v->{closing=true;try{if(socket!=null)socket.close();}catch(IOException ignored){}});root.addView(stop);
  output=new TextView(this); output.setTextIsSelectable(true);
  ScrollView scroll=new ScrollView(this);scroll.addView(output); root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));setContentView(root);
  if(Build.VERSION.SDK_INT>=31 && checkSelfPermission("android.permission.BLUETOOTH_CONNECT")!=PackageManager.PERMISSION_GRANTED)
   requestPermissions(new String[]{"android.permission.BLUETOOTH_CONNECT"},1);
  else handle(getIntent());
 }
 private void button(LinearLayout root,String label,String command) {Button b=new Button(this);b.setText(label);b.setOnClickListener(v->start(command));root.addView(b);}
 public void onNewIntent(Intent intent) {super.onNewIntent(intent);setIntent(intent);handle(intent);}
 private void handle(Intent intent) {String command=intent.getStringExtra("command");if(command!=null)start(command);}
 public void onRequestPermissionsResult(int req,String[] permissions,int[] grants) {super.onRequestPermissionsResult(req,permissions,grants);if(grants.length>0&&grants[0]==PackageManager.PERMISSION_GRANTED)handle(getIntent());}
 private void log(String event,String detail) {
  try {JSONObject json=new JSONObject();json.put("time",System.currentTimeMillis());json.put("event",event);json.put("detail",detail);
   synchronized(logLock) {try(FileOutputStream stream=openFileOutput("capture.jsonl",MODE_APPEND)){stream.write((json+"\n").getBytes(StandardCharsets.UTF_8));}}
  }catch(Exception ignored){}
  android.util.Log.i("BudsLab",event+" "+detail);
  runOnUiThread(()->{output.append(event+" "+detail+"\n");if(output.length()>24000)output.setText(output.getText().subSequence(output.length()-16000,output.length()));});
 }
 private void start(String command) {
  if(!Arrays.asList("snapshot","wear-off","wear-on","capture","custom-trigger","restore-gestures","map","bridge","quiet-dial").contains(command)){log("ERROR","Unknown command");return;}
  if(!busy.compareAndSet(false,true)){log("BUSY","Wait for the current operation");return;}
  log("START",command);
  worker.execute(()->{try{run(command);}catch(Exception error){log("ERROR",error.toString());}finally{closing=true;try{if(socket!=null)socket.close();}catch(Exception ignored){}socket=null;busy.set(false);log("DONE",command);}});
 }
 private void run(String command) throws Exception {
  closing=false;replies.clear();sequence=1;
  BluetoothAdapter adapter=((BluetoothManager)getSystemService(BLUETOOTH_SERVICE)).getAdapter();
  if(adapter==null||!adapter.isEnabled())throw new IOException("Turn Bluetooth on");
  BluetoothDevice target=null;
  for(BluetoothDevice device:adapter.getBondedDevices())if("CMF Buds Pro 2".equals(device.getName())){if(target!=null)throw new IOException("Multiple Buds Pro 2 pairs found");target=device;}
  if(target==null)throw new IOException("Pair CMF Buds Pro 2 first");
  socket=target.createRfcommSocketToServiceRecord(UUID.fromString("aeac4a03-dff5-498f-843a-34487cf133eb"));
  final BluetoothSocket current=socket;
  ScheduledExecutorService watchdog=Executors.newSingleThreadScheduledExecutor();
  ScheduledFuture<?> timeout=watchdog.schedule(()->{try{current.close();}catch(IOException ignored){}},12,TimeUnit.SECONDS);
  try{socket.connect();}finally{timeout.cancel(false);watchdog.shutdown();}
  log("CONNECTED",target.getName());
  Thread reader=new Thread(()->read(current),"buds-rx");reader.setDaemon(true);reader.start();
  request(0xc001,new byte[0]);
  if(command.equals("map")||command.equals("custom-trigger")||command.equals("restore-gestures")||command.equals("quiet-dial")) {
   byte[] before=request(0xc018,new byte[0]);
   if(before==null || before.length<5 || before.length!=1+4*(before[0]&255))throw new IOException("No valid gesture snapshot; refusing write");
   if(getFileStreamPath("gestures-original.hex").exists() && !target.getAddress().equals(getPreferences(MODE_PRIVATE).getString("backup_address","")))throw new IOException("Saved backup belongs to a different pair; export it and clear app data before changing another pair");
   if(!getFileStreamPath("gestures-original.hex").exists()){save("gestures-original.hex",before);getPreferences(MODE_PRIVATE).edit().putString("backup_address",target.getAddress()).commit();}
   byte[] desired;
   if(command.equals("restore-gestures")){desired=unhex(new String(java.nio.file.Files.readAllBytes(getFileStreamPath("gestures-original.hex").toPath()),StandardCharsets.UTF_8).trim());}
   else {
    Intent intent=getIntent();
    int device=command.equals("quiet-dial")?4:command.equals("custom-trigger")?2:intent.getIntExtra("device",-1);
    int button=(command.equals("custom-trigger")||command.equals("quiet-dial"))?1:intent.getIntExtra("button",-1);
    int gesture=command.equals("quiet-dial")?10:command.equals("custom-trigger")?9:intent.getIntExtra("gesture",-1);
    int action=command.equals("quiet-dial")?1:command.equals("custom-trigger")?31:intent.getIntExtra("operation",-1);
    if(device<2||device>4||button<1||button>6||gesture<0||gesture>255||action<1||action>40)throw new IOException("Invalid gesture mapping fields");
    boolean exists=false;for(int i=1;i+3<before.length;i+=4)if((before[i]&255)==device&&(before[i+1]&255)==button&&(before[i+2]&255)==gesture)exists=true;
    if(!exists)throw new IOException("That gesture slot was not reported by these buds");
    desired=new byte[]{1,(byte)device,(byte)button,(byte)gesture,(byte)action};
   }
   request(0xf003,desired);
   byte[] after=request(0xc018,new byte[0]);save("gestures-after.hex",after);
   if(after==null)throw new IOException("No gesture readback");
   for(int i=1;i+3<desired.length;i+=4){boolean matched=false;for(int j=1;j+3<after.length;j+=4)if(Arrays.equals(Arrays.copyOfRange(desired,i,i+4),Arrays.copyOfRange(after,j,j+4)))matched=true;if(!matched)throw new IOException("Gesture readback did not match; original mappings saved for restore");}
   log("VERIFIED","Gesture mapping readback matched "+hex(desired));
  } else if(command.equals("bridge")){
   log("BRIDGE","Listening for E014 events; stop button disconnects");
   long until=SystemClock.elapsedRealtime()+300000;while(!closing&&SystemClock.elapsedRealtime()<until)Thread.sleep(100);
  } else if(command.equals("wear-off")||command.equals("wear-on")) {
   byte[] before=request(0xc00e,new byte[0]);
   if(before==null || before.length<3 || before.length!=1+2*(before[0]&255))throw new IOException("No valid feature snapshot; refusing write");
   boolean supported=false;for(int i=1;i+1<before.length;i+=2)if(before[i]==1)supported=true;
   if(!supported)throw new IOException("Wear detection not reported by these buds");
   save("wear-before.hex",before);
   request(0xf004,new byte[]{1,1,(byte)(command.equals("wear-on")?1:0)});
   byte[] after=request(0xc00e,new byte[0]);save("wear-after.hex",after);
   if(after==null)throw new IOException("No wear-setting readback; change is unverified");
   boolean desired=command.equals("wear-on");boolean found=false;
   for(int i=1;i+1<after.length;i+=2)if(after[i]==1){found=true;if((after[i+1]==1)!=desired)throw new IOException("Wear setting did not match request");}
   if(!found)throw new IOException("Wear feature not present in response");
   log("VERIFIED","In-ear detection "+(desired?"enabled":"disabled"));
  } else {
   for(int cmd:new int[]{0xc042,0xc007,0xc00e,0xc018,0xc009,0xc03d,0xc03e,0xc00a,0xc006,0xc01c,0xc00c,0xc00d,0xc010,0xc014,0xc057}) {
    byte[] reply=request(cmd,new byte[0]);save(String.format("%04x.hex",cmd),reply);
   }
   if(command.equals("capture")){log("CAPTURE","Operate dial, taps, wear sensor, and case now; listening 30 seconds");long until=SystemClock.elapsedRealtime()+30000;while(!closing&&SystemClock.elapsedRealtime()<until)Thread.sleep(100);}
  }
 }
 private void save(String filename,byte[] data) throws IOException {if(data!=null)try(FileOutputStream stream=openFileOutput(filename,MODE_PRIVATE)){stream.write((hex(data)+"\n").getBytes(StandardCharsets.UTF_8));}}
 private byte[] request(int command,byte[] payload) throws Exception {
  int id=sequence++;if(sequence>255)sequence=1;replies.remove(id);pendingCommand=command;pendingSequence=id;
  byte[] frame=frame(command,id,payload);log("TX",hex(frame));socket.getOutputStream().write(frame);socket.getOutputStream().flush();
  long until=SystemClock.elapsedRealtime()+1800;
  while(SystemClock.elapsedRealtime()<until){byte[] response=replies.remove(id);if(response!=null)return response;Thread.sleep(20);}
  log("TIMEOUT",String.format("%04x",command));return null;
 }
 private void read(BluetoothSocket current) {
  try{InputStream in=current.getInputStream();while(!closing){int start=in.read();if(start<0)return;if(start!=0x55)continue;
   byte[] header=new byte[8];header[0]=(byte)start;readFully(in,header,1,7);
   int length=(header[5]&255)|((header[6]&255)<<8);boolean hasCrc=(header[1]&0x20)!=0;
   if(length>8192)throw new IOException("Invalid frame length "+length);
   byte[] packet=Arrays.copyOf(header,8+length+(hasCrc?2:0));readFully(in,packet,8,packet.length-8);
   if(hasCrc) {
    int expected=(packet[packet.length-2]&255)|((packet[packet.length-1]&255)<<8);
    byte[] payload=Arrays.copyOfRange(packet,8,8+length);
    if(crc(payload,payload.length)!=expected && crc(packet,packet.length-2)!=expected){log("BAD_CRC",hex(packet));continue;}
   }
   log("RX",hex(packet));int code=(packet[3]&255)|((packet[4]&255)<<8);int id=packet[7]&255;
   if(code==0xe014 && length>0){
    byte[] payload=Arrays.copyOfRange(packet,8,8+length);log("ACTION",hex(payload));
    Intent event=new Intent("dev.nothingx.lab.EVENT");event.putExtra("operation",payload[0]&255);event.putExtra("payload",hex(payload));sendBroadcast(event);
   }
   // Notifications never satisfy a pending query even if their sequence matches.
   if((code&0xf000)!=0xe000 && id==pendingSequence && (code&0x3fff)==(pendingCommand&0x3fff))replies.put(id,Arrays.copyOfRange(packet,8,8+length));
  }}catch(Exception error){if(!closing)log("RX_ERROR",error.toString());}
 }
 private static void readFully(InputStream in,byte[] data,int offset,int length)throws IOException{while(length>0){int n=in.read(data,offset,length);if(n<0)throw new EOFException();offset+=n;length-=n;}}
 public static byte[] frame(int command,int sequence,byte[] payload){byte[] bytes=new byte[10+payload.length];bytes[0]=0x55;bytes[1]=0x60;bytes[2]=1;bytes[3]=(byte)command;bytes[4]=(byte)(command>>8);bytes[5]=(byte)payload.length;bytes[6]=(byte)(payload.length>>8);bytes[7]=(byte)sequence;System.arraycopy(payload,0,bytes,8,payload.length);int crc=crc(bytes,bytes.length-2);bytes[bytes.length-2]=(byte)crc;bytes[bytes.length-1]=(byte)(crc>>8);return bytes;}
 public static int crc(byte[] bytes,int length){int crc=0xffff;for(int i=0;i<length;i++){crc^=bytes[i]&255;for(int j=0;j<8;j++)crc=(crc&1)!=0?(crc>>1)^0xa001:crc>>1;}return crc;}
 private static byte[] unhex(String value){if((value.length()&1)!=0)throw new IllegalArgumentException("Odd hex length");byte[] data=new byte[value.length()/2];for(int i=0;i<data.length;i++)data[i]=(byte)Integer.parseInt(value.substring(i*2,i*2+2),16);return data;}
 private static String hex(byte[] bytes){StringBuilder result=new StringBuilder();for(byte b:bytes)result.append(String.format(Locale.ROOT,"%02x",b&255));return result.toString();}
 protected void onDestroy(){closing=true;try{if(socket!=null)socket.close();}catch(IOException ignored){}worker.shutdownNow();super.onDestroy();}
}
