"""Trace Nothing X 3.10.1's instrumented lab copy. No OTA transfer commands."""
import argparse,frida,json,pathlib,time
p=argparse.ArgumentParser();p.add_argument('--port',type=int,required=True);p.add_argument('--seconds',type=int,default=120);p.add_argument('--spoof-old-version',action='store_true');a=p.parse_args()
d=frida.get_device_manager().add_remote_device('127.0.0.1:'+str(a.port));processes=d.enumerate_processes()
if len(processes)!=1 or processes[0].name!='Gadget':raise SystemExit('Expected the isolated Frida Gadget lab copy')
s=d.attach(processes[0].pid)
source='''
const m=Process.getModuleByName('libapp.so');
function str(v){const p=v.sub(1);const n=p.add(8).readU32()>>>1;if(n>1000000)throw Error('Not a bounded Dart string');const cid=(p.readU32()>>>12)&0xfffff;return cid===95?p.add(16).readUtf16String(n):p.add(16).readUtf8String(n);}
for(const [name,offset] of [['md5',0x1a69b78],['aes-encrypt',0x199372c],['aes-decrypt',0x192c588],['rsa-public-decrypt',0x1952d04]]){
 Interceptor.attach(m.base.add(offset),{onEnter(){try{send({kind:name,input:str(this.context.x1),key:name==='aes-encrypt'?str(this.context.x2):null});}catch(e){send({kind:name+'-parse-error',error:String(e)});}},onLeave(v){try{send({kind:name+'-result',value:str(v)});}catch(e){}}});
}
Interceptor.attach(m.base.add(0x192a708),{onEnter(){try{
 send({kind:'ota-check',mac:str(this.context.x2),model:str(this.context.x3),version:str(this.context.x5)});
 if(SPOOF){this.context.x5=this.context.x27.add(0x13fff0).readPointer();send({kind:'version-spoofed',version:str(this.context.x5)});}
}catch(e){send({kind:'ota-parse-error',error:String(e)});}}});
Interceptor.attach(m.base.add(0x184bb7c),{onEnter(){try{const url=str(this.context.x1);if(url.includes('nothing'))send({kind:'request-url',url:url});}catch(e){}}});

Interceptor.attach(m.base.add(0x195c290),{onEnter(){this.heap=this.context.x28.shl(32);this.null=this.context.x22;},onLeave(v){try{
 const heap=this.heap, nil=this.null;
 function read(raw,depth){if(depth>8)return '[depth]';if((raw&1)===0)return raw>>1;const p=heap.add(raw);if(p.equals(nil))return null;if(p.equals(nil.add(0x20)))return true;if(p.equals(nil.add(0x30)))return false;const cid=(p.sub(1).readU32()>>>12)&0xfffff;
 if(cid===94||cid===95)return str(p);
 if(cid===86||cid===87){const array=heap.add(p.add(15).readU32());const used=p.add(19).readU32()>>>1;if(used>2000)return {_cid:cid};const obj={};for(let i=0;i<used;i+=2){const key=read(array.add(15+i*4).readU32(),depth+1);obj[String(key)]=read(array.add(19+i*4).readU32(),depth+1);}return obj;}
 return {_cid:cid};}
 send({kind:'response-data',data:read(v.add(19).readU32(),0)});
 const fields={};for(const offset of [7,11,15,19]){const raw=v.add(offset).readU32();if((raw&1)===0){fields[offset]={integer:raw>>1};continue;}const p=this.heap.add(raw);if(p.equals(this.null)){fields[offset]=null;continue;}const cid=(p.sub(1).readU32()>>>12)&0xfffff;try{fields[offset]={cid,value:str(p)};}catch(e){fields[offset]={cid};}}
 send({kind:'response-model',fields:fields});
}catch(e){send({kind:'response-parse-error',error:String(e)});}}});
send({kind:'ready',spoof:SPOOF});
'''.replace('SPOOF','true' if a.spoof_old_version else 'false')
script=s.create_script(source);out=pathlib.Path('artifacts/network');out.mkdir(parents=True,exist_ok=True);target=out/f'flutter-live-{time.time_ns()}.jsonl';log=target.open('w')
def message(m,data):
 log.write(json.dumps(m)+'\n');log.flush();payload=m.get('payload',{})
 if m.get('type')=='error':print('Trace error:',m.get('description'),flush=True)
 else:print('TRACE',payload.get('kind','status'),flush=True)
script.on('message',message)
try:script.load();print('Local capture:',target,flush=True);time.sleep(a.seconds)
finally:s.detach();log.close()
