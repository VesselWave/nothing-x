"""Query the app's OTA metadata using embedded app credentials from the extracted APK.
Requires pyelftools. Never prints or writes those credentials. Downloads nothing unless --download.
"""
import argparse,hashlib,json,pathlib,secrets,string,struct,time,urllib.parse,urllib.request,uuid
from elftools.elf.elffile import ELFFile

parser=argparse.ArgumentParser()
parser.add_argument('--model',default='B187')
parser.add_argument('--version',default='1.0.1.74')
parser.add_argument('--download',action='store_true')
parser.add_argument('--rollback-latest',action='store_true',help='Query the app-documented rollback=latest metadata selector; never installs firmware')
parser.add_argument('--region',choices=['global','cn'],default='global')
parser.add_argument('--mac-from-capture',type=pathlib.Path,help='Use captured device MAC hash for rollout eligibility without printing the address')
args=parser.parse_args()
with open('research/native/libnative-lib.so','rb') as stream:
 elf=ELFFile(stream)
 def read_at(address,size):
  for seg in elf.iter_segments():
   if seg['p_type']=='PT_LOAD' and seg['p_vaddr']<=address<seg['p_vaddr']+seg['p_filesz']:
    off=seg['p_offset']+address-seg['p_vaddr'];stream.seek(off);return stream.read(size)
  raise ValueError('Address outside ELF')
 def embedded(name):
  symbol=elf.get_section_by_name('.dynsym').get_symbol_by_name(name)[0]
  address=symbol['st_value'];pointer=struct.unpack('<Q',read_at(address,8))[0]
  for section in elf.iter_sections():
   if section['sh_type']=='SHT_RELA':
    for reloc in section.iter_relocations():
     if reloc['r_offset']==address and reloc['r_info_type']==1027:pointer=reloc['r_addend']
  return read_at(pointer,256).split(b'\0',1)[0].decode()
 key=embedded('app_api_key_ota');secret=embedded('app_api_secret_ota')
nonce=''.join(secrets.choice(string.digits+string.ascii_lowercase[:25]) for _ in range(11))
now=str(int(time.time()*1000));mobile=str(uuid.uuid4())
mac_hash=hashlib.md5(mobile.encode()).hexdigest()
if args.mac_from_capture:
 payload=bytes.fromhex(args.mac_from_capture.read_text().strip())
 record=next(line.split(',')[2] for line in payload[1:].decode().splitlines() if line.startswith('2,6,'))
 mac=':'.join(reversed([record[i:i+2] for i in range(0,len(record),2)]))
 mac_hash=hashlib.md5(mac.upper().encode()).hexdigest()
params={'device_model':args.model,'version':args.version,'mobile_id':mobile,'language':'en','mac_address':mac_hash}
signed={**params,'timestamp':now,'nonce':nonce}
# Mirrors OTANetHelper: sort keys, then key entries by value (duplicate values collapse).
dedup={v:(k,v) for k,v in sorted(signed.items())}
sign=hashlib.sha256((key+''.join(k+v for k,v in dedup.values())+secret).encode()).hexdigest()
host='iota.nothingcn.com' if args.region=='cn' else 'iota.nothing.tech'
query={**params,**({'rollback':'latest'} if args.rollback_latest else {})}
url='https://'+host+'/api/v2/firmware/version?'+urllib.parse.urlencode(query)
req=urllib.request.Request(url,headers={'appid':key,'timestamp':now,'nonce':nonce,'sign':sign})
try:
 with urllib.request.urlopen(req,timeout=30) as response: body=response.read()
except urllib.error.HTTPError as error:
 out=pathlib.Path('artifacts/firmware');out.mkdir(parents=True,exist_ok=True)
 (out/'last-error.json').write_text(json.dumps({'http_status':error.code,'host':host,'model':args.model,'version':args.version,'time':int(time.time())},indent=2)+'\n')
 print('OTA metadata HTTP status:',error.code)
 try:
  detail=json.loads(error.read());print(json.dumps({k:v for k,v in detail.items() if k in ('message','status_code','error','code')},indent=2))
 except Exception:pass
 raise SystemExit(1)
out=pathlib.Path('artifacts/firmware');out.mkdir(parents=True,exist_ok=True)
(out/(args.model+'-'+args.region+'-'+args.version+('-rollback' if args.rollback_latest else '')+'-metadata.json')).write_bytes(body)
parsed=json.loads(body)
def redact_urls(obj):
 if isinstance(obj,dict):return {k:redact_urls(v) for k,v in obj.items()}
 if isinstance(obj,list):return [redact_urls(v) for v in obj]
 if isinstance(obj,str) and obj.startswith('https://'):return obj.split('?',1)[0]
 return obj
print(json.dumps(redact_urls(parsed),indent=2))
if args.download:
 def images(obj):
  if isinstance(obj,dict):
   if isinstance(obj.get('link'),str) and obj['link'].startswith('https://'):yield obj
   for val in obj.values():yield from images(val)
  elif isinstance(obj,list):
   for val in obj:yield from images(val)
 for index,image in enumerate(images(parsed)):
  expected=image.get('sha_256','').lower()
  if len(expected)!=64 or any(c not in string.hexdigits for c in expected):
   raise SystemExit('No valid server SHA-256; refusing unverified download')
  name=pathlib.PurePosixPath(urllib.parse.urlparse(image['link']).path).name or 'firmware.bin'
  dest=out/f'{args.model}-{index}-{name}';partial=dest.with_suffix(dest.suffix+'.partial')
  digest=hashlib.sha256();size=0
  with urllib.request.urlopen(image['link'],timeout=60) as response,partial.open('wb') as target:
   while chunk:=response.read(1024*1024):
    size+=len(chunk)
    if size>512*1024*1024:raise SystemExit('Unexpected firmware size')
    target.write(chunk);digest.update(chunk)
  if digest.hexdigest()!=expected:raise SystemExit('SHA-256 mismatch; downloaded file left as .partial')
  if image.get('file_size') and size!=int(image['file_size']):raise SystemExit('Size mismatch')
  partial.replace(dest);print(dest,'sha256',expected)
