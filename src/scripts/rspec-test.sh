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

my_globs="${globs[@]}"

files="$(circleci tests glob "$my_globs")"

echo "!!!!!!"
echo $files

split="$(echo $files | circleci tests split --split-by=timings)"

echo "######"
echo "$split"

readonly TESTFILES=$(circleci tests glob "${globs[@]}" | circleci tests split --split-by=timings)

echo "$TESTFILES"

# bundle exec rspec "$TESTFILES" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress