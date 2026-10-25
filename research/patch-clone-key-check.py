import pathlib,struct
from elftools.elf.elffile import ELFFile
from capstone import Cs,CS_ARCH_ARM64,CS_MODE_ARM
src=pathlib.Path('research/native/libnative-lib.so');raw=bytearray(src.read_bytes())
with src.open('rb') as f:
 elf=ELFFile(f)
 def off(v):
  for s in elf.iter_segments():
   if s['p_type']=='PT_LOAD' and s['p_vaddr']<=v<s['p_vaddr']+s['p_filesz']:return s['p_offset']+v-s['p_vaddr']
 for sym in elf.get_section_by_name('.dynsym').iter_symbols():
  if sym.name.startswith('Java_com_nothing_event_log_cpp_AppKeyUtils_string'):
   start=sym['st_value'];code=raw[off(start):off(start)+sym['st_size']]
   for i in Cs(CS_ARCH_ARM64,CS_MODE_ARM).disasm(code,start):
    if i.mnemonic=='cbz' and i.op_str.startswith('w0,'):
     target=int(i.op_str.split('#')[1],16);word=0x14000000|(((target-i.address)//4)&0x3ffffff)
     struct.pack_into('<I',raw,off(i.address),word);print('Patched clone signature exception path:',sym.name.rsplit('_',1)[1]);break
pathlib.Path('research/instrumented-apk/lib/arm64-v8a/libnative-lib.so').write_bytes(raw)
