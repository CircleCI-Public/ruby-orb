#!/usr/bin/env bash

set -fx

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

# Backup IFS
readonly old_ifs="$IFS"

# Split globs per comma
IFS="," 
read -ra globs <<< "$PARAM_INCLUDE"

split_files=$(circleci tests glob "${globs[@]}" | circleci tests split)

printf '%s\n' "$split_files"

# Convert list of test files to array
while IFS= read -r line; do test_files+=("$line"); done <<< "$split_files"

printf '%s\n' "${test_files[@]}"

# Parse array of test files to string separated by single space and run tests
bundle exec rspec "${test_files[@]}" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress

# Rollback IFS
IFS="$old_ifs"