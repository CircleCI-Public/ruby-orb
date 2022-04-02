#!/usr/bin/env bash

set -x

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

# Backup IFS and set it to comma
readonly old_ifs="$IFS"
IFS=","

# Split globs per comma and 
read -ra globs <<< "$PARAM_INCLUDE"

# Change IFS to space and run CLI command with glob files
IFS=" "
test_files="$(printf "%s " "${globs[@]}")"
split_files="$(circleci tests glob "$test_files" | circleci tests split --split-by=timings)"

# Rollback IFS
IFS="$old_ifs"

bundle exec rspec "$split_files" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress