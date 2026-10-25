# Investigation record

## Inputs and provenance

Read the installed `com.nothing.smartcenter` package from the user's paired Pixel 7 using ADB. No app replacement or patch was applied to Nothing X.

- Version name: **3.10.1**; version code: **3100105**.
- Base APK: **155,231,314 bytes**, SHA-256 `7511c66fe33bad1487a72cf0f1e1ad28e2e01ca9d9a7b422d963db95990072c9`.
- Extracted base plus arm64, English and xxhdpi splits; all checksums in `artifacts/apk/manifest.json`.
- JADX **1.5.3** processed **24,882 classes**, with **92 decompilation errors**. Failed methods are treated as incomplete evidence; inspect their bytecode before relying on them.
- Decompiled sources/resources: `research/decompiled/`; native libraries: `research/native/`; Flutter AOT string index: `research/flutter-strings.txt`.
- Additional comparison sources: [ear-web](https://github.com/radiance-project/ear-web), [ear-tray](https://github.com/Vadim-Karpenko/ear-tray), [dms-nothingx](https://github.com/Bestello/dms-nothingx). Clones live under `research/upstream/`. The new helper does not import those projects' code.
- REA was evaluated via [its documentation](https://rea.tools/). Direct JADX, ELF symbol inspection and Capstone were sufficient for the app findings; no REA setup was installed or claimed.

## Model distinction

The original B172 is `IOTProductDeviceEspeon`; the B187 refresh is `IOTProductDeviceHeracross` but reuses `EspeonOTAProcess`. The app's Flutter `ear_white_list.json` also gives B187 `supportId: B172`, private code 245 and `otaProtocol: 1`.

The live buds report **1.0.1.74**, which [Nothing's published changelog](https://nothing.community/d/52821) identifies with B187. This is strong model evidence, not a substitute for a successful live model query. Earlier notes that identified the hardware as B172 based on the shared Espeon implementation were too specific.

## Bluetooth framing and checksums

Control service UUID: `aeac4a03-dff5-498f-843a-34487cf133eb`.

Header: sync `55`, 16-bit little-endian control, 16-bit LE command, 16-bit LE payload length, one-byte sequence. An optional two-byte LE CRC follows the payload. CRC presence is indicated by control bit `0x20`.

For outgoing traffic, control `0x0160` and CRC-16/MODBUS parameters (init `0xffff`, reflected polynomial `0xa001`, no final xor) over header plus payload work. The live device's checksummed responses instead use CRC over the payload only. This was determined by comparing received bytes, not by disabling checksum checking. Empty response payloads have CRC `ffff`. Notifications also arrived with control `0x0100` and no CRC.

The implementation accepts either verified checksum scope, validates lengths and matches replies to both sequence and command family. It does not treat an unrelated event as a query response.

## In-ear detection: verified setting change

APK evidence:

- `com/nothing/earbase/os/DeviceProtocol.java`, `setEarDetect`: command `SET_EXTRA_FEATURE_STATUS`, payload `[1,1,enabled]`.
- `com/nothing/base/protocol/constant/ProtocolConstant.java`: set `61444 = 0xf004`, query `49166 = 0xc00e`.
- `DeviceExtraFeatureStatus.java`: feature 1 is wear detection; status 0 is closed/off, 1 is open/on.

Observed payloads:

```text
Before: 0e 01 01 02 00 03 01 07 01 09 01 0a 00 0b 00 0c 01 0e 01 0f 01 12 01 15 01 16 01 18 01
After:  0e 01 00 02 00 03 01 07 01 09 01 0a 00 0b 00 0c 01 0e 01 0f 01 12 01 15 01 16 01 18 01
```

Only feature 1 changed. The last verified setting was off. Subsequent source builds do not alter a saved setting by themselves. The user subsequently reconnected the buds and confirmed: “They stopped pausing on in-ear and case.” This is user-observed verification of the requested pause behavior on this pair. The exact one/both-bud and lid-state sequence was not separately recorded.

## Case behavior: independent from wear detection

`Espeon`'s `EarphoneStatus` represents `inCase`, `inEar`, `isConnect` and `caseIsOpen` independently. It uses distinct bit masks for being in the case and being worn. This establishes that the reported state has separate concepts; it does **not** prove the pause handlers or power management are independent in firmware.

No case auto-pause override was found in the inspected app settings. Firmware might pause, disconnect or shut down on charging contact independently of the wear toggle. A phone-side play command cannot keep audio flowing through a powered-down Bluetooth endpoint. Determine the actual case transition from a synchronized event capture and playback test before choosing a modification.

## Gestures and custom actions

- Query mappings: `0xc018`; write mappings: **`0xf003`**, not `0xf018`.
- Payload: count byte followed by records `[device, button, gesture, operation]`.
- Live device codes: 2 left, 3 right, 4 case.
- Gesture IDs include 1 single, 2 double, 3 triple, 7 hold, 9 double-tap hold, 10 rotate. Other table entries must not be guessed: the APK calls 15 case lock / double-press hold in different UI contexts.
- The saved live mapping has 15 records. Dial rotation is `[4,1,10,23]`; single press is `[4,1,1,2]`. Some records use button 9 for contextual call behavior, so the helper's generic writer deliberately limits ordinary user-selected buttons to 1–6.
- Native `ControlConfigurationEntity` gives action 6 volume up, 7 volume down, 8 previous, 9 next, 11 assistant, 17 game mode, 18/19 continuous volume, 20/21/22 ANC combinations and 23 rotary volume.
- These differ from some community tables, which label several of those numbers incorrectly. Use the APK and readback.

The B187 Flutter control config includes action **31** behind a platform restriction. `ConnectViewModel.magicButtonCallback.onUpdate` handles command **57364 = E014**, extracts an integer, and calls the News Widget when it equals 31. This provides concrete evidence for a host event path. It does not prove this particular firmware emits it from every remapped slot.

The helper can map a present slot to 31, preserve the existing mapping and listen for E014. Host events can dispatch arbitrary local scripts through `tools/buds.py bridge --routes ...`. A local Android broadcast, `dev.nothingx.lab.EVENT`, carries `operation` and hex `payload` for integration experiments. The bridge must be running to receive events; its current foreground session lasts five minutes.

Because E014's native handler exposes an operation integer, two gestures mapped to the same action may become indistinguishable. Rotary volume may be implemented inside the buds with no raw direction stream sent to the app. Neither raw rotations nor universal per-sensor events have been demonstrated.

## Dial volume ping: investigation and options

The user's requested behavior is: mute the dial's volume feedback ping, hold its loudness constant, or change the gain curve as volume changes.

Inspected evidence:

- Espeon/B187 operation 23 routes rotation to volume control.
- The B187 device/gesture config has no ping volume or prompt-gain field.
- Native protocol constants contain high-volume gain `0xc010` / `0xf008` and system-audio `0xc057` / `0xf05b`. Their names alone do not establish a per-prompt gain setting. No writes to those speculative settings were performed.
- `libapp.so` contains alert-tone transfer paths for newer recording features. Their presence in a multi-device app does not establish that B187 supports replacing its volume tone.
- The APK's `com.nothing.nt_ear/set_ringtone` refers to another app feature; it is not evidence of earbud volume-ping replacement.

No confirmed ping-only command is available from this pass. `quiet-dial` sets rotation to action 1 (No action), which should avoid the normal rotation action but also removes rotary volume control; this workaround remains untested physically.

Firmware work should trace the rotary-volume handler into the prompt playback/mixer, identify whether prompt amplitude shares music gain, then inspect the tone's gain table or sample. Muting a sample, changing a prompt-only gain table and replacing a volume-index lookup with a constant have different effects; do not patch one without identifying its callers. A useful target would be a user-selected prompt curve independent of media volume. A firmware image is needed before identifying addresses or proving any of these modifications feasible.

## Firmware protocol findings and acquisition limit

App evidence is in `EspeonOTAProcess.java` and `OTAFileHelper.java`:

- OTA RFCOMM UUID: `66666666-6666-6666-6666-666666666666`.
- Marker `BEST`; file-info request `0x80` / response `0x81`.
- Data chunk `0x85`; block CRC request `0x82` / response `0x83`.
- Configuration `0x86` / `0x87`; send-finish `0x88`, finish response `0x84`; data-line response `0x8b`.
- Resume `0x8c` / `0x8d`; version `0x8e` / `0x8f`; apply `0x90` / `0x91`; overwrite confirmation `0x92` / `0x93`.
- Default SPP MTU 661; CRC-32 blocks and MD5-based resume identifiers appear in the updater.
- For transfer data, `OTAFileHelper.getFileData(256)` subtracts four from file length, rounds up to a multiple of 256, allocates that buffer, reads the file into it and leaves any extra bytes zero-initialized. Do not assume the last four bytes are a cryptographic signature.
- The 92-byte OTA configuration contains length 88, trailer-derived bytes and CRC-32 over its first 88 bytes.

The native updater queries `https://iota.nothing.tech/api/v2/firmware/version`, with `appid`, millisecond `timestamp`, `nonce` and `sign` headers and model/version/language/mobile-id/MAC-hash query fields. `OTANetHelper` constructs a SHA-256 digest over embedded app identifiers and sorted parameters. `libnative-lib.so` retains the relevant JNI and data symbols. An internal extraction script reconstructed this request without exposing the embedded values in logs.

The endpoint returned HTTP 502, including on a plain HEAD request. No firmware binary was present in accessible Nothing X external downloads, and no matching binary was identified inside the APK. This initially blocked firmware acquisition. Subsequent China-endpoint acquisition and B172 reference disassembly are documented in [emulator-firmware.md](emulator-firmware.md); a matching B187 image remains unavailable from tested requests. CRC, MD5 and OTA framing alone do not prove the absence of secure boot, firmware signatures or rollback enforcement.

## Next hardware session

1. Reconnect the buds, read `0xc01c` model and verify wear feature 1 is still off.
2. Capture synchronized dial rotations, presses, ear removal and case insertion. Check playback and whether Bluetooth stays connected.
3. Read the supported/registered notification queries `0xc03d` and `0xc03e`; older exploratory `0xc020`/`0xc021` queries were not those commands and produced empty payloads.
4. Back up mappings, assign one gesture action 31, verify its readback, capture an actual press and restore the mapping. Determine whether the payload preserves more than action identity.
5. Obtain the correct **B187** OTA image when the service is available (or use an existing matching update file), verify hash, and inspect tone and case handlers offline before any firmware patch proposal.

## Live custom-trigger test result

After reconnecting, feature 1 remained off. The left `[2,1,9]` mapping changed from action 11 to 31 and the readback matched. The user's physical presses generated **17** received frames `55 00 01 14 e0 01 00 00 1f`; all E014 payloads were the single byte `1f`. The Mac bridge executed the bookmark script. This verifies an arbitrary host-script path without a firmware modification.

The held gesture repeated about once per second. A host-side idle-gap filter now collapses repeats, with a default 1.5-second gap before the same payload can trigger again; repeat mode is available explicitly. These captures contain no source-device or gesture identity beyond the selected operation value.

Corrected live queries `c03d` and `c03e` returned empty payloads on this firmware; events still arrived without an explicit notification subscription. Queries for high-volume gain, ordinary volume and system audio also returned empty payloads. No write to a speculative ping setting was made.

The original 15-record gesture mapping was subsequently restored and read back exactly. The next test temporarily assigns case double-press `[4,1,2]` to action 31, leaving rotation unchanged.

## Live case-dial double-press result

Case double-press `[4,1,2]` accepted action 31, and the user's test produced **five** E014 frames with one-byte payload `1f`. This confirms the case button can run arbitrary host scripts as well. The old earbud-test dispatcher was still alive and duplicated the bookmark side effect; both dispatchers were stopped, and the CLI now uses an exclusive per-device process lock and exits when a new START operation supersedes its session. The captured device events themselves were not duplicated.

## Live rotary remapping result

Rotation `[4,1,10]` accepted operation 31 and readback matched. During the user's clockwise/counterclockwise test, the active RFCOMM capture recorded **no E014 events**. The user reported **“No ping, no volume.”** Thus an arbitrary stored operation does not imply a working physical rotary action: on this firmware, operation 31 disables normal rotary behavior instead of routing turns into the app event channel. Normal mapping 23 was restored after the experiment, and all 15 gesture records were read back matching the original backup.

This establishes a silent-but-inactive rotation configuration, not a ping-only fix and not a raw rotary event interface. Continuing volume control without its tone still requires a different supported operation or verified firmware modification. Earbud hold and case double-press remain proven custom script triggers.

## Emulator follow-up

The original app now sends a spoofed old-version B187 check through an HTTPS proxy in an isolated emulator. The global server returns 502; China returns a parsed success with need_update=0 and no download. A B172 reference image was separately acquired and unpacked; distinct volume-prompt calls were found. See [the evidence and reproduction notes](emulator-firmware.md). No B187 firmware patch or fixed-level ping is yet verified.

## Matching B187 firmware acquired

The current API accepted an in-memory old-version spoof made inside the instrumented lab copy on the real Pixel. Matching B187 1.0.1.74 was downloaded and its server SHA-256 and byte count verified. The BES container also unpacks successfully. This supersedes the earlier acquisition limit: see [the acquisition record](emulator-firmware.md#b187-acquisition-succeeded). No firmware was flashed.
