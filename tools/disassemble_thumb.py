"""Annotate Cortex-M Thumb disassembly with PC literals and image string targets."""
import argparse,pathlib,struct
from capstone import Cs,CS_ARCH_ARM,CS_MODE_THUMB,CS_MODE_MCLASS
from capstone.arm import ARM_OP_MEM,ARM_REG_PC
p=argparse.ArgumentParser();p.add_argument('image',type=pathlib.Path);p.add_argument('--base',type=lambda x:int(x,0),default=0x2c020000);p.add_argument('--start',type=lambda x:int(x,0),required=True);p.add_argument('--end',type=lambda x:int(x,0),required=True)
a=p.parse_args();data=a.image.read_bytes();md=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);md.detail=True;md.skipdata=True
for ins in md.disasm(data[a.start:a.end],a.base+a.start):
 note=''
 if ins.id:
  for op in ins.operands:
   if op.type==ARM_OP_MEM and op.mem.base==ARM_REG_PC:
    literal=((ins.address+4)&~3)+op.mem.disp;off=literal-a.base
    if 0<=off<=len(data)-4:
     value=struct.unpack_from('<I',data,off)[0];note=f' ; [{literal:#x}]={value:#x}'
     target=(value&~1)-a.base
     # String pointers may be odd addresses; preserve the original pointer.
     string_off=value-a.base
     if 0<=string_off<len(data):
      raw=data[string_off:string_off+180].split(b'\0',1)[0]
      if len(raw)>=5 and all(32<=c<127 or c in (9,10,13) for c in raw):note+=' '+repr(raw.decode())
 print(f'{ins.address:#010x} {ins.bytes.hex():10s} {ins.mnemonic:9s} {ins.op_str}{note}')
