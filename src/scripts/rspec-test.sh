#!/usr/bin/env bash

# set -x

quoted_globs=""

function quote_globs() {
  local IFS=","

  read -ra params <<< "$PARAM_INCLUDE"

  for param in "${params[@]}"; do
    if [ -z "$quoted_globs" ]; then
      quoted_globs="\"$param\""
    else
      quoted_globs="$quoted_globs \"$param\""
    fi
  done
}

if ! quote_globs; then
  printf '%s\n' "Failed to quote globs: \"$PARAM_INCLUDE\""
  exit 1
fi

echo "$quoted_globs"

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

echo "!!!!!!!"
circleci tests glob "$quoted_globs"
# echo "$TEMP"

# readonly TESTFILES=$(circleci tests glob "$quoted_globs" | circleci tests split --split-by=timings)
# bundle exec rspec "$TESTFILES" --profile 10 --format RspecJunitFormatter --out "$PARAM_OUT_PATH"/results.xml --format progress