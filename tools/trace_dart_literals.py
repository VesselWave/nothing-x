"""Annotate ARM64 AOT code with Dart pool references and known method targets."""
import argparse,pathlib,re
from capstone import Cs,CS_ARCH_ARM64,CS_MODE_ARM
from elftools.elf.elffile import ELFFile
p=argparse.ArgumentParser();p.add_argument('start',type=lambda x:int(x,0));p.add_argument('size',type=lambda x:int(x,0));a=p.parse_args()
pool={int(m[1],16):m[2] for m in re.finditer(r'^\[pp\+0x([0-9a-f]+)\] (.*)$',pathlib.Path('research/flutter-analysis/pp.txt').read_text(),re.M)}
symbols={}
for f in pathlib.Path('research/flutter-analysis/asm').rglob('*.dart'):
 text=f.read_text();lines=text.splitlines()
 for i,l in enumerate(lines):
  m=re.search(r'addr: 0x([0-9a-f]+)',l)
  if m:symbols[int(m[1],16)]=f.name+': '+lines[i-1].strip()
with open('research/native/libapp.so','rb') as f:
 elf=ELFFile(f)
 for seg in elf.iter_segments():
  if seg['p_type']=='PT_LOAD' and seg['p_vaddr']<=a.start<seg['p_vaddr']+seg['p_filesz']:
   f.seek(seg['p_offset']+a.start-seg['p_vaddr']);data=f.read(a.size);break
 else:raise ValueError('Address outside ELF')
regs={'x27':0}
for ins in Cs(CS_ARCH_ARM64,CS_MODE_ARM).disasm(data,a.start):
 note='';op=ins.op_str
 if ins.mnemonic=='add':
  m=re.fullmatch(r'(x\d+), (x\d+), #(0x[0-9a-f]+|[0-9]+)(, lsl #12)?',op)
  if m and m[2] in regs:regs[m[1]]=regs[m[2]]+(int(m[3],0)<<(12 if m[4] else 0))
 if ins.mnemonic in ('ldr','ldur'):
  m=re.search(r'\[(x\d+)(?:, #(?:0x([0-9a-f]+)|(\d+)))?\]',op)
  if m and m[1] in regs:
   offset=regs[m[1]]+(int(m[2],16) if m[2] else int(m[3] or 0));note=pool.get(offset,'')
 if ins.mnemonic=='bl':note=symbols.get(int(op.lstrip('#'),16),'')
 print(f'{ins.address:x} {ins.mnemonic:7} {op:35} {note}')
