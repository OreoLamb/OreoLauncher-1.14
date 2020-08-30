#!/bin/bash
set -e
rootdir="$PWD"
cd ..
mkdir -p mcpe
cd mcpe
wget -O mcpe1141.7z "https://cdn.glitch.com/e2797375-4825-49cc-ac43-cd65567e27e4%2Fmcpe1141.7z?v=1598768138848"
wget -O mcpe190b3_x86.7z "https://cdn.glitch.com/e2797375-4825-49cc-ac43-cd65567e27e4%2Fmcpe190b3_x86.7z?v=1598768136005"
wget -O mcpe180.7z "https://cdn.glitch.com/e2797375-4825-49cc-ac43-cd65567e27e4%2Fmcpe180.7z?v=1598768097339"
#sha256sum -c "$rootdir/tools/ci/mc_archives_sha256sum.txt"

7z -p$ASSETS_PASSWORD -aoa x mcpe1141.7z
7z -p$ASSETS_PASSWORD -aoa x mcpe190b3_x86.7z
7z -p$ASSETS_PASSWORD -aoa x mcpe180.7z
#sha256sum -c "$rootdir/tools/ci/mc_sha256sum.txt"

rm -r 1141 190b3_x86 || true
7z -o1141 x mcpe1141.apk
# 180b3_x86: only used for linking against its libs
7z -o190b3_x86 x mcpe190b3_x86.apk lib
# 180: only used for xbox interop
