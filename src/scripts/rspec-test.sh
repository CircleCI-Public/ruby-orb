#!/usr/bin/env bash

# Disable bash glob expansion
# Without this, the glob parameter will be expanded before the split command is run
set -o noglob


if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

# Backup IFS
readonly old_ifs="$IFS"

# Split globs per comma and run the CLI split command
IFS="," 
read -ra globs <<< "$PARAM_INCLUDE"
split_files=$(circleci tests glob "${globs[@]}" | circleci tests split --split-by=timings)

# Convert list of test files to array
# This is necessary because the split command returns a list of files separated by newline
while IFS= read -r line; do test_files+=("$line"); done <<< "$split_files"

# Rollback IFS
IFS="$old_ifs"

# Parse array of test files to string separated by single space and run tests
set -x
bundle exec rspec "${test_files[@]}" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress
set +x