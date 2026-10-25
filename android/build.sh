#!/bin/sh
set -eu
cd "$(dirname "$0")"
SDK_ROOT="${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}"
BT="$SDK_ROOT/build-tools/36.0.0"
JAR="$SDK_ROOT/platforms/android-36/android.jar"
mkdir -p build/classes build/dex ../artifacts
javac -source 8 -target 8 -cp "$JAR" -d build/classes src/MainActivity.java
"$BT/d8" --lib "$JAR" --output build/dex build/classes/dev/nothingx/lab/*.class
"$BT/aapt2" link -I "$JAR" --manifest AndroidManifest.xml -o build/unsigned.apk
(cd build/dex && zip -q ../unsigned.apk classes.dex)
"$BT/zipalign" -f 4 build/unsigned.apk build/aligned.apk
if [ ! -f build/lab.keystore ]; then
 keytool -genkeypair -keystore build/lab.keystore -storepass android -keypass android -alias lab -dname 'CN=Buds Lab Development' -keyalg RSA -validity 3650
fi
"$BT/apksigner" sign --ks build/lab.keystore --ks-pass pass:android --out ../artifacts/buds-lab.apk build/aligned.apk
"$BT/apksigner" verify ../artifacts/buds-lab.apk
