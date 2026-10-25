"""Stage pinned B187 mute file for Nothing X lab's original updater.

Arming does not start OTA. The app's Update button starts its normal checks.
A one-shot native hook swaps the file immediately before startOta(), then
detaches. No Java/Bluetooth hooks or device integrity-check overrides.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time
import frida
from tools.repack_b187_mute import build

SERIAL='adb-29021FDH2002KF-Gu2xSt._adb-tls-connect._tcp'
PACKAGE='com.nothing.smartcenter.lab'
TARGET='/data/user/0/'+PACKAGE+'/app_flutter/ota/1770728924357NT_24253_BES2710IHC_6Z_V1.0.1.74_260202_ota.bin.converted.bin'

def adb(*args, **kwargs):
    return subprocess.run(['adb','-s',SERIAL,*args],check=True,stdout=subprocess.PIPE,**kwargs).stdout

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--arm',action='store_true',required=True)
    p.add_argument('--seconds',type=int,default=300)
    a=p.parse_args()
    stock=Path('artifacts/firmware/B187-1.0.1.74.bin').read_bytes()
    image,report=build(stock)
    saved=Path('artifacts/firmware/B187-1.0.1.74-ping-mute.OTA.bin')
    if saved.read_bytes()!=image:raise ValueError('Saved experiment differs from deterministic build')
    staged=TARGET+'.mute-pending'
    adb('push',str(saved),'/data/local/tmp/b187-mute-ota.bin')
    adb('shell','run-as',PACKAGE,'cp','/data/local/tmp/b187-mute-ota.bin',staged)
    reread=adb('exec-out','run-as',PACKAGE,'cat',staged)
    if reread!=image:raise ValueError('Staged file readback mismatch')
    out=Path('artifacts/custom-flash');out.mkdir(exist_ok=True)
    (out/'staged-file-verification.json').write_text(json.dumps(dict(sha256=hashlib.sha256(reread).hexdigest(),size=len(reread),matched=True),indent=2)+'\n')
    device=frida.get_device_manager().add_remote_device('127.0.0.1:27045')
    procs=device.enumerate_processes()
    if len(procs)!=1 or procs[0].name!='Gadget':raise ValueError('Expected isolated Gadget lab process')
    session=device.attach(procs[0].pid)
    source='''
const target=TARGET, staged=STAGED;
const libc=Process.getModuleByName('libc.so');
const rename=new NativeFunction(libc.getExportByName('rename'),'int',['pointer','pointer']);
const abort=new NativeFunction(libc.getExportByName('abort'),'void',[]);
const from=Memory.allocUtf8String(staged), to=Memory.allocUtf8String(target);
function str(v){const p=v.sub(1), n=p.add(8).readU32()>>>1;
 const cid=(p.readU32()>>>12)&0xfffff;
 if(n>512||(cid!==94&&cid!==95))throw Error('Unexpected path string');
 return cid===95?p.add(16).readUtf16String(n):p.add(16).readUtf8String(n);}
const m=Process.getModuleByName('libapp.so');
const at=m.base.add(0x346bc88);
// ldr x4,[x27,#0x6d0] immediately before bl startOta, x2 = file.path.
if(at.readU32()!==0xf9436b64)throw Error('Dart code fingerprint mismatch');
let hook=Interceptor.attach(at,{onEnter(){try{
 const path=str(this.context.x2);
 if(path!==target)throw Error('Unexpected OTA path');
 if(rename(from,to)!==0)throw Error('Atomic file substitution failed');
 hook.detach();Interceptor.flush();
 send({kind:'custom-file-substituted',hooksDetached:true});
}catch(e){send({kind:'pre-transfer-abort',error:String(e)});abort();}}});
send({kind:'armed',offset:'0x346bc88'});
'''.replace('TARGET',json.dumps(TARGET)).replace('STAGED',json.dumps(staged))
    script=session.create_script(source)
    with (out/'handoff.jsonl').open('a') as log:
        def on_message(message,data):
            log.write(json.dumps(dict(time=time.time(),message=message))+'\n');log.flush()
            print(json.dumps(message),flush=True)
        script.on('message',on_message)
        try:
            script.load();time.sleep(a.seconds)
        finally:session.detach()

if __name__=='__main__':main()
