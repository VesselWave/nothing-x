"""Collapse firmware key-hold repeats into one automation trigger."""
class EventGate:
    def __init__(self, quiet_seconds=1.5):
        if quiet_seconds<0:raise ValueError('Quiet interval must be nonnegative')
        self.quiet_seconds=quiet_seconds
        self.last_seen={}
    def accept(self,payload,now):
        previous=self.last_seen.get(payload)
        self.last_seen[payload]=now
        return previous is None or now-previous>=self.quiet_seconds
