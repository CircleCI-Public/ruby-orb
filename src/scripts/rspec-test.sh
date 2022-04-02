#!/usr/bin/env bash

set -x

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

# Backup IFS and set it to comma
readonly old_ifs="$IFS"
IFS=","

# Split globs per comma and change IFS to space
read -ra globs <<< "$PARAM_INCLUDE"
IFS=" "

# Run CLI command with glob files separated by space and rollback IFS
test_files="$(circleci tests glob ${globs[*]} | circleci tests split --split-by=timings)"
IFS="$old_ifs"

bundle exec rspec "$test_files" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress