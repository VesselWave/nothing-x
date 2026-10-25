"""Validate the verifier against the local completed capture and damaged copies."""
from pathlib import Path
import re
import unittest

from tools.verify_stock_ota_log import verify

ROOT = Path(__file__).resolve().parents[1]
IMAGE = ROOT / 'artifacts/firmware/B187-1.0.1.74.bin'
LOG = ROOT / 'artifacts/reflash/native-transfer.log'


class IdentityTests(unittest.TestCase):
    def test_rejects_nonstock_image(self):
        with self.assertRaisesRegex(ValueError, 'server-verified'):
            verify(b'wrong image', '')


@unittest.skipUnless(IMAGE.exists() and LOG.exists(), 'Requires local stock image and completed capture')
class CaptureTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.image = IMAGE.read_bytes()
        cls.log = LOG.read_text(errors='replace')

    def test_completed_capture(self):
        report = verify(self.image, self.log)
        self.assertTrue(report['completed_stock_transfer_verified'])
        self.assertEqual(report['segment_crc_requests_checked'], 100)
        self.assertEqual(report['logged_data_payload_size'], 1196288)

    def test_corrupt_data_prefix_detected(self):
        bad, count = re.subn(r'(-> Write command=0x8B,\[85 )ff', r'\g<1>fe', self.log, count=1)
        self.assertEqual(count, 1)
        self.assertFalse(verify(self.image, bad)['completed_stock_transfer_verified'])

    def test_missing_packet_detected(self):
        bad, count = re.subn(r'^.*-> Write command=0x8B,\[85 .*\n', '', self.log, count=1, flags=re.M)
        self.assertEqual(count, 1)
        self.assertFalse(verify(self.image, bad)['completed_stock_transfer_verified'])

    def test_failed_final_device_check_detected(self):
        bad, count = re.subn(r'(<- Receive command=0x84,\[84 )01', r'\g<1>00', self.log, count=1)
        self.assertEqual(count, 1)
        self.assertFalse(verify(self.image, bad)['completed_stock_transfer_verified'])


if __name__ == '__main__':
    unittest.main()
