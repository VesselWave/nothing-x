# Emulator OTA capture and reference firmware

Nothing X 3.10.1's original extracted APK and splits were installed in isolated emulator-5556 (API 36). The phone and buds were not flashed or given a custom CA. A local mitmproxy on port 8089 was configured through emulator global proxy 10.0.2.2:8089. The emulator alone received a test CA.

Frida 17.24.3 attaches through host port 27043 forwarded to emulator port 27042. The Java bridge is loaded in 32 KB chunks because a large create_script request closes this connection. `tools/run_instrumentation.py` loads the bridge and `tools/probe_firmware.js`, checks API level and the target package, and logs locally under ignored artifacts/network. The hook additionally adds the test CA to Nothing's in-process HttpCer list: the native updater builds a private trust store, so adding a system CA alone did not suffice. Hostnames and TLS validation otherwise remain in use.

The experiment invokes the app's actual EarDeviceRepo.checkDeviceServer coroutine with model ID 2F45F5 (confirmed by the app to map to B187), a synthetic MAC and old versions 1.0.1.0 and 0.0.0.0. It initializes the native network URL map because the Flutter onboarding path had not initialized this legacy updater. This tests the real app signer, HTTP client and response parser without simulating Bluetooth pairing. It does not establish that the complete firmware UI accepts a fake Bluetooth device.

Observed proxy responses:

- Global iota.nothing.tech/api/v2/firmware/version: HTTP 502, including the app's signed request.
- China iota.nothingcn.com/api/v2/firmware/version: HTTP 200; need_update=0 and blank link/version/size/hash. The app parsed this as Success.

Thus a low version alone does not currently produce a B187 download through these tested endpoints. Raw requests and response logs are local artifacts and may contain installation identifiers and signed parameters.

Re-run with the emulator Frida server and proxy already running:

```
research/tools/instrumentation-env/bin/python tools/run_instrumentation.py tools/probe_firmware.js --pid EMULATOR_APP_PID --region cn --version 1.0.1.0
```

The probe uses a synthetic address. It does not initiate an OTA transfer. The private CA path defaults to research/instrumentation/mitmproxy/mitmproxy-ca-cert.pem; override with --ca. Stop the proxy / clear the emulator proxy when finished using this lab setup. Do not install its CA on the phone.

## B172 reference image

The reconstructed signed China API separately returned B172 version 0.0.8.1. Its downloaded 1,428,280-byte container matches the server SHA-256 2efe1ca2ebf719a6f62ef03d3a358caf32b2f654ab16e1e999961943802f8a97. This is a different hardware model from the user's B187.

`tools/unpack_bes.py` decodes the observed format: four FF bytes, then nineteen big-endian length-prefixed LZMA-Alone streams and an ASCII footer. The result is 2,468,588 bytes, SHA-256 0e5712d2aa7bc20676681e2fb114ae861867d83f4f4ce5b523682127efaa026b. The footer's CRC32 C69E8C61 does not equal plain CRC32 of the decoded bytes (36AB1EC6); its coverage/algorithm remains unresolved. The unpacker validates stream boundaries and APP_SIZE but explicitly does not certify that footer CRC.

Strings identify best1501p and a build dated October 23, 2024. Pointer references support address base 0x2c020000. Capstone Thumb disassembly is saved in artifacts/firmware.

The reference case rotary handler at 0x2c1796e8 checks mapped operation 23, with additional fallback mode checks, before reaching volume up/down. This is consistent with the live observation that assigning operation 31 suppressed both tone and volume without emitting E014.

Volume functions call a separate media_PlayAudio entry at 0x2c15f68c, then perform the volume update. Normal up uses prompt 50; down uses 51; a minimum-volume branch uses 52. Four normal-step prompt call file offsets are 0x158fdc, 0x159012, 0x159078 and 0x1590e8. These are evidence of a potential prompt-only patch in this reference binary, not valid B187 patch addresses. Minimum-volume prompt call is at 0x1590c6.

No patched firmware was flashed. B187 image acquisition, matching code analysis, integrity/signature handling and a recovery strategy remain prerequisites for a device-specific firmware patch. Fixed prompt volume or a changed gain curve also requires tracing the prompt mixer and gain path; the separate call sites alone only establish a candidate mute approach.

## Recheck of the 502 hypothesis

A subsequent direct HTTPS test explicitly disabled environment proxies (none were present). The global firmware URL returned HTTP 502, Server awselb/2.0, with the load balancer's HTML error page even without any query parameters or authentication. The global root returned 503 from the same server. In contrast, the China firmware URL without authentication returned HTTP 401 with the API's structured JSON error; the reconstructed signed request returned HTTP 200. A signed global B172 request also returned 502, so this is not specific to the spoofed B187 version or model. These results make a proxy CA or request-signing error an unlikely cause of this global 502; they do not prove all regional backends or routes are down.

The remaining request-path caveat is that the emulator experiment directly invokes the Java EarDeviceRepo implementation. The current app also contains a Flutter NtOldOTAApi implementation. Flutter's object pool contains the same iota. prefix and nothing.tech / nothingcn.com domains, but its full live firmware-screen request has not yet been captured. A successful China response with need_update=0 is not proof that no B187 firmware exists: region, rollout eligibility, or a different current route may matter.

The cancelled Frida/proxy background jobs were session instrumentation services, not pending firmware downloads. Their original experiment had already produced the captured responses above; direct rechecks do not require restarting those services.

## Correction: current Flutter firmware screen uses another API

Further ARM64 tracing resolves the caveat above: EarFirmwareProvider._getFirmware at 0x2d30050 calls NtDeviceApi/NtDeviceMixin.checkOta at 0x192a708. That method posts to `/device/otaCheck` (literal load at 0x192ad6c, post call at 0x192ad78), with fields mac, swVersion, modelId, isCrossBack, isAnc, appLanguageCode and userId. The call passes encrypt=true. The shared request encryption path calls AES ECB and RSA helpers and constructs keyPairId, timestamp, data and cipher fields. Its runtime host and successful response remain to be verified. Do not equate the legacy iota endpoint's 502 or no-update response with this current API's result.

Reproduction: tools/trace_dart_literals.py annotates the extracted ARM64 libapp.so using the partial Blutter pool and method map. Saved traces: research/flutter-firmware-screen-trace.txt, research/flutter-check-ota-trace.txt and research/flutter-encryption-trace.txt. This is a static call-chain finding, not yet a captured live Flutter request. The real phone's ADB connection was lost after the host restart; the old port refuses connections. A current wireless debugging address was requested for end-to-end verification.

## Real phone reconnected and current host resolved

Reconnected the Pixel after the host restart using its new wireless ADB endpoint. The user connected B187 buds and reopened the firmware screen; the real app displayed **Up to date**. This is a UI observation, not a decoded network capture. App logcat contains no HTTP/OTA requests; run-as is denied because the installed release package is not debuggable. No CA, VPN or replacement app was installed on the phone.

Static registration completes the current host chain: NtDeviceApi registration at 0x1b705b4 calls NtDeviceUrls.getDeviceBaseUrl at 0x1b72b2c. That returns https://nothingx.nothingcn.com for China and https://nothingx.nothingtech.link otherwise. The firmware screen uses NtDeviceApi explicitly. This differs from iota.

A bounded experimental reconstruction posted to https://nothingx.nothingtech.link/device/otaCheck using an RSA-wrapped random AES key and AES-ECB payload. It returned HTTP 200 with application code 420, msg authentication failed. Therefore that route is reachable; this experimental request is not yet accepted and cannot establish old-version firmware availability. More request/envelope/header details must be matched or a live request captured. The local probe is research/probe-current-ota.py; response is artifacts/network/current-api-experimental.json. Do not promote it to the scheduled check as a validated firmware client.

## B187 acquisition succeeded

The current API worked through an instrumented app copy on the real Pixel. Package com.nothing.smartcenter.lab was built alongside the original, with Frida Gadget loaded as a libflutter dependency. Only the lab copy's JNI signature exception paths were patched to avoid a crash after resigning. The original APK and its data were retained.

`tools/trace_flutter_ota.py` attaches only to the lab Gadget. The copy connected to the real B187 buds and first reported firmware 1.0.1.74. The tracer then replaced the checkOta version argument with an existing Dart pool string 0.0.0.0. This changes the app request in memory, not the buds' firmware version. The actual app generated and signed the encrypted POST to https://nothingx.nothingtech.link/device/otaCheck; the parsed result was code 200. Its data map was captured read-only from NResponse and decoded from Dart's compressed map/array/string layout.

The UI showed Update available (1.0.1.74), 1.14 mb, release note Fixed the GFPS bug. **Update was never pressed.** Metadata offered needUpdate=1, fileSize=1196218 and a CloudFront otaUrl. The image was downloaded on the Mac, independently of the phone's updater, and verified against both server size and SHA-256.

Verified artifact: artifacts/firmware/B187-1.0.1.74.bin

- Size: 1,196,218 bytes.
- SHA-256: 53573bd9e3a1bf6d65b7bed1e121bacb46cacfcd0036a2484bf33e0b3ce44f3b.
- Raw live metadata: artifacts/firmware/B187-current-api-live-metadata.json (ignored; contains the download URL).
- Winning trace: artifacts/network/flutter-live-1792892215127546000.jsonl (ignored; contains identifiers and app signing material).
- Re-download with tools/download_current_firmware.py METADATA --model B187 while its URL remains valid.

The BES container unpacks to artifacts/firmware/B187-1.0.1.74-decompressed.bin, 2,030,756 bytes, SHA-256 3bcb4037056ffb6e1d1a18826b2e472bc8cdf55d047a213ceba94f2f1430ba33. This footer omits APP_SIZE and reports NT_MODE_ID=0x87b1, the byte-swapped B187 identifier, matching the actual device model query. The unpacker now handles both observed footer forms. Decoded strings include SW_VER=1.0.1.74, CHIP=best1306p, BUILD_DATE=Feb 2 2026 18:01:00, REV_INFO=d065637e:best1306p. Do not infer chip identity solely from the server filename's BES2710IHC label.

Footer CRC A5F91CBA remains unverified: ordinary CRC32 of the whole decompressed image is 49DCF878. The compressed download's server SHA-256 is verified. No patched image was created or flashed.

The lab copy was force-stopped afterward, removing its in-memory spoof and listener. The original package was found disabled for user 0 during cleanup, re-enabled and launched successfully. The original binary/splits still reside at their original package path. The lab copy remains installed but stopped for future tracing. The isolated emulator's obsolete proxy setting was cleared.

Important request-reconstruction details learned from live tracing: the global API uses header appid=1, requestid and millisecond timestamp; signature is MD5 over sorted key=value& entries plus key=APP_SECRET. The emulator-recovered signing key matched the phone, and the host implementation's AES matched the app exactly only after reproducing its zero-to-block padding followed by PKCS7. However, reconstructed external requests still produced application errors; the actual app request is the validated acquisition path. Do not claim a standalone current-API client is complete.

## B187 wheel-ping reverse engineering with REA

REA 6.7.0 with Rizin 0.9.1 identified the matching B187's separate rotary
prompt helper and a prompt-stream rule `min(current_volume_index, 12)` for
prompt IDs 50/51. This image uses base **0x2c010000**, unlike the B172 reference.
Offline mute, fixed-index and reduced-index-slope candidates were prepared and
their selected Thumb paths checked with Unicorn. No firmware was flashed;
the raw candidates are not OTA containers. See [B187 volume-ping findings,
patch offsets, reproduction and limits](b187-volume-ping.md).

## Same-version stock reflash succeeded

The user subsequently authorized a stock reflash. The app's own unchanged
OTA implementation transferred the exact server-verified B187 1.0.1.74
container over the installed 1.0.1.74, completed its image check and overwrite
confirmation, and reported success. The buds reconnected and answered a fresh
C042 version query with 1.0.1.74. No patched firmware was flashed. The original
app was restored after the test. See [the full stock reflash evidence and
verification limits](b187-stock-reflash.md).

## Custom mute build and transfer

Both B187 CRC coverage rules have now been verified, all 16 stock streams
reproduce byte-for-byte, and a deterministic mute OTA container is built.
The authorized custom transfer and its final verification status are recorded
in [B187 custom flash](b187-custom-flash.md). Earlier statements about unknown
CRC coverage describe the earlier stage of this investigation.
