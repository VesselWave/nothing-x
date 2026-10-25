import sys,pathlib,unittest
sys.path.insert(0,str(pathlib.Path(__file__).resolve().parents[1]/'tools'))
from protocol import crc16,frame,decode,features,gestures

class ProtocolTests(unittest.TestCase):
 def test_crc_known_check(self):self.assertEqual(crc16(b'123456789'),0x4b37)
 def test_captured_query(self):self.assertEqual(frame(0xc001).hex(),'55600101c000000124df')
 def test_real_firmware_payload_crc(self):
  packet=decode(bytes.fromhex('5560014240080002312e302e312e3734d835'))
  self.assertEqual(packet.payload,b'1.0.1.74');self.assertEqual(packet.crc_scope,'payload')
 def test_corrupted_response_rejected(self):
  raw=bytearray.fromhex('5560014240080002312e302e312e3734d835');raw[9]^=1
  with self.assertRaises(ValueError):decode(raw)
 def test_unchecksummed_device_event(self):
  self.assertEqual(decode(bytes.fromhex('55000103e0030000010500')).payload,b'\1\5\0')
 def test_captured_wear_settings(self):
  before=bytes.fromhex('0e010102000301070109010a000b000c010e010f011201150116011801')
  after=bytes.fromhex('0e010002000301070109010a000b000c010e010f011201150116011801')
  self.assertEqual(features(before)[1],1);self.assertEqual(features(after)[1],0)
  self.assertEqual({k:v for k,v in features(before).items() if k!=1},{k:v for k,v in features(after).items() if k!=1})
 def test_captured_dial_mapping(self):
  payload=bytes.fromhex('0f0201020902010308020107140201090b0301020903010308030107140301090b04010102040102090409020104010308040903010401071404010a17')
  result=gestures(payload);self.assertEqual(len(result),15)
  self.assertEqual([g for g in result if g['device']==4 and g['gesture']==10][0]['action'],'rotate_volume')
 def test_bad_lengths(self):
  for raw in [b'',frame(0xc001)[:-1],frame(0xc001)+b'\0']:
   with self.assertRaises(ValueError):decode(raw)
  with self.assertRaises(ValueError):gestures(b'\x02\x02\x01\x02\x09')
 def test_sequence_range(self):
  with self.assertRaises(ValueError):frame(0xc001,sequence=256)

if __name__=='__main__':unittest.main()
