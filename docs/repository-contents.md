# Private research snapshot

This repository preserves the working project, matching firmware and evidence
for the successful B187 wheel-ping mute experiment. It is intentionally private.

Included:

- Android helper source, tools, tests, examples and research documentation.
- Exact B187 stock container and decoded image, offline variants, final custom
  mute OTA image, manifests, disassembly and REA findings.
- Earlier B172 binary and offline comparison findings, kept separate by name.
- Original and custom transfer verification reports and native logs, plus a
  narrow post-reboot log extract. Long packet logging is truncated as described
  in the verification documents.
- The installed, successfully used Nothing X Lab APK in **Git LFS**; the small
  Buds Lab APK is also included. The lab APK is modified packaging with original
  OTA code, as documented; it is not an untouched official APK.
- Lab APK preparation and clone signature-exception patch scripts.

Excluded: downloaded toolchains, Python environments, upstream clones, bulk
decompilation output, intermediate APK builds, redundant original app APK
copies, raw Flutter/HTTP/Frida network captures, server-response metadata and
temporary files. Local ignored files are retained on the original workstation.
The saved native device logs still contain device identifiers; keep them private.

Use Git LFS when cloning to retrieve the lab APK. Firmware `.bin` files are
stored directly in Git. `snapshot-manifest.json` records the SHA-256 and size
of each selected payload file at this snapshot.

For AOT analysis, the matching library can be recovered from the saved APK:

```sh
mkdir -p research/native
unzip -p artifacts/reflash/installed-lab.apk lib/arm64-v8a/libapp.so > research/native/libapp.so
```

The app-code comparison report records its expected SHA-256. APK installation
alone does not reproduce phone pairing, permissions or current firmware state.
Stock restoration after the successful custom flash has not been tested.
