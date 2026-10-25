#!/usr/bin/env python3
"""Offline triage only. Does not alter firmware or connect to hardware."""
import argparse,hashlib,json,math,pathlib,re,struct,zlib
parser=argparse.ArgumentParser();parser.add_argument('image',type=pathlib.Path);parser.add_argument('--output',type=pathlib.Path)
args=parser.parse_args();data=args.image.read_bytes()
if len(data)<8:parser.error('Image is too short')
# Mirrors OTAFileHelper.getFileData(unit=256), not an inferred image signature scheme.
transfer_size=math.ceil((len(data)-4)/256)*256
transfer=data[:transfer_size].ljust(transfer_size,b'\0')
strings=[]
for match in re.finditer(rb'[ -~]{6,}',data):
 text=match.group().decode('ascii')
 if re.search(r'tone|prompt|beep|volume|gain|avrcp|in.?ear|wear|in.?box|in.?case|charger|BEST|B187|B172',text,re.I):
  strings.append({'offset':hex(match.start()),'text':text[:300]})
vectors=[]
for offset in range(0,min(len(data)-8,1024*1024),4):
 sp,pc=struct.unpack_from('<II',data,offset)
 if 0x20000000<=sp<0x21000000 and sp%8==0 and pc&1 and (0x08000000<=pc<0x10000000 or 0x20000000<=pc<0x30000000):
  vectors.append({'offset':hex(offset),'initial_sp':hex(sp),'reset_vector':hex(pc)})
report={'file':str(args.image),'size':len(data),'sha256':hashlib.sha256(data).hexdigest(),'first_32_bytes':data[:32].hex(),'trailing_4_bytes':data[-4:].hex(),'app_bes_transfer_size':transfer_size,'app_bes_transfer_crc32':f'{zlib.crc32(transfer):08x}','candidate_vector_tables_unverified':vectors[:100],'interesting_strings':strings[:1000],'limitations':'Generic triage. Vector candidates and prompt strings require disassembly and cross references. CRC does not establish whether firmware signatures are enforced.'}
text=json.dumps(report,indent=2)+'\n'
if args.output:args.output.write_text(text)
else:print(text,end='')
