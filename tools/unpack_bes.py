"""Unpack the observed BES chunked LZMA OTA container; never sends firmware."""
import argparse, hashlib, json, lzma, pathlib, re, struct, zlib

def unpack(data):
    if data[:4] != b'\xff'*4:
        raise ValueError('Missing BES container marker')
    offset=4; blocks=[]; chunks=[]
    while not data[offset:].startswith(b'CRC32_OF_IMAGE='):
        if offset+4>len(data): raise ValueError('Missing footer')
        length=struct.unpack_from('>I',data,offset)[0]; offset+=4
        if not length or length>len(data)-offset: raise ValueError('Invalid block length')
        decoder=lzma.LZMADecompressor(format=lzma.FORMAT_ALONE,memlimit=128*1024*1024)
        raw=decoder.decompress(data[offset:offset+length],max_length=8*1024*1024)
        if not decoder.eof or decoder.unused_data: raise ValueError('Incomplete or trailing LZMA stream')
        blocks.append({'offset':offset,'compressed':length,'decompressed':len(raw)})
        chunks.append(raw);offset+=length
    footer=data[offset:].decode('ascii').strip()
    match=re.fullmatch(r'CRC32_OF_IMAGE=0x([0-9A-Fa-f]+) NT_MODE_ID=0x([0-9A-Fa-f]+)(?: APP_SIZE=(\d+))?',footer)
    if not match: raise ValueError('Unrecognized footer')
    raw=b''.join(chunks)
    if match[3] is not None and len(raw)!=int(match[3]): raise ValueError('APP_SIZE mismatch')
    model=int(match[2],16)
    if model>>12!=0xb and model&0xf0==0xb0:model=((model&255)<<8)|(model>>8)
    return raw,{'model':f'{model:04X}', 'declared_size':int(match[3]) if match[3] else None, 'model_hex':match[2], 'blocks':blocks,
        'size':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),
        'footer_crc32':match[1].lower(),'raw_crc32':f'{zlib.crc32(raw):08x}',
        'footer_crc_verified':zlib.crc32(data[:offset+len(b'CRC32_OF_IMAGE=0x')])==int(match[1],16),
        'footer_crc_coverage_end':offset+len(b'CRC32_OF_IMAGE=0x'),'footer':footer}

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('image',type=pathlib.Path);p.add_argument('output',type=pathlib.Path);args=p.parse_args()
    raw,report=unpack(args.image.read_bytes());args.output.write_bytes(raw)
    args.output.with_suffix(args.output.suffix+'.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='blocks'},indent=2))
