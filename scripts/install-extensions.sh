#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while read -r ext; do
    [[ -z "$ext" || "$ext" =~ ^# ]] && continue
    code --install-extension "$ext"
done < "$SCRIPT_DIR/extensions.txt"