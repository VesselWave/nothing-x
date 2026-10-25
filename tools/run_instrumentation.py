"""Run a bounded Frida script against the isolated emulator, with Java bridge."""
import argparse,frida,pathlib,time,json,re
parser=argparse.ArgumentParser();parser.add_argument('script',type=pathlib.Path);parser.add_argument('--pid',type=int,required=True);parser.add_argument('--seconds',type=int,default=35);parser.add_argument('--region',choices=['global','cn'],default='global');parser.add_argument('--version',default='1.0.1.0');parser.add_argument('--ca',type=pathlib.Path);args=parser.parse_args()
root=pathlib.Path(__file__).resolve().parents[1]
bridge=root/'research/tools/instrumentation-env/lib/python3.12/site-packages/frida_tools/bridges/java.js'
device=frida.get_device_manager().add_remote_device('127.0.0.1:27043')
params=device.query_system_parameters()
if params.get('api-level')!=36:raise SystemExit('Expected isolated API 36 emulator')
session=device.attach(args.pid)
hook=args.script.read_text()
if '__TEST_CA_PEM__' in hook:
 ca=args.ca or root/'research/instrumentation/mitmproxy/mitmproxy-ca-cert.pem'
 hook=hook.replace('__TEST_CA_PEM__',json.dumps(ca.read_text())).replace('__FIRMWARE_VERSION__',json.dumps(args.version)).replace('__OTA_HOST__',json.dumps('https://iota.'+('nothingcn.com' if args.region=='cn' else 'nothing.tech')+'/api/v2/'))
source=bridge.read_text()+'\nglobalThis.Java=bridge;\n'+hook
script=session.create_script("""
let chunks=[];
function receiveChunk(){recv('source', function(message){
 chunks.push(message.chunk);
 if(message.last){try{(0,eval)(chunks.join(''));}catch(e){send({error:String(e),stack:e.stack});}chunks=[];}
 else receiveChunk();
});}
receiveChunk();
""")
out=root/'artifacts/network';out.mkdir(parents=True,exist_ok=True)
log=(out/(args.script.stem+'-'+str(time.time_ns())+'.jsonl')).open('w')
def message(m,data):
 log.write(json.dumps(m)+'\n');log.flush()
 print(re.sub(r'(https://[^\s"?]+)\?[^\s"]+',r'\1?[query omitted]',json.dumps(m)),flush=True)
script.on('message',message)
try:
 script.load()
 for offset in range(0,len(source),32000):
  script.post({'type':'source','chunk':source[offset:offset+32000],'last':offset+32000>=len(source)})
 time.sleep(args.seconds)
finally:
 session.detach();log.close()
