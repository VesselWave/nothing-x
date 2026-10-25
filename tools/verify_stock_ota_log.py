#!/usr/bin/env python3
"""Compare an app-owned BES OTA log with the verified stock B187 container.

Nothing's logger truncates long packets to 100 bytes. This verifies the logged
prefix of each packet and the app file-info/config values, not a full wire hash.
No device access or firmware writes.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import zlib

STOCK_SHA256 = '53573bd9e3a1bf6d65b7bed1e121bacb46cacfcd0036a2484bf33e0b3ce44f3b'


def verify(image, log, expected_sha256=STOCK_SHA256):
    if hashlib.sha256(image).hexdigest() != expected_sha256:
        raise ValueError('Requires the server-verified stock B187 container or an explicitly pinned experiment hash')
    size = ((len(image) - 4 + 255) // 256) * 256
    transfer = image[:size].ljust(size, b'\0')
    expected_info = b'BEST' + struct.pack('<II', size, zlib.crc32(transfer))
    # OTAHelper config: three trailer bytes, default zero fields and CRC.
    config = bytearray(92)
    struct.pack_into('<I', config, 0, 88)
    config[4:7] = image[-4:-1]
    struct.pack_into('<I', config, 88, zlib.crc32(config[:88]))
    marker = 'onMethodCall method:invokeStartOTA'
    lines = log.splitlines()
    starts = [i for i, line in enumerate(lines) if marker in line]
    if len(starts) != 1:
        raise ValueError('Requires exactly one app invokeStartOTA run in the log')
    offset = 0
    prefixes_checked = 0
    truncated = 0
    segment_start = 0
    segment_checks = 0
    controls = []
    failures = []
    for line in lines[starts[0]:]:
        match = re.search(r'(-> Write|<- Receive) command=0x[0-9a-fA-F]+,\[([0-9a-fA-F ]+)\]\((\d+)\)', line)
        if not match:
            continue
        packet = bytes.fromhex(match[2])
        declared = int(match[3])
        if not packet or len(packet) > declared:
            raise ValueError('Invalid logged frame length')
        outgoing = match[1] == '-> Write'
        cmd = packet[0]
        if outgoing and cmd == 0x85:
            payload_size = declared - 1
            prefix = packet[1:]
            if offset + payload_size > len(transfer) or prefix != transfer[offset:offset+len(prefix)]:
                failures.append(f'Packet prefix mismatch at transfer offset {offset:#x}; possible retry/gap')
            offset += payload_size
            prefixes_checked += len(prefix)
            truncated += len(packet) < declared
        elif cmd in range(0x80, 0x94):
            controls.append({'direction': 'tx' if outgoing else 'rx', 'command': hex(cmd),
                             'hex': packet.hex(), 'declared_length': declared,
                             'complete': len(packet) == declared})
            if outgoing and cmd in (0x80, 0x8e) and packet[1:] != expected_info:
                failures.append('File-info/version request differs from stock size and transfer CRC')
            if outgoing and cmd == 0x86 and packet[1:] != config:
                failures.append('OTA config differs from original app trailer-byte/CRC construction')
            if outgoing and cmd == 0x82:
                expected_crc = zlib.crc32(transfer[segment_start:offset])
                if packet[1:] != b'BEST' + struct.pack('<I', expected_crc):
                    failures.append(f'Segment CRC differs at transfer offset {offset:#x}')
                segment_start = offset
                segment_checks += 1
            if not outgoing and cmd in (0x83, 0x84, 0x93) and packet[1:] != b'\x01':
                failures.append(f'Non-success device response {packet.hex()}')
    finish_ok = any(x['direction'] == 'rx' and x['hex'] == '8401' for x in controls)
    overwrite_ok = any(x['direction'] == 'rx' and x['hex'] == '9301' for x in controls)
    return {
        'firmware_sha256': expected_sha256,
        'expected_transfer_size': size,
        'expected_transfer_crc32': f'{zlib.crc32(transfer):08x}',
        'logged_data_payload_size': offset,
        'logged_prefix_bytes_checked': prefixes_checked,
        'truncated_data_packet_count': truncated,
        'segment_crc_requests_checked': segment_checks,
        'device_image_check_succeeded': finish_ok,
        'device_overwrite_confirmation_succeeded': overwrite_ok,
        'data_lengths_cover_entire_transfer': offset == size,
        'logged_prefixes_and_control_values_match': not failures,
        'completed_stock_transfer_verified': expected_sha256 == STOCK_SHA256 and offset == size and finish_ok and overwrite_ok and not failures,
        'completed_transfer_verified': offset == size and finish_ok and overwrite_ok and not failures,
        'failures': failures,
        'control_frames': controls,
        'limitation': 'App logs truncate long frames. Not a full Bluetooth wire capture or independent flash readback.',
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('image', type=Path)
    parser.add_argument('log', type=Path)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--expected-sha256', default=STOCK_SHA256, help='Explicitly pin a custom experiment; default requires exact stock')
    args = parser.parse_args()
    report = verify(args.image.read_bytes(), args.log.read_text(errors='replace'), args.expected_sha256)
    text = json.dumps(report, indent=2) + '\n'
    if args.output:
        args.output.write_text(text)
    print(json.dumps({k: v for k, v in report.items() if k != 'control_frames'}, indent=2))
    if report['failures']:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
