#!/usr/bin/env bash
# Builds the demo index for docs/demo.tape: your Homebrew programs plus two sample scripts.
set -e
d=/tmp/los-demo
rm -rf "$d" && mkdir -p "$d/bin" "$d/cache/los"
printf '#!/bin/bash\n# Backs up my dotfiles to the NAS.\n' >"$d/bin/backup-dotfiles"
printf '#!/bin/bash\n# Converts all videos in a folder to MP4.\n' >"$d/bin/to-mp4"
chmod +x "$d/bin"/*
printf '%s\n' kontor simple-comic-paper crossover viscosity >"$d/ignore"
XDG_CACHE_HOME="$d/cache" LOS_PATHS="$d/bin" LOS_IGNORE="$d/ignore" LOS_DESCRIPTIONS=/dev/null ./los --refresh >/dev/null
touch -t 203001010000 "$d/cache/los/index.tsv"   # keep los from rebuilding it
