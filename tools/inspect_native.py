from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN
with open('research/native/libnative-lib.so','rb') as stream:
 elf=ELFFile(stream)
 symbols=elf.get_section_by_name('.dynsym')
 for sym in symbols.iter_symbols():
  if sym.name in ('app_api_key_ota','app_api_secret_ota'):
   print(sym.name,hex(sym['st_value']),sym['st_size'],sym['st_info']['type'])
  if sym.name.endswith(('AppKeyUtils_stringOTAAppKey','AppKeyUtils_stringOTAAppSecret')):
   sec=elf.get_section(sym['st_shndx']);off=sym['st_value']-sec['sh_addr'];data=sec.data()[off:off+sym['st_size']]
   print(sym.name)
   for ins in Cs(CS_ARCH_ARM64,CS_MODE_LITTLE_ENDIAN).disasm(data,sym['st_value']): print(hex(ins.address),ins.mnemonic,ins.op_str)
