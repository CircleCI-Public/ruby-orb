#!/usr/bin/env bash

set -fx

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

# Backup IFS and set it to comma
readonly old_ifs="$IFS"
IFS=","

# Split globs per comma and rollback IFS
read -ra globs <<< "$PARAM_INCLUDE"

IFS=" "

echo "${globs[*]}"

split_files=$(circleci tests glob "spec/**/*_spec.rb" | circleci tests split --split-by=timings)

IFS="$old_ifs"

bundle exec rspec "$split_files" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress