#!/usr/bin/env bash

# Show executed commands
#set -x

# Data configuration
REPOSITORY="https://codeberg.org/juke/libft_tests"
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
if [[ "$1" == "m" ]]; then
  make -C "$TMP_DIR_TESTS"
fi

if [[ "$1" == "b" ]]; then
  make -C "$TMP_DIR_TESTS" bonus
fi

# Clean up
rm -rf "$TMP_DIR"