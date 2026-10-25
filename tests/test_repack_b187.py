import hashlib
from pathlib import Path
import unittest
import zlib
from tools.repack_b187_mute import build
from tools.unpack_bes import unpack

STOCK=Path('artifacts/firmware/B187-1.0.1.74.bin')

class GuardTests(unittest.TestCase):
    def test_reject_unknown_container(self):
        with self.assertRaises(ValueError):build(b'not the pinned image')

@unittest.skipUnless(STOCK.exists(), 'Local stock artifact unavailable')
class RepackTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.stock=STOCK.read_bytes();cls.image,cls.report=build(cls.stock)

    def test_roundtrip_and_decoded_change_boundary(self):
        before,_=unpack(self.stock);after,info=unpack(self.image)
        self.assertTrue(self.report['stock_roundtrip_identical'])
        self.assertTrue(info['footer_crc_verified'])
        self.assertEqual(len(before),len(after))
        self.assertEqual(after[0x495a8:0x495ac],bytes.fromhex('704700bf'))
        allowed=set(range(0x495a8,0x495ac))|set(range(0x1efc4d,0x1efc55))
        self.assertLessEqual({i for i,(a,b) in enumerate(zip(before,after)) if a!=b},allowed)
        self.assertEqual(zlib.crc32(after[:0x1efc4d]),int(after[0x1efc4d:0x1efc55],16))
        self.assertEqual(self.report['changed_blocks'],[2,15])
        self.assertLessEqual(len(self.image),len(self.stock))

    def test_outer_checksum_corruption_detected(self):
        broken=bytearray(self.image);pos=broken.rindex(b'CRC32_OF_IMAGE=0x')+17
        broken[pos]=ord('0') if broken[pos]!=ord('0') else ord('1')
        _,info=unpack(bytes(broken));self.assertFalse(info['footer_crc_verified'])

    def test_source_bitflip_rejected(self):
        broken=bytearray(self.stock);broken[100]^=1
        with self.assertRaises(ValueError):build(bytes(broken))
