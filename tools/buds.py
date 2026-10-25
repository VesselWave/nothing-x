#!/usr/bin/env python3
"""Drive Buds Lab over ADB. Explicit routes use argv arrays, never shell strings."""
import argparse,json,pathlib,subprocess,sys,selectors,os,time,fcntl,hashlib,signal
from event_gate import EventGate
parser=argparse.ArgumentParser()
parser.add_argument('--port',type=int,default=5042,help='Local ADB server port')
parser.add_argument('--serial',help='Device serial; auto-selects a single physical device')
sub=parser.add_subparsers(dest='command',required=True)
for name in ['install','snapshot','capture','custom-trigger','restore-gestures','bridge','export','quiet-dial']:
 p=sub.add_parser(name)
 if name=='bridge':
  p.add_argument('--routes',type=pathlib.Path,help='JSON mapping E014 payload hex to command argv')
  p.add_argument('--quiet-seconds',type=float,default=1.5,help='Suppress hold repeats until this idle gap; 0 dispatches every event')
p=sub.add_parser('wear');p.add_argument('state',choices=['on','off'])
p=sub.add_parser('map')
for field in ['device','button','gesture','operation']:p.add_argument(field,type=lambda x:int(x,0))
args=parser.parse_args()
adb=['adb','-H','127.0.0.1','-P',str(args.port)]
if not args.serial:
 rows=subprocess.check_output(adb+['devices'],text=True).splitlines()[1:]
 devices=[row.split()[0] for row in rows if len(row.split())>=2 and row.split()[1]=='device' and not row.startswith('emulator-')]
 if len(devices)!=1:parser.error('Select --serial: expected one connected physical device')
 args.serial=devices[0]
adb+=['-s',args.serial]
root=pathlib.Path(__file__).resolve().parents[1]
if args.command=='install':
 subprocess.run(adb+['install','-r',str(root/'artifacts/buds-lab.apk')],check=True)
 subprocess.run(adb+['shell','pm','grant','dev.nothingx.lab','android.permission.BLUETOOTH_CONNECT'],check=True)
 sys.exit()
if args.command=='export':
 out=root/'artifacts/device';out.mkdir(parents=True,exist_ok=True)
 # All diagnostic exports remain local; config includes serial and Bluetooth addresses.
 listing=subprocess.check_output(adb+['shell','run-as','dev.nothingx.lab','ls','files'],text=True)
 for name in listing.splitlines():
  if pathlib.PurePath(name).name!=name or not name.endswith(('.hex','.jsonl')):continue
  (out/name).write_bytes(subprocess.check_output(adb+['exec-out','run-as','dev.nothingx.lab','cat','files/'+name]))
 print(out);sys.exit()
routes={}
if args.command=='bridge' and args.routes:
 routes=json.loads(args.routes.read_text())
 for key,argv in routes.items():
  bytes.fromhex(key)
  if not isinstance(argv,list) or not argv or not all(isinstance(x,str) for x in argv):parser.error('Routes must be command argv arrays')
gate=EventGate(args.quiet_seconds if args.command=='bridge' else 1.5)
command=('wear-'+args.state) if args.command=='wear' else args.command
intent=adb+['shell','am','start','-n','dev.nothingx.lab/.MainActivity','--es','command',command]
if command=='map':
 for field in ['device','button','gesture','operation']:intent+=['--ei',field,str(getattr(args,field))]
# One dispatcher per device prevents duplicate host actions from overlapping listeners.
lock_path=root/'artifacts'/('dispatcher-'+hashlib.sha256(args.serial.encode()).hexdigest()[:12]+'.lock')
lock_path.parent.mkdir(parents=True,exist_ok=True)
lock=lock_path.open('a')
try:fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
except BlockingIOError:parser.error('Another Buds Lab operation is active for this device; stop that bridge first')
def stop_handler(signum,frame):raise KeyboardInterrupt
signal.signal(signal.SIGTERM,stop_handler)
logs=subprocess.Popen(adb+['logcat','-v','raw','-T','1','-s','BudsLab:I','*:S'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
selector=selectors.DefaultSelector();selector.register(logs.stdout,selectors.EVENT_READ)
started=False;failed=False;pending=b''
try:
 time.sleep(.2)
 subprocess.run(intent,check=True,stdout=subprocess.DEVNULL)
 deadline=time.monotonic()+(330 if command=='bridge' else 75)
 while time.monotonic()<deadline:
  for key,_ in selector.select(timeout=1):
   chunk=os.read(key.fileobj.fileno(),65536)
   if not chunk:raise RuntimeError('ADB log stream ended')
   pending+=chunk
   while b'\n' in pending:
    raw,pending=pending.split(b'\n',1);line=raw.decode(errors='replace').strip()
    if started and line.startswith('START '):raise RuntimeError('A new Buds Lab operation replaced this session')
    if line=='START '+command:started=True
    if line.startswith('BUSY '):raise RuntimeError('Buds Lab is busy; stop its capture/bridge before starting another operation')
    if not started:continue
    print(line,flush=True)
    if line.startswith('ERROR '):failed=True
    if line.startswith('ACTION '):
     payload=line.split(' ',1)[1].lower()
     if payload in routes and gate.accept(payload,time.monotonic()):
      subprocess.Popen(routes[payload],stdin=subprocess.DEVNULL)
    if line=='DONE '+command:sys.exit(1 if failed else 0)
 raise TimeoutError('Operation timed out; inspect the phone and Bluetooth connection')
except KeyboardInterrupt:
 print('Stopped Buds Lab listener.',flush=True)
 sys.exit(130)
finally:
 logs.terminate();selector.close()
 try:logs.wait(timeout=3)
 except subprocess.TimeoutExpired:logs.kill()
