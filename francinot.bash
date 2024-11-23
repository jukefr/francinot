#!/usr/bin/env bash

if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: francinot <module> <m/b>"
    echo "       francinot libft m"
    exit 1
fi

# Directory of the script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Execute against all the files in <module> with $2 as first argument
find "$SCRIPT_DIR/$1" -type f -name "*.bash" -exec bash {} "$2" ';'