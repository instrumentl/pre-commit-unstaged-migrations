#!/bin/bash

set -euo pipefail

MIGRATE_PATH="db/migrate/"

if [[ ! -d "$MIGRATE_PATH" ]]; then
    exit 0
fi

if git status --porcelain "$MIGRATE_PATH" | grep -q "^??"; then
    echo >&2 "found unstaged files in $MIGRATE_PATH: $(git status --porcelain "$MIGRATE_PATH" | cut -d ' ' -f 2-)"
    exit 1
fi
