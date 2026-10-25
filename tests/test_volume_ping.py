"""Execute actual B187 Thumb code fragments; no hardware connections.

Needs the verified local image and optional `unicorn` Python package.
"""
import hashlib
from pathlib import Path
import unittest

from tools.patch_volume_ping import BASE, IMAGE_SHA256, patch_image

try:
    from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_MODE_MCLASS, UC_HOOK_CODE
    from unicorn.arm_const import UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R4, UC_ARM_REG_SP, UC_ARM_REG_LR, UC_ARM_REG_PC
except ImportError:
    Uc = None

IMAGE = Path(__file__).resolve().parents[1] / 'artifacts/firmware/B187-1.0.1.74-decompressed.bin'


class InputTests(unittest.TestCase):
    def test_reject_wrong_firmware(self):
        with self.assertRaisesRegex(ValueError, 'exact decompressed'):
            patch_image(b'wrong firmware', 'mute')


@unittest.skipUnless(Uc and IMAGE.exists(), 'Requires local B187 image and unicorn')
class B187ExecutionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = IMAGE.read_bytes()
        if hashlib.sha256(cls.original).hexdigest() != IMAGE_SHA256:
            raise AssertionError('Local firmware digest mismatch')

    def machine(self, image):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB | UC_MODE_MCLASS)
        uc.mem_map(BASE, 0x200000)
        uc.mem_write(BASE, image)
        uc.mem_map(0x20000000, 0x60000)
        uc.reg_write(UC_ARM_REG_SP, 0x2005f000)
        uc.reg_write(UC_ARM_REG_LR, (BASE + 0x1000) | 1)
        return uc

    def gain(self, image, volume, prompt):
        uc = self.machine(image)
        uc.reg_write(UC_ARM_REG_R4, prompt)
        uc.reg_write(UC_ARM_REG_R0, 0x55)
        destinations = []

        def hook(uc, address, size, unused):
            if address == 0x2c049534:
                uc.reg_write(UC_ARM_REG_R0, volume)
                uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR))
            elif address in (0x2c1343d2, 0x2c1342c4):
                destinations.append(address)
                uc.emu_stop()

        uc.hook_add(UC_HOOK_CODE, hook)
        uc.emu_start(0x2c134474 | 1, BASE + 0x200000, count=100)
        self.assertEqual(len(destinations), 1)
        return uc.reg_read(UC_ARM_REG_R0), destinations[0]

    def test_gain_curves_on_both_prompts(self):
        fixed, _ = patch_image(self.original, 'fixed', 6)
        half, _ = patch_image(self.original, 'half-index')
        for prompt in (50, 51):
            for volume in range(17):
                with self.subTest(prompt=prompt, volume=volume):
                    self.assertEqual(self.gain(self.original, volume, prompt), (min(volume, 12), 0x2c1343d2))
                    self.assertEqual(self.gain(fixed, volume, prompt), (6, 0x2c1343d2))
                    self.assertEqual(self.gain(half, volume, prompt), (volume // 2, 0x2c1343d2))
        for image in (self.original, fixed, half):
            for prompt in (0, 29, 48, 49, 52, 55, 255):
                self.assertEqual(self.gain(image, 8, prompt), (0x55, 0x2c1342c4))

    def rotary(self, image, event, volume, call):
        uc = self.machine(image)
        uc.reg_write(UC_ARM_REG_R0, event)
        prompts = []
        stopped = []

        def hook(uc, address, size, unused):
            if address == BASE + 0x1000:
                stopped.append(True)
                uc.emu_stop()
            elif address in (0x2c142e98, 0x2c049534, 0x2c04a1a8, 0x2c1348dc):
                if address == 0x2c049534:
                    uc.reg_write(UC_ARM_REG_R0, volume)
                elif address == 0x2c04a1a8:
                    uc.reg_write(UC_ARM_REG_R0, call)
                elif address == 0x2c1348dc:
                    prompts.append((uc.reg_read(UC_ARM_REG_R0), uc.reg_read(UC_ARM_REG_R1)))
                uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR))

        uc.hook_add(UC_HOOK_CODE, hook)
        uc.emu_start(0x2c059568 | 1, BASE + 0x200000, count=100)
        self.assertTrue(stopped)
        self.assertEqual(uc.reg_read(UC_ARM_REG_SP), 0x2005f000)
        return prompts, bytes(uc.mem_read(0x2002181c, 2))

    def test_mute_preserves_helper_flags_and_return(self):
        muted, _ = patch_image(self.original, 'mute')
        for event in (26, 27):
            for volume in range(17):
                for call in (0, 1):
                    with self.subTest(event=event, volume=volume, call=call):
                        original, flags = self.rotary(self.original, event, volume, call)
                        expected = (event == 26 and volume <= 15) or (event == 27 and volume > 0 and not (call and volume == 1))
                        self.assertEqual(original, [(50 if event == 26 else 51, 0)] if expected else [])
                        self.assertEqual(self.rotary(muted, event, volume, call), ([], flags))
                        self.assertEqual(flags, b'\x01\x01')

    def test_patch_boundaries_and_hash_guard(self):
        for mode in ('mute', 'fixed', 'half-index'):
            patched, report = patch_image(self.original, mode)
            start = int(report['offset'], 16)
            end = start + len(bytes.fromhex(report['before']))
            self.assertEqual(len(patched), len(self.original))
            self.assertEqual(patched[:start], self.original[:start])
            self.assertEqual(patched[end:], self.original[end:])
            with self.assertRaises(ValueError):
                patch_image(patched, mode)
        for level in (0, 13):
            with self.assertRaises(ValueError):
                patch_image(self.original, 'fixed', level)


if __name__ == '__main__':
    unittest.main()
