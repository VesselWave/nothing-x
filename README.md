# Nothing X / CMF Buds Pro 2 lab

**Latest result:** the B187 wheel-ping mute firmware was flashed through the
original app OTA engine, accepted and rebooted successfully. The user confirmed
that volume changes and the normal wheel ping is gone. See the
[custom flash record](docs/b187-custom-flash.md) and
[private repository contents](docs/repository-contents.md).

Earlier findings below describe the preceding investigation stages.

Extracted Nothing X **3.10.1** from the Pixel 7 and investigated its Bluetooth control and firmware update paths. A small Android client, **Buds Lab**, is installed on the phone. Its APK is `artifacts/buds-lab.apk`.

## What is established

- **In-ear detection was disabled and read back successfully on the actual buds.** Feature 1 changed from `1` to `0`; the other reported feature values stayed unchanged. The user subsequently confirmed that removing a bud and putting it in the case no longer pause playback on this pair.
- The buds report firmware **1.0.1.74**. This corresponds to the **B187 refresh**, rather than original B172 firmware. The live C01C model reply confirmed B187. Both use the Espeon OTA implementation in this APK.
- Current gesture mappings were read, including 15 records for left, right and case controls.
- Replies use **CRC over the payload** on this device; outgoing queries with CRC over the whole frame work. Unchecksummed notifications also arrive.
- **Custom host triggers work:** mapping left double-tap-and-hold to action 31 produced 17 real E014 payloads `1f` and ran the Mac bookmark script. Holding repeats about once per second; the host bridge now groups repeats until a 1.5-second idle gap.
- Rotation mapped to action 31 was tested: **no ping, no volume change, and no host events**. The firmware stores that mapping but does not turn it into a rotary trigger. No ping-only mute, fixed level or gain-curve setting is established.

**Matching B187 firmware was acquired successfully:** [B187-1.0.1.74.bin](artifacts/firmware/B187-1.0.1.74.bin), 1,196,218 bytes, server SHA-256 verified. The separate Nothing X Lab copy on the Pixel sent the real current-API request with a temporary `0.0.0.0` version argument. The server offered 1.0.1.74, and its captured URL was downloaded on the Mac. The original app was restored afterward; no firmware was flashed. The container is also unpacked for offline analysis. See [the full acquisition record](docs/emulator-firmware.md#b187-acquisition-succeeded).


## Run the helper

Requires Python 3 and Android platform tools. The paired Pixel is on local ADB server port `5042` in this session. Use `--port` / `--serial` if that changes.

```sh
python3 tools/buds.py snapshot
python3 tools/buds.py wear off
python3 tools/buds.py wear on
python3 tools/buds.py capture
python3 tools/buds.py export
```

Connect the buds to the Pixel first. A competing Nothing X control connection may need to be closed. The on-phone buttons provide the same core operations. Changes are checked by querying the buds, not just accepting an acknowledgement.

The app saves logs and hex responses in its private `files` directory. `export` copies them to `artifacts/device/`. Raw configuration responses can contain the device serial and Bluetooth address; generated artifacts are excluded from git.

## Custom buttons and dial experiments

**Verified on this pair for left double-tap-and-hold and case double-press. Other slots remain experimental.** The following changes only the left double-tap-and-hold slot, saves the original full mapping first, and checks its readback:

```sh
python3 tools/buds.py custom-trigger
python3 tools/buds.py bridge --routes examples/routes.json
# Double-tap and hold the left bud while the bridge is listening.
python3 tools/buds.py restore-gestures
```

The example adds a timestamped bookmark to `~/buds-bookmarks.txt`. Replace the argv array in `examples/routes.json` with your own script to drive desktop actions, timers or an automation system. Commands are started without a shell. Hold repeats are grouped until a 1.5-second idle gap; use `--quiet-seconds 0` for every repeat. The bridge runs in the foreground for five minutes; it is a research prototype, not a background companion service.

The observed app handler treats E014 as an **operation value**, not a raw gesture identifier. Mapping several controls to operation 31 may merge them into the same trigger. Raw left/right, dial direction and rotation distance are not established.

General mapping uses `device button gesture operation` integers (decimal or `0x` hexadecimal):

```sh
python3 tools/buds.py map 4 1 2 31   # experimental case double-press → host trigger
python3 tools/buds.py restore-gestures
```

Only slots already reported by the connected buds are accepted. A saved mapping backup is bound to the Bluetooth address of the original pair. Firmware can reject or reinterpret operations; a readback alone does not prove the gesture's physical behavior.

For a coarse silent-dial workaround, `quiet-dial` assigns “No action” to rotation. **This also removes volume control from rotation**, so it is not a ping-only fix:

```sh
python3 tools/buds.py quiet-dial
python3 tools/buds.py restore-gestures
```

No experimental gesture changes were automatically left on the disconnected buds.

## Rebuild and validate

Uses the installed Android SDK platform 36, build tools 36.0.0 and JDK 17; no Gradle dependencies are needed.

```sh
android/build.sh
python3 tools/buds.py install
python3 -m unittest discover -s tests -v
```

Twelve protocol and repeat-filter checks cover actual captured packets, checksum variants, corrupt packets, gesture parsing and the wear-setting change. The helper was built, signature-verified, installed and used for real Bluetooth reads and a wear-setting write/readback. Its CLI also correctly reports failure when the buds are disconnected.

## Firmware work

`tools/fetch_firmware.py` reconstructs the APK's legacy OTA metadata request. It extracts embedded app credentials from the pulled native library internally; it does not print or save them. The server was unavailable during this pass, so successful request signing is not confirmed against a server response.

```sh
uv run --with pyelftools python tools/fetch_firmware.py --model B187 --version 1.0.1.74
# Query from an earlier version to ask about an available update; download only after model confirmation.
uv run --with pyelftools python tools/fetch_firmware.py --model B187 --version 1.0.1.32 --download
python3 tools/inspect_firmware.py path/to/firmware.bin --output artifacts/firmware-analysis.json
```

The downloader checks the server's SHA-256 and declared size. The inspector computes the app's BES transfer CRC and finds candidate vectors and relevant strings. Neither tool flashes firmware. A valid checksum does not establish that modified firmware will pass any device signature checks.

See [the investigation notes](docs/investigation.md) for source evidence, case behavior and the dial ping investigation.
