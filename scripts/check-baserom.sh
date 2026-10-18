#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f "baserom.us.z64" ]]; then
  echo "Missing baserom.us.z64. Provide your own legally obtained base ROM."
  exit 1
fi

size="$(wc -c < baserom.us.z64)"
if (( size < 1000000 )); then
  echo "baserom.us.z64 is unexpectedly small (${size} bytes)."
  exit 1
fi

echo "Base ROM file exists and passed the basic size check."
echo "This does not validate its region, hash, or compatibility."
