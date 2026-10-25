#!/usr/bin/env python3
"""Build offline B187 ping experiments. Output is NOT an OTA/flashable image."""
import argparse
import hashlib
import json
from pathlib import Path

IMAGE_SHA256 = '3bcb4037056ffb6e1d1a18826b2e472bc8cdf55d047a213ceba94f2f1430ba33'
IMAGE_SIZE = 2030756
BASE = 0x2c010000


def patch_image(data, mode, level=6):
    if len(data) != IMAGE_SIZE or hashlib.sha256(data).hexdigest() != IMAGE_SHA256:
        raise ValueError('Requires the exact decompressed B187 1.0.1.74 image')
    if mode == 'mute':
        # The helper has already restored SP/LR and set the rotary flags.
        # Return instead of tail-calling media_PlayAudio; retain those flags.
        offset, before, after = 0x495a8, bytes.fromhex('dbf098b9'), bytes.fromhex('704700bf')
        scope = 'Case rotary helper normal prompts 50/51; boundary prompts remain possible'
    elif mode == 'fixed':
        if not 1 <= level <= 12:
            raise ValueError('Fixed prompt index must be 1..12')
        offset, before = 0x12447e, bytes.fromhex('15f759f8')
        after = bytes([level, 0x20, 0x00, 0xbf])  # movs r0,#level; nop
        scope = f'Prompt stream IDs 50/51: fixed volume index {level}; original cap retained'
    elif mode == 'half-index':
        # Getter returns the logical volume index (0..16 on traced paths).
        # Replaces min(v,12) with floor(v/2), not half acoustic amplitude.
        offset, before = 0x124482, bytes.fromhex('0c2828bf0c20')
        after = bytes.fromhex('400800bf00bf')  # lsrs r0,r0,#1; nop; nop
        scope = 'Prompt stream IDs 50/51: floor(current index / 2), expected input 0..16'
    else:
        raise ValueError('Unknown patch mode')
    if data[offset:offset + len(before)] != before:
        raise ValueError('Instruction precondition failed')
    patched = data[:offset] + after + data[offset + len(before):]
    report = {
        'model': 'B187', 'version': '1.0.1.74', 'mode': mode,
        'source_sha256': IMAGE_SHA256,
        'output_sha256': hashlib.sha256(patched).hexdigest(), 'size': len(patched),
        'offset': hex(offset), 'address': hex(BASE + offset),
        'before': before.hex(), 'after': after.hex(), 'scope': scope,
        'flashable': False, 'hardware_verified': False,
        'limitations': [
            'Offline decompressed code experiment only; no BES repacking or integrity repair',
            'Footer CRC, secure boot/signature acceptance and recovery remain unresolved',
            'Fixed/half-index change a prompt stream configuration, not measured sound pressure',
            'Other prompt/mixing paths and minimum/maximum tones are not covered',
        ],
    }
    return patched, report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('image', type=Path)
    parser.add_argument('--mode', required=True, choices=['mute', 'fixed', 'half-index'])
    parser.add_argument('--level', type=int, default=6, help='fixed mode index (default 6)')
    parser.add_argument('--output', type=Path, help='new offline raw image; omitted = report only')
    args = parser.parse_args()
    try:
        patched, report = patch_image(args.image.read_bytes(), args.mode, args.level)
        if args.output:
            manifest = Path(str(args.output) + '.json')
            if args.output.exists() or manifest.exists():
                raise ValueError('Output or manifest already exists; choose a new output path')
            with args.output.open('xb') as output:
                output.write(patched)
            with manifest.open('x') as output:
                json.dump(report, output, indent=2)
                output.write('\n')
        print(json.dumps(report, indent=2))
    except (OSError, ValueError) as error:
        parser.error(str(error))


if __name__ == '__main__':
    main()
