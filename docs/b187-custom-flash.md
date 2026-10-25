# B187 wheel-ping mute experiment

The user authorized flashing the custom mute image after the successful
[same-version stock reflash](b187-stock-reflash.md), accepting the remaining
risk. Transfer began October 24, 2026 at approximately 22:53:33 CDT.
**Custom transfer, device acceptance and reboot succeeded.** The user then
physically tested the wheel and confirmed: **"Volume changes; ping is gone."**

## Reproducible image

`python -m tools.repack_b187_mute` requires the exact pinned stock container,
uses `patch_volume_ping.patch_image(..., 'mute')`, repairs the inner ASCII
checksum, and repacks only changed blocks. Before building, it recompresses
all 16 original streams and requires byte-for-byte equality with stock.

- Output: `artifacts/firmware/B187-1.0.1.74-ping-mute.OTA.bin`.
- Size: **1,196,213 bytes**, five bytes smaller than stock.
- SHA-256: `d8525f692656e3c4126a2c5ee5994e881ff8ca904b47c141e9c279fc79703c5e`.
- Raw decoded size remains **2,030,756 bytes**.
- Only code change: offset `0x495a8`, `db f0 98 b9` → `70 47 00 bf`.
  The helper returns after its existing flag writes and stack restoration,
  instead of tail-calling `media_PlayAudio` for the normal rotary prompt.
- The eight inner CRC characters at `0x1efc4d` change from `88FBCA80` to
  `EB1CBBD3`. No other decoded bytes change. Version/model remain unchanged.
- Only compressed blocks **2 and 15** change.
- Outer CRC changes from `A5F91CBA` to `C3981700`.

Both CRCs use ordinary CRC32 over the entire prefix ending immediately before
their eight ASCII hex digits. The prefix includes `CRC32_OF_IMAGE=0x`.
This exactly validates both original checksums and both repaired checksums.
The earlier firmware literal with a NUL after `0x` is not a populated checksum.
`unpack_bes.py` now reports whether the outer CRC actually matches this rule.

Thirty tests pass, including actual Thumb execution of the original/patched
helper, raw change boundaries, stock compression identity, checksum corruption
and source identity rejection. These checks cannot prove nonbooting recovery.

## Supplying custom bytes to the original updater

The same isolated lab app and unchanged OTA engine used for the stock test
are used here. The original app is temporarily disabled to avoid competing
connections. The app showed L/R **100%**, case **85%** before this attempt.

The native metadata tracer obtains the same-version offer and is detached.
The custom container is separately staged inside the lab app's directory and
read back through `run-as`; every byte matches the deterministic local build.

`tools/stage_b187_mute.py --arm` installs one native hook at Dart AOT offset
`0x346bc88`, after `file.path` is obtained and immediately before `startOta`.
It checks the expected instruction and exact path, atomically renames the
staged file over the app's downloaded OTA file, and detaches its hook before
returning to the original app code. Failure aborts the app before handoff.
The user-facing Update button initiates the app's normal download and case/
battery checks. There are no Java or Bluetooth hooks during this attempt.

The substitution intentionally supplies our custom bytes after the stock
download checks. The server's stock SHA-256 does **not** authenticate the
custom image. The OTA engine, packet builder, retries, transfer CRC and device
acceptance checks remain original; no device integrity check is bypassed.

Readback of the file actually handed off matches the custom SHA-256 above.
The original updater pads it to **1,196,288 bytes**, transfer CRC **7FDE8718**.
Initial app logs match the custom file prefixes, file-info/config construction
and segment CRCs. Logs and readbacks are saved under `artifacts/custom-flash/`.

## Observed completion and cleanup

The complete transcript covers **1,196,288 payload bytes**, **1,889** logged
packet prefixes and **100** matching segment CRC requests, with no verifier
mismatches. At **22:57:18.905 CDT** the image check returned `84 01`; overwrite
confirmation returned `93 01` at **22:57:19.104**. The app displayed **Update
completed**. It disconnected at **22:57:22**, reconnected at **22:57:46**, and
a fresh C042 response at **22:57:46.657** returned **1.0.1.74**. Both batteries
subsequently reported 100%, case 85%. As in the stock run, reboot disconnect
can produce a transient post-success failure callback.

The custom app-side transfer file was read back and matched the custom hash.
After completion/reconnection the lab OTA cache was restored to the exact
stock container and its hash verified, preventing accidental future reuse of
the custom file. The lab app was force-stopped, the original app re-enabled
and opened, temporary uploaded files deleted and Gadget forwarding removed.
The idle staging session ended when the lab was stopped; the one-shot native
hook had detached before the OTA handoff.

This establishes acceptance and a functioning post-update control connection
for this particular image and pair. It does not establish older-version
rollback, a recovery path from nonbooting firmware, independent flash readback
or behavior beyond the user's successful wheel test. Stock restoration after this custom build has not been
tested; the earlier successful reflash was stock over stock.

Use `verify_stock_ota_log.py --expected-sha256 <custom-sha>` with the isolated
current-run log to check the custom transcript. Its stock-only default remains
strict. Logged long packets are truncated; this is not full wire capture or
an independent flash-memory readback.

Minimum/maximum warnings and other prompt paths may remain audible. The
firmware still reports **1.0.1.74**. Audible wheel behavior requires a physical
test after reboot; the user's test above confirms the intended normal wheel
behavior. The version string cannot distinguish this build.
