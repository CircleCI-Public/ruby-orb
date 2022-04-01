#!/usr/bin/env bash

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

# Backup IFS and set it to comma
readonly old_ifs="$IFS"
IFS=","

# Split globs per comma and rollback IFS
read -ra globs <<< "$PARAM_INCLUDE"
IFS="$old_ifs"

set -x

readonly test_files=$(circleci tests glob "${globs[@]}")

echo "!!!!"
echo "$test_files"

readonly TESTFILES=$(circleci tests glob "${globs[@]}" | circleci tests split --split-by=timings)
# bundle exec rspec "$TESTFILES" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress