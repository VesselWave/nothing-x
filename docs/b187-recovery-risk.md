# B187 firmware modification: damage and recovery assessment

Research date: 2026-10-24 (America/Chicago). This initial assessment was read-only;
a subsequent authorized [same-version stock reflash succeeded](b187-stock-reflash.md).
The subsequently authorized [custom mute attempt](b187-custom-flash.md) records
the current transfer and verification status separately.

Current decision: **do not treat the ping patches as safely reversible yet**.
The main concern is losing a working update/boot path, rather than the intended
ping instructions electrically damaging hardware. There is no defensible
numerical failure probability for B187 custom firmware from the cases below.

## Real cases and their limits

1. **Nothing Ear (2024), failed official OTA, recovered.** The owner reported
   failed reinstall, broken audio/ANC and inability to reconnect after reset.
   Their subsequent update says leaving the buds in the closed case restored
   connection and they then completed the firmware update. This is a firsthand
   example of an apparent brick recovering, not proof of a bootloader rollback
   or a B187 recovery procedure.
   [Original report and follow-up](https://www.reddit.com/r/NothingTech/comments/1ciaex3/nothing_ear_2024/).

2. **CMF Buds Pro (first generation), claimed service downgrade.** One owner
   says service downgraded firmware to 1.1.189 and the battery issue improved.
   No service log, tool or firmware image is provided. A later comment describes
   an app update being uninstalled, making the firmware/app distinction less
   clear. This is weak evidence of service rollback, not a reproducible method.
   [Owner's thread](https://www.reddit.com/r/NothingTech/comments/17jlxiy/cmf_buds_pro/).

3. **CMF Buds Pro 2 (2024 firmware), persistent regressions and replacements.**
   A community report describes battery/charging regressions after updating
   replacements from 0.0.5.5 to 0.0.7.1, followed by another replacement. It
   does not demonstrate electrical damage or successful rollback. Its older
   0.0.x firmware distinguishes it from our B187 1.0.1.74 target.
   [Firsthand community report](https://nothing.community/d/20477-a-warning-to-fellow-users-avoid-updating-cmf-buds-pro-2-firmware).

4. **Nothing Ear (a), persistent problem without a downgrade route.** An owner
   reports imbalance after an update and, six months later, still having the
   issue and being refused a software downgrade. This is a personal account,
   not an official statement that every model is incapable of downgrading.
   [Original report and follow-up](https://www.reddit.com/r/NothingTech/comments/1j9g73u/need_to_firmware_downgrade_my_nothing_ear_a/).

5. **BES custom firmware on Soundcore Q35: working hardware access.** The
   openqore author documents custom firmware/sound replacement using a UART
   adapter, soldered connections and bootloader access. The associated project
   provides flash backup and UART write guides. This supports recovery
   feasibility on that specific hardware; it does not establish B187 pinout,
   boot-entry method, security configuration or recovery. The universal guide
   is incomplete in places, so it is not a turnkey B187 recovery recipe.
   [Author's account](https://www.reddit.com/r/hardwarehacking/comments/1ty2dz6/running_doom_custom_code_firmware_on_soundcore/),
   [UART guide](https://github.com/nnonickreal/openqore/blob/main/docs/UART_things/FLASHING.md).

The besota project's tested hardware includes Soundcore Q30/Q35, CMF Headphone
Pro, Space One and Nothing Headphone (1), but not B187/best1306p. Its warning
about wrong-device images and UART recovery is relevant; its asserted “99%”
brick chance is not a measured B187 probability and must not be reused as one.
[besota compatibility and warnings](https://github.com/nnonickreal/besota).

A bounded search for B187/best1306p custom firmware, UART pinouts, rollback
and unbrick reports found no verified public B187 recovery procedure. This is
a search result, not proof that a factory/service method does not exist.
Nothing phone fastboot/downgrade guides are not evidence for these earbuds.

## What we actually know about our pair

- We retain the original server-verified **B187 1.0.1.74 OTA container**.
  Restoring that same version would undo our modifications without needing an
  older release, if the device can still accept it. Same-version stock
  reflash acceptance is now demonstrated on the functioning stock pair.
  Restoring it from modified firmware remains untested.
- That OTA file is **not a complete per-device flash backup**. Bootloader,
  calibration, pairing/device identity and persistent data have not been read
  back and verified. Their locations/coverage remain unresolved.
- App OTA code has separate transfer, CRC/resume, overwrite-confirmation and
  apply stages. Interrupted-download resume is not recovery from accepted
  firmware that crashes before Bluetooth starts. Some app methods are only
  partially decompiled; their names alone do not establish recovery behavior.
- A server request field named `isCrossBack`, and old probe artifact filenames
  containing `rollback`, do not demonstrate device-side downgrade acceptance.
  Those legacy B187 probes returned no download. Our successful version spoof
  changed the app's check request only, never the actual device firmware.
- The B187 binary includes `app_update_ota_boot_info` at **0x2c0d6700**.
  It prepares a 20-byte record including magic `0x5a5a5a5a`, image size, CRC
  and new-image flash offset, then calls flash APIs. The boot-info address
  getter at **0x2c0d68c0** uses **0x28001000** and checks magic values.
- Although the updater contains a conditional alternate boot-word branch,
  its directly called helper **0x2c0d5080 returns zero** in this image, so
  that branch is bypassed on this direct path. This is **not evidence of
  active A/B fallback**, a retained bootable previous image, a failed-boot
  counter or automatic rollback. The actual reset-time bootloader policy is
  still unknown.

REA 6.7.0/Rizin observation:
`artifacts/firmware/B187-rea-boot-info.json`, evidence
`ev_decd9acf83e7a46c89eedb62ed0225df00902549d3667d7a7b63c8c3cee12b3c`.
Source hash is unchanged. The selected assembly is saved beside it. This
evidence supports the instructions above, not observed device execution.

## Risk and rollback assessment

**Physical/electrical damage from the intended ping patch:** comparatively
low expected risk, as an engineering inference. The selected edits change a
prompt call or prompt volume index, with no intended charging, voltage,
clock or flash-driver changes. This is not a guarantee against wrong address,
bad packaging or unexpected execution. Fixed index 6 can make low-volume
pings louder than stock. Future audio tests should start with buds out of ears.

**Persistent loss of function from experimental flashing:** material and
unquantified. Container CRC coverage is now resolved; boot/signature handling, flash
placement, TWS coordination or update activation could reject the image, leave
one bud unusable, or stop both from exposing Bluetooth OTA. Passing the local
instruction tests only verifies those fragments with stubbed external calls.

**Rollback while the modified firmware still boots/connects:** plausible,
unproven from a modified image. Reinstalling our stock 1.0.1.74 is preferable
to introducing another version. The app-owned same-version stock transfer
now works on this pair, but still requires a functioning transport and updater
after modification. Newer-version rules, integrity/security checks and
possible persistent-data changes must be accounted for. Merely reversing the
patch in a host file does not reverse a device flash.

**Rollback after Bluetooth no longer starts:** no verified B187 route today.
A surviving independent loader might permit UART/debug/service recovery, but
pinout, voltage, boot-entry sequence, accessible flash operations and any
authentication have not been established. A valid stock OTA file alone is
insufficient when there is no working way to send/apply it. Opening/soldering
the tiny enclosure also introduces physical risk.

**Factory reset:** Nothing documents a ten-second case-button reset, but does
not describe it as reinstalling an older firmware. Do not count it as firmware
rollback or a cure for a nonbooting patched image.
[Official CMF Buds Pro 2 reset instructions](https://support.nothing.tech/hc/en-us/articles/26468742615057-How-do-I-reset-CMF-Buds-Pro-2).

Until an independent recovery path and a verified full backup exist, budget
for the pair becoming unusable and needing replacement if experimenting. That
is a practical risk assumption, not a claim that silicon damage is likely.
The next useful work is read-only bootloader/flash-layout analysis and finding
documented B187 service or hardware recovery, ideally on a spare pair. A
successful ordinary OTA or stock reflash would still not prove recovery after
a firmware boot failure.
