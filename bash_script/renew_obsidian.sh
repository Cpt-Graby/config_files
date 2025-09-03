#!/usr/bin/env bash

BASE_DIR=~/Documents

# Iterate over directories.
for dir in $BASE_DIR/*/ ; do
    #printf '%s\n' "$dir"
    if [[ $dir == "$BASE_DIR/obsidian/" ]] || [[ $dir == "$BASE_DIR/obsidian_alex/" ]]; then
        printf '%s\n' "$dir"
        rm -rf "$dir"
        printf '%s\n' "$dir"
    fi
done
git clone ssh://git@100non.ch:2222/grabibou/obsidian_alex.git obsidian
