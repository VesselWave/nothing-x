# B187 same-version stock reflash

**Successful on the user's pair, October 24, 2026.** Nothing X's own updater
transferred stock B187 **1.0.1.74** over the already installed **1.0.1.74**.
The app reported completion, the buds disconnected/reconnected, and a fresh
device firmware query returned 1.0.1.74. No ping patch was flashed.

## Using the app's actual update path

The test used the existing isolated `com.nothing.smartcenter.lab` copy of
Nothing X 3.10.1. All eight installed DEX files match the installed original
app byte-for-byte. The lab's Dart AOT `libapp.so` also matches the original
installed ARM64 split. This includes the original OTA implementation.
Comparison evidence: `artifacts/reflash/app-code-comparison.json`.

The lab package differs in packaging/signing and the previously documented
Gadget loading and JNI app-signature exception patches. It is not an untouched
official APK. No OTA engine, packet generator, retry logic, checksum logic or
firmware acceptance check was replaced for the successful transfer.

To get the same-version offer, the existing native Frida metadata tracer
temporarily changed only `checkOta`'s request version argument to 0.0.0.0.
The device itself continued to report 1.0.1.74. The app's real server request
offered 1.0.1.74 and the same SHA-256 as our saved stock container. The offered
URL was downloaded independently on the Mac and compared byte-for-byte with
the saved file. The tracer was then detached **before Update was pressed**.

The original app was temporarily disabled for user 0, as requested, to avoid
competing Bluetooth control connections. Both buds were at 100% and the case
at 85%. The user confirmed both buds were in the open case and ready.

The Update button was pressed at about **22:13:05 CDT**. The app's own native
and Flutter file logs were read through `run-as`; no Java or Bluetooth hooks
were active during transfer. Logs establish this live route:

```text
Flutter firmware UI
  -> NtEarPlugin.invokeStartOTA (modelId B187)
  -> OTAHelper / OTADevice
  -> SppOTA RFCOMM connection
  -> BES version, apply-type, resume, file-info and config exchange
  -> data packets and segment CRC checks
  -> image check and overwrite confirmation
```

Static `IOTProductDeviceHeracross.createOTAProcess()` selects the original
`EspeonOTAProcess`. Its implementation uses the previously identified
`66666666-6666-6666-6666-666666666666` service UUID. The live logs confirm
SppOTA/RFCOMM and the matching wire protocol, rather than a generic flasher.

## Exact image and observed transfer

- Compressed stock container: **1,196,218 bytes**.
- SHA-256: `53573bd9e3a1bf6d65b7bed1e121bacb46cacfcd0036a2484bf33e0b3ce44f3b`.
- The app-private filename ends in `.converted.bin`, but its bytes/hash match
  the compressed stock container exactly. That suffix did not mean the
  decompressed analysis image was sent.
- Original app transfer padding produces **1,196,288 bytes**, CRC32
  **59114E4B**. The observed file-info request contains those values.
- The 92-byte config matches the original app's three trailer bytes,
  zero-filled fields and CRC32 construction.
- All **1,889** logged data-packet prefixes match their expected positions;
  declared payload lengths cover the entire transfer.
- All **100** observed segment CRC requests match the corresponding stock
  transfer ranges; device replies indicate success.
- Final send-finish request `88` received `84 01`; overwrite confirmation
  `92 42 45 53 54` received `93 01`.

The app displayed **Update completed** at version 1.0.1.74 and logged native
`transferCallback onSuccess` at **22:16:58 CDT**. The control connection
disconnected at 22:17:02 and reconnected at 22:17:27. The app sent a fresh
**C042** version query and decoded **1.0.1.74** at 22:17:28. The normal,
unspoofed server check then returned no update.

There is a transient failure notification after the successful transfer when
the control connection closes for reboot. It is preserved in the logs; the
subsequent reconnection, fresh device response and final UI establish the
observed outcome. Do not use a single progress callback alone as success.

Nothing's packet logger retains only the first 100 bytes of long packets.
Consequently this is **not a complete Bluetooth wire capture or independent
flash-memory readback**. The full app-side file hash, packet-prefix/length
checks, segment CRCs, final device responses and fresh version query provide
separate corroborating evidence.

## Reproduction and artifacts

```sh
python3 tools/verify_stock_ota_log.py artifacts/firmware/B187-1.0.1.74.bin artifacts/reflash/native-transfer.log --output artifacts/reflash/transfer-verification.json
research/tools/instrumentation-env/bin/python -m unittest discover -s tests -v
```

All 26 tests passed, including checks that the log verifier detects corrupted
packet prefixes, missing packets and a failed final device check. Tests using
the real capture/image skip when those ignored artifacts are unavailable.

Local evidence under `artifacts/reflash/` includes app code comparisons,
server-offer verification, the file read back from the app's OTA directory,
native/Flutter transfer logs and the verification report. These files may
contain identifiers and signed download URLs; do not publish them wholesale.

## Instrumentation failure before the successful run

An initial observer attempted Java method/Bluetooth stream hooks on the lab
copy. It caused app crashes before any OTA transfer began: an invalid JNI
reference in `BluetoothOutputStream.write`, then a Gadget crash. Those hooks
were removed, and the unsafe experimental scripts were moved out of `tools/`
into ignored `research/instrumentation/failed-trace_stock_reflash.*` for diagnosis.
The successful run used only the previously working native metadata tracer,
detached before the transfer, plus passive app logs.

Cleanup: the lab app was force-stopped, the original app re-enabled and opened,
the temporary Gadget forward removed, and the passive logcat process stopped.
The original app's About screen shows **Up to date (1.0.1.74)**.

## What this changes for custom firmware

Same-version stock transfer/activation on this functioning pair is now
demonstrated. We have a confirmed app-owned delivery route and a concrete
stock transfer transcript. This does **not** prove that a modified container
will pass device integrity/security checks, that stock can be restored from a
nonbooting modified firmware, or that older-version rollback is permitted.
The downloaded stock image is still not a complete per-device flash backup.
See [the recovery assessment](b187-recovery-risk.md) and
[offline ping patch findings](b187-volume-ping.md).
