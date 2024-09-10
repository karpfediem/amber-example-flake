#!/usr/bin/env bash
set -e
OUT_DIR="scripts"
NIX_OUT_PATH=$(nix build ".#amber-scripts" --print-out-paths --no-link)
mkdir -p "$OUT_DIR"
chmod -R 755 "$OUT_DIR"
if [[ $NIX_OUT_PATH == /nix/store/* ]]; then
  chmod -R u+w "$OUT_DIR"
  rsync -av --delete $NIX_OUT_PATH/ "$OUT_DIR"
  chmod -R u+w "$OUT_DIR"
else
  exit 1
fi
git add "$OUT_DIR"