"""Download current Nothing X OTA metadata captured from the app, verifying SHA-256 and size."""
import argparse,hashlib,json,pathlib,re,urllib.request
p=argparse.ArgumentParser(description=__doc__);p.add_argument('metadata',type=pathlib.Path);p.add_argument('--model',required=True);p.add_argument('--output-dir',type=pathlib.Path,default=pathlib.Path('artifacts/firmware'));a=p.parse_args()
m=json.loads(a.metadata.read_text());version=m['version']
if not re.fullmatch(r'[A-Za-z0-9._-]+',a.model) or not re.fullmatch(r'[A-Za-z0-9._-]+',version):raise SystemExit('Unsafe model or version filename')
expected=m['sha256'].lower();size_expected=int(m['fileSize'])
if not re.fullmatch(r'[a-f0-9]{64}',expected) or not 0<size_expected<=64*1024*1024:raise SystemExit('Missing or invalid server hash/size')
if not m['otaUrl'].startswith('https://'):raise SystemExit('Expected HTTPS download URL')
a.output_dir.mkdir(parents=True,exist_ok=True);dest=a.output_dir/f'{a.model}-{version}.bin';partial=dest.with_suffix('.partial');h=hashlib.sha256();size=0
with urllib.request.urlopen(m['otaUrl'],timeout=40) as response,partial.open('wb') as out:
 while chunk:=response.read(1024*1024):
  size+=len(chunk)
  if size>size_expected:raise SystemExit('Download exceeds declared size')
  out.write(chunk);h.update(chunk)
if h.hexdigest()!=expected or size!=size_expected:raise SystemExit('Download hash or size mismatch; retained .partial')
partial.replace(dest);print('VERIFIED',dest,'bytes',size,'sha256',expected)
