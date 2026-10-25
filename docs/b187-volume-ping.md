# B187 wheel ping: REA findings and offline patch experiments

The matching **B187 1.0.1.74** contains a separate case-wheel prompt helper
and an explicit volume-dependent prompt stream setting. Three offline code
experiments now exist: mute normal wheel pings, fix their volume index, or
halve the index slope. The later [mute OTA attempt](b187-custom-flash.md)
was accepted and rebooted; the user confirmed volume changes with no normal
wheel ping. The other
variants remain offline experiments.

## Target and analysis

Input: `artifacts/firmware/B187-1.0.1.74-decompressed.bin`, 2,030,756 bytes,
SHA-256 `3bcb4037056ffb6e1d1a18826b2e472bc8cdf55d047a213ceba94f2f1430ba33`.
Acquisition and container provenance are in [emulator-firmware.md](emulator-firmware.md#b187-acquisition-succeeded).

REA **6.7.0** was run through its CLI with Rizin **0.9.1**. No MCP client
configuration was changed. Rizin was obtained through Nix; Capstone 5.0.9
provided a second instruction decoder. Unicorn 2.1.4 executed selected Thumb
fragments with external callees stubbed. This is static analysis plus bounded
CPU emulation, not full firmware or hardware execution.

The B187 image base is **0x2c010000**, supported by exact embedded string
pointers: `qc_box_control_rotary_volume` at file offset `0x13b333` is referenced
as `0x2c14b333` by the literal at `0x495c4`. Other volume/prompt string pointers
agree. The B172 reference's base and offsets must not be reused. Some stored
function pointers use a `0x0c...` alias; this analysis uses the corresponding
`0x2c...` code mapping for direct calls.

## Wheel prompt path

`qc_bt_key_event_handle_callback` at **0x2c046fac** calls the general key action
processor at `0x2c058540` (call at `0x2c047082`). Afterward it checks source
device 4 and calls `qc_box_control_rotary_volume` at **0x2c059568** (call at
`0x2c04708e`). The helper:

- Accepts raw events 26/27. These are internal event values, not app gesture
  IDs or the saved rotary operation 23.
- Sets bytes `0x2002181c` and `0x2002181d` to 1 through setters
  `0x2c0587bc` and `0x2c0587d4`.
- Reads `qc_get_curr_volume` at **0x2c049534**.
- For event 26, requests prompt **50** when volume is at most 15.
- For event 27, requests prompt **51** when volume is nonzero, except the
  call-context volume-1 branch.
- Restores its stack and LR, then tail-calls **media_PlayAudio at 0x2c1348dc**
  through **0x2c0595a8**, with the second argument zero.

The helper itself does not update media volume. Its flag writes matter:
the general key-action branches and generic volume handlers also inspect
these bytes to coordinate/suppress step prompts. The mute experiment preserves
the helper's flag writes and return sequence and replaces only its final
prompt tail-call. Skipping the whole helper would change that coordination.
Minimum/maximum warnings elsewhere can still play. Static separation supports
preserving wheel volume control, but that behavior remains untested on buds.

## Why the ping changes loudness

`app_play_audio_onoff` at **0x2c1340f8** prepares the prompt stream. For IDs
**50/51**, the branch at **0x2c134474** calls `qc_get_curr_volume`, then computes:

```text
prompt_volume_index = min(current_volume_index, 12)
```

The instructions are:

```text
0x2c13447e  15f759f8  bl    0x2c049534
0x2c134482  0c28      cmp   r0, #12
0x2c134484  28bf      it    hs
0x2c134486  0c20      movhs r0, #12
0x2c134488  a3e7      b     0x2c1343d2
0x2c1343d2            strb  r0, [sp, #0x4f]
```

The stream configuration starts at `sp+0x38`, making this byte field `+0x17`.
`af_stream_setup` at **0x2c13199c** reads configuration byte `+0x17` at
`0x2c131abe`/`0x2c131b46`, logs it as `current vol`, and forwards it to codec
setup. This corroborates that the branch controls volume, rather than pitch.
`qc_get_curr_volume` chooses HFP or A2DP volume from current stream state,
with fallback index 8.

Other prompt IDs keep their existing default configuration (normally index 6
in this setup path); find-my-buds ID 55 has its own handling. These findings
establish a concrete explanation for volume-dependent ping loudness in this
stream path. They do not establish a complete acoustic gain curve or which
alternative mixing paths run under every playback/call state.

## Patch candidates

All offsets below refer to the exact **decompressed** input above.

| Mode | File offset | Original bytes | Replacement | Effect in traced code |
| --- | --- | --- | --- | --- |
| `mute` | `0x495a8` | `dbf098b9` | `704700bf` | Return instead of requesting normal wheel prompt; preserve helper flags |
| `fixed` (6) | `0x12447e` | `15f759f8` | `062000bf` | Replace current-volume getter with index 6; retain cap |
| `half-index` | `0x124482` | `0c2828bf0c20` | `400800bf00bf` | Replace cap with `floor(v/2)` for logical indices 0..16 |

The fixed and half-index changes apply to **any prompt 50/51 using this stream
path**, including other gestures that request those IDs. They are not scoped
only to the case. Index 6 is an experimental default, not a calibrated dB or
safe-listening measurement. A fixed index can be louder than stock at low
media volumes. Halving an index is not halving sound pressure or dB; its
0..8 result relies on the traced logical 0..16 input domain. These patches do
not change tone frequency or sample data.

`tools/patch_volume_ping.py` requires the exact source hash and expected original
instructions. It refuses existing outputs and never repacks a BES container or
contacts a device. Without `--output` it prints only a candidate manifest:

```sh
python3 tools/patch_volume_ping.py artifacts/firmware/B187-1.0.1.74-decompressed.bin --mode mute
python3 tools/patch_volume_ping.py artifacts/firmware/B187-1.0.1.74-decompressed.bin --mode fixed --level 6
python3 tools/patch_volume_ping.py artifacts/firmware/B187-1.0.1.74-decompressed.bin --mode half-index
```

Prepared local raw experiments and adjacent JSON manifests:

- `artifacts/firmware/B187-1.0.1.74-ping-mute.OFFLINE.bin`
- `artifacts/firmware/B187-1.0.1.74-ping-fixed6.OFFLINE.bin`
- `artifacts/firmware/B187-1.0.1.74-ping-half-index.OFFLINE.bin`

These raw candidates are **not flashable OTA files**. The later
[custom mute build](b187-custom-flash.md) resolves inner/container CRC coverage
and supplies a verified repacker. Signature/secure-boot acceptance and a proven
nonbooting recovery route were not established by the offline analysis.
See the [real cases and B187 damage/rollback assessment](b187-recovery-risk.md)
before treating any of these changes as reversible on a device.

## Verification and retained REA evidence

`tests/test_volume_ping.py` executes the actual original and patched Thumb
fragments. It checks all logical volume indices 0..16 for both prompt IDs,
unaffected dispatch for other IDs, both wheel events in both call-context
states, preserved helper flags and stack return, changed-byte boundaries, and
rejection of a modified/wrong image. Four tests pass with the local image and
Unicorn available; firmware-dependent tests skip if those prerequisites are
absent. External-call stubs do not model timing, mixing, codec output or TWS.

```sh
research/tools/instrumentation-env/bin/python -m unittest tests/test_volume_ping.py -v
```

Complete REA JSON records and extracted assembly are retained under
`artifacts/firmware/` (ignored local artifacts). Each reports the source digest,
unchanged source bytes, untruncated output, and the exact command:

- `B187-rea-volume.json`: `ev_313c67e7b34c16624a9d0af7098c7ed29787acff63d3538ce9c76ba0bc36e8fc`.
- `B187-rea-prompt-dispatch.json`: helper and `media_PlayAudio` dispatch.
- `B187-rea-prompt-gain.json`: volume getter, key callback and gain branch.
- `B187-rea-stream-volume.json`: stream configuration's volume consumer.

To repeat a focused REA observation, set `REA_RIZIN_COMMAND` to the installed
Rizin executable and run:

```sh
npx --yes rea-agents@6.7.0 execute-rizin-command artifacts/firmware/B187-1.0.1.74-decompressed.bin 'e scr.color=0; e asm.arch=arm; e asm.bits=16; omb 1 0x2c010000; pD 112 @ 0x2c059568; pD 44 @ 0x2c134474' --format json
```

The remaining hardware work is to resolve image integrity/acceptance and
recovery, then verify wheel direction and volume control, boundary tones,
both buds, media/call states, and actual prompt loudness. Constant **stream
index** is established by emulation; constant perceived loudness is not.
