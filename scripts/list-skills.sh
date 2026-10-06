#!/usr/bin/env bash
# Print every skill as "bucket/name: description".
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
for f in "$root"/skills/*/*/SKILL.md; do
  bucket="$(basename "$(dirname "$(dirname "$f")")")"
  name="$(basename "$(dirname "$f")")"
  desc="$(sed -n 's/^description: //p' "$f" | head -1)"
  printf '%s/%s: %s\n' "$bucket" "$name" "$desc"
done
