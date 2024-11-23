#!/usr/bin/env bash

# Show executed commands
#set -x

# Data configuration
REPOSITORY="https://github.com/jukefr/libft-war-machine"
echo "Repository is $REPOSITORY"

# Create a temporary directory
TMP_DIR=$(mktemp -d)
echo "Temporary directory in $TMP_DIR"

# Copy the sources
cp -r "$PWD" "$TMP_DIR"

# Create a directory for the tests
TMP_DIR_TESTS="$TMP_DIR/libft/tests"
mkdir -p "$TMP_DIR_TESTS"

# Clone the tests
git clone "$REPOSITORY" "$TMP_DIR_TESTS"

# Run the tests
if [[ "$1" == "m" || "$1" == "mandatory" ]]; then
  bash "$TMP_DIR_TESTS"/grademe.sh
  bash "$TMP_DIR_TESTS"/grademe.sh
fi

if [[ "$1" == "b" || "$1" == "bonus" ]]; then
  bash "$TMP_DIR_TESTS"/grademe.sh
  bash "$TMP_DIR_TESTS"/grademe.sh
fi

# Clean up
rm -rf "$TMP_DIR"