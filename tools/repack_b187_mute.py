"""Build the exact B187 mute experiment with repaired inner and outer CRCs. No device I/O."""
import argparse
import hashlib
import json
import lzma
from pathlib import Path
import re
import struct
import zlib

from tools.unpack_bes import unpack
from tools.patch_volume_ping import patch_image

STOCK_SHA = '53573bd9e3a1bf6d65b7bed1e121bacb46cacfcd0036a2484bf33e0b3ce44f3b'
FILTER = dict(id=lzma.FILTER_LZMA1, dict_size=67108864, lc=3, lp=0, pb=2,
              nice_len=64, mf=lzma.MF_BT4, mode=lzma.MODE_NORMAL)

def build(stock):
    if hashlib.sha256(stock).hexdigest() != STOCK_SHA:
        raise ValueError('Requires exact stock B187 1.0.1.74 container')
    raw, info = unpack(stock)
    if not info['footer_crc_verified'] or info['model'] != 'B187':
        raise ValueError('Stock footer integrity/model mismatch')
    matches = list(re.finditer(rb'CRC32_OF_IMAGE=0x([0-9A-Fa-f]{8})', raw))
    if len(matches) != 1:
        raise ValueError('Expected one populated inner CRC')
    start, end = matches[0].span(1)
    if start != 0x1efc4d or zlib.crc32(raw[:start]) != int(raw[start:end], 16):
        raise ValueError('Stock inner CRC mismatch')
    patched, patch = patch_image(raw, 'mute')
    patched = patched[:start] + f'{zlib.crc32(patched[:start]):08X}'.encode() + patched[end:]
    output = bytearray(stock[:4]); roundtrip = bytearray(stock[:4])
    cursor = 0; changed_blocks = []
    for i, block in enumerate(info['blocks']):
        length = block['decompressed']
        original = stock[block['offset']:block['offset']+block['compressed']]
        recompressed = lzma.compress(raw[cursor:cursor+length], format=lzma.FORMAT_ALONE, filters=[FILTER])
        if recompressed != original:
            raise ValueError(f'Stock byte-identical compression failed at block {i}')
        roundtrip.extend(struct.pack('>I',len(recompressed))+recompressed)
        part = patched[cursor:cursor+length]
        packed = original
        if part != raw[cursor:cursor+length]:
            packed = lzma.compress(part, format=lzma.FORMAT_ALONE, filters=[FILTER])
            changed_blocks.append(i)
        output.extend(struct.pack('>I',len(packed))+packed)
        cursor += length
    footer_offset = info['blocks'][-1]['offset'] + info['blocks'][-1]['compressed']
    footer = stock[footer_offset:]
    roundtrip.extend(footer)
    if bytes(roundtrip) != stock:
        raise ValueError('Full stock roundtrip mismatch')
    prefix = b'CRC32_OF_IMAGE=0x'
    output.extend(prefix)
    output.extend(f'{zlib.crc32(output):08X}'.encode()+footer[len(prefix)+8:])
    result = bytes(output)
    decoded, check = unpack(result)
    differences = [i for i,(a,b) in enumerate(zip(raw,decoded)) if a!=b]
    allowed = set(range(0x495a8,0x495ac)) | set(range(start,end))
    if decoded != patched or not check['footer_crc_verified'] or not set(differences)<=allowed:
        raise ValueError('Rebuilt image validation failed')
    if len(result)>len(stock) or check['model']!=info['model']:
        raise ValueError('Image grew beyond tested stock size or changed model')
    report = dict(mode='mute', version='1.0.1.74', model='B187',
                  source_sha256=STOCK_SHA, sha256=hashlib.sha256(result).hexdigest(),
                  size=len(result), raw_sha256=hashlib.sha256(decoded).hexdigest(),
                  raw_size=len(decoded), stock_roundtrip_identical=True,
                  inner_crc_verified=zlib.crc32(decoded[:start])==int(decoded[start:end],16),
                  inner_crc=decoded[start:end].decode(), outer_crc=check['footer_crc32'],
                  outer_crc_verified=check['footer_crc_verified'], changed_blocks=changed_blocks,
                  changed_raw_offsets=[hex(i) for i in differences], patch=patch,
                  hardware_verified=False, device_acceptance_unknown=True)
    return result, report

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('stock',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
    result, report=build(a.stock.read_bytes())
    manifest=Path(str(a.output)+'.json')
    if a.output.exists() or manifest.exists():p.error('Output already exists')
    a.output.write_bytes(result);manifest.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='patch'},indent=2))
