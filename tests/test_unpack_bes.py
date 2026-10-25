import lzma, struct, unittest
from tools.unpack_bes import unpack

class ContainerTests(unittest.TestCase):
    def container(self, size=None):
        raw=b'reference image'*100
        chunks=[raw[:500],raw[500:]]
        data=b'\xff'*4
        for chunk in chunks:
            packed=lzma.compress(chunk,format=lzma.FORMAT_ALONE)
            data+=struct.pack('>I',len(packed))+packed
        return raw,data+f'CRC32_OF_IMAGE=0x12345678 NT_MODE_ID=0xB172 APP_SIZE={len(raw) if size is None else size}\n'.encode()
    def test_multiblock_and_unverified_footer(self):
        raw,data=self.container();actual,report=unpack(data)
        self.assertEqual(actual,raw);self.assertEqual(len(report['blocks']),2)
        self.assertEqual(report['model'],'B172');self.assertFalse(report['footer_crc_verified'])
    def test_bad_size(self):
        with self.assertRaisesRegex(ValueError,'APP_SIZE'):unpack(self.container(1)[1])
    def test_truncated(self):
        with self.assertRaises(ValueError):unpack(self.container()[1][:20])
    def test_bad_marker(self):
        with self.assertRaises(ValueError):unpack(b'bad!')

    def test_b187_footer_without_declared_size(self):
        raw,data=self.container()
        data=data[:data.index(b'CRC32_OF_IMAGE=')]+b'CRC32_OF_IMAGE=0xA5F91CBA NT_MODE_ID=0x87b1\n'
        actual,report=unpack(data)
        self.assertEqual(actual,raw);self.assertEqual(report['model'],'B187')
        self.assertIsNone(report['declared_size'])
