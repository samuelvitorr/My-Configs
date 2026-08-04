#!/usr/bin/env bash
set -euo pipefail

# Installs JetBrains plugins listed in <IDE>/plugins.txt from the marketplace.
# Usage: install-jetbrains-plugins.sh <pycharm|idea> [build]
#   build defaults to the installed IDE build (~/.local/share/JetBrains/*/marketplace/platform-build.txt)
#   override install dir with DEST=/path to preview (dry run with DEST=/tmp/x)

IDE="${1:?usage: install-jetbrains-plugins.sh <pycharm|idea>}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
API="https://plugins.jetbrains.com"

case "$IDE" in
  pycharm) GLOB="$HOME/.local/share/JetBrains/PyCharmCE"* LIST="$DIR/PyCharm/plugins.txt";;
  idea)    GLOB="$HOME/.local/share/JetBrains/IdeaIC"*    LIST="$DIR/IntelliJ/plugins.txt";;
  *) echo "unknown IDE: $IDE (use pycharm|idea)" >&2; exit 1;;
esac

DEST="${DEST:-$(ls -d $GLOB 2>/dev/null | sort -V | tail -1)}"
[ -n "$DEST" ] || { echo "IDE dir not found for $IDE (set DEST=...)" >&2; exit 1; }
BUILD="${2:-$(grep -oE '[0-9]+\.[0-9]+' "$DEST/marketplace/platform-build.txt" | head -1)}"
PLATFORM="${BUILD%%.*}"
[ -n "$BUILD" ] || { echo "could not determine build (pass as 2nd arg)" >&2; exit 1; }

while read -r xmlid; do
  [ -n "$xmlid" ] || continue
  meta=$(curl -s "$API/api/searchPlugins?search=$xmlid&max=1")
  id=$(echo "$meta" | jq -r '.plugins[]? | select(.xmlId=="'"$xmlid"'") | .id' | head -1)
  [ -n "$id" ] || { echo "!! $xmlid not found on marketplace" >&2; continue; }
  upd=$(curl -s "$API/api/plugins/$id/updates?build=$BUILD&size=100")
  pick='[.[] | select((.since | gsub("[^0-9.]";"") | split(".")[0] | tonumber) <= ($p | tonumber)) | .sinceMajor = (.since | gsub("[^0-9.]";"") | split(".")[0] | tonumber)] | sort_by([.sinceMajor == ($p | tonumber), (.cdate | tonumber)]) | reverse | .[0]'
  ver=$(echo "$upd" | jq -r --arg p "$PLATFORM" "$pick"'.version // empty')
  file=$(echo "$upd" | jq -r --arg p "$PLATFORM" "$pick"'.file // empty')
  [ -n "$file" ] || { echo "!! $xmlid no version for platform $PLATFORM" >&2; continue; }
  curl -sL "$API/files/$file" -o /tmp/jb-plugin.zip
  unzip -Z1 /tmp/jb-plugin.zip > /tmp/jb-plugin.list
  top=$(cut -d/ -f1 /tmp/jb-plugin.list | head -1)
  if [ -d "$DEST/$top" ]; then echo "== $xmlid already installed ($ver)"; continue; fi
  echo ">> installing $xmlid ($ver)"
  unzip -oq /tmp/jb-plugin.zip -d "$DEST"
done < "$LIST"

echo "done: $DEST"
