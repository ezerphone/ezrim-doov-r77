#!/usr/bin/env bash
# build.sh BASE_APK [OUT_DIR]
# BASE_APK = MtkSystemUI.apk of the Doov R77 with the volume-dialog fix (md5 9b2c33b31ad7db40e2864e34394dc308).
# Output: OUT_DIR/MtkSystemUI.apk (default out/), signed by grafting BASE_APK's own v2/v3 block + META-INF.
set -euo pipefail
BASE=$(realpath "$1"); OUT=$(realpath -m "${2:-out}")
HERE=$(cd "$(dirname "$0")" && pwd)
WANT_MD5=9b2c33b31ad7db40e2864e34394dc308
[ "$(md5sum "$BASE" | cut -d' ' -f1)" = "$WANT_MD5" ] || { echo "base apk md5 is not $WANT_MD5" >&2; exit 1; }

T="$HERE/.toolcache"; mkdir -p "$T"
fetch() { [ -s "$T/$1" ] || curl -fsSL -o "$T/$1" "$2"; echo "$3  $T/$1" | sha256sum -c --quiet; }
fetch smali-2.5.2.jar    https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar    9544299578b16f771d8aa8eaefe0d3718ca03478c16f3c356f2fcf1366bfb116
fetch baksmali-2.5.2.jar https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar d3116248cce4f82ec5a31eb7f95ee75daff42ddf6eed0ab573973dc53fbad2e5

W=$(mktemp -d); trap 'rm -rf "$W"' EXIT
mkdir -p "$OUT"
( cd "$W" && unzip -q "$BASE" classes.dex classes2.dex )
java -jar "$T/baksmali-2.5.2.jar" d -a 34 "$W/classes.dex"  -o "$W/c1"
java -jar "$T/baksmali-2.5.2.jar" d -a 34 "$W/classes2.dex" -o "$W/c2"

python3 -I "$HERE/tools/port_qsrow.py" "$HERE/src/qsrow-a13/com/jelly/mods/qsrow" "$W/qsrow"
python3 -I "$HERE/tools/patch_r77.py" "$W/c1" "$W/c2" "$W/qsrow" "$HERE/src/HDate.smali"

mkdir -p "$W/dex"
java -jar "$T/smali-2.5.2.jar" a -j 1 -a 34 "$W/c1" -o "$W/dex/classes.dex"
java -jar "$T/smali-2.5.2.jar" a -j 1 -a 34 "$W/c2" -o "$W/dex/classes2.dex"
python3 - "$W/dex/classes.dex" <<'EOF'
import struct, sys
n = struct.unpack_from('<I', open(sys.argv[1], 'rb').read(0x70), 0x58)[0]
print('classes.dex method ids:', n); assert n <= 65535
EOF

# sanity: the volume dialog fix must survive, and every new reference must resolve
grep -q '0x10e0020' "$W/c1/com/android/systemui/volume/VolumeDialogImpl.smali"
python3 -I "$HERE/tools/refcheck.py" "$W/c1" "$W/c2" -- "$W/c2/com/jelly" "$W/c1/com/android/systemui/qs" "$W/c1/com/android/systemui/keyguard"

python3 -I "$HERE/tools/replace_dex.py" "$BASE" "$W/unsigned.apk" "$W/dex/classes.dex" "$W/dex/classes2.dex"
python3 -I "$HERE/tools/graft_sig.py" "$W/unsigned.apk" "$BASE" "$OUT/MtkSystemUI.apk"
( cd "$OUT" && md5sum MtkSystemUI.apk | tee MtkSystemUI.apk.md5 )
