import pathlib,sys,unittest
sys.path.insert(0,str(pathlib.Path(__file__).resolve().parents[1]/'tools'))
from event_gate import EventGate
class EventGateTests(unittest.TestCase):
 def test_hold_is_one_action(self):
  gate=EventGate()
  self.assertEqual([gate.accept('1f',t) for t in [0,1,2,3,5,6]],[True,False,False,False,True,False])
 def test_distinct_events_independent(self):
  gate=EventGate();self.assertTrue(gate.accept('1f',0));self.assertTrue(gate.accept('20',.1))
 def test_explicit_repeat_mode(self):
  gate=EventGate(0);self.assertTrue(gate.accept('1f',0));self.assertTrue(gate.accept('1f',.1))
