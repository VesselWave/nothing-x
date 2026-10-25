import pathlib,xml.etree.ElementTree as ET,shutil,lzma,json,lief
root=pathlib.Path('research/instrumented-apk');a='{http://schemas.android.com/apk/res/android}';ET.register_namespace('android',a[1:-1]);p=root/'AndroidManifest.xml';tree=ET.parse(p);m=tree.getroot();old=m.get('package');new=old+'.lab';m.set('package',new)
for k in [a+'requiredSplitTypes',a+'splitTypes']:m.attrib.pop(k,None)
app=m.find('application');app.set(a+'label','Nothing X Lab');app.set(a+'debuggable','true');app.set(a+'extractNativeLibs','true')
for node in m.iter():
 name=node.get(a+'name')
 if name and name.startswith('.') and node.tag in ['application','activity','activity-alias','service','receiver','provider']:node.set(a+'name',old+name)
 if node.tag=='activity-alias' and node.get(a+'targetActivity','').startswith('.'):node.set(a+'targetActivity',old+node.get(a+'targetActivity'))
 if node.get(a+'authorities'):node.set(a+'authorities',node.get(a+'authorities')+'.lab')
for n in list(app):
 if n.tag=='meta-data' and n.get(a+'name','').startswith('com.android.vending.splits'):app.remove(n)
# Give clone-owned signature permissions unique names.
permissions={n.get(a+'name') for n in m.findall('permission')}
for node in m.iter():
 for attr in [a+'name',a+'permission',a+'readPermission',a+'writePermission']:
  if node.get(attr) in permissions:node.set(attr,node.get(attr)+'.lab')
tree.write(p,encoding='utf-8',xml_declaration=True)
lib=root/'lib/arm64-v8a';lib.mkdir(parents=True,exist_ok=True)
for f in pathlib.Path('research/native').glob('*.so'):shutil.copy2(f,lib/f.name)
(lib/'libnothingxgadget.so').write_bytes(lzma.decompress(pathlib.Path('research/tools/frida-gadget.so.xz').read_bytes()))
(lib/'libnothingxgadget.config.so').write_text(json.dumps({'interaction':{'type':'listen','address':'127.0.0.1','port':27044,'on_load':'resume'}}))
binary=lief.parse(str(lib/'libflutter.so'));binary.add_library('libnothingxgadget.so');binary.write(str(lib/'libflutter.so'))
print('Prepared isolated package',new)
