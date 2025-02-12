#!/usr/bin/env bash

mkdir -p "$PARAM_OUT_PATH"

RUBOCOP_VERSION=$(bundle exec rubocop -v)
RUBOCOP_VERSION_MAJOR=$(echo "$RUBOCOP_VERSION" | cut -d. -f1)
RUBOCOP_VERSION_MINOR=$(echo "$RUBOCOP_VERSION" | cut -d. -f2)

if [ "$PARAM_PARALLEL" -eq 1 ]; then
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --format "$PARAM_FORMAT" \
  --parallel \
  --out $"$PARAM_OUT_PATH"/"$PARAM_FILE_OUT"
else
  if [ "$RUBOCOP_VERSION_MAJOR" -gt 1 ] || { [ "$RUBOCOP_VERSION_MAJOR" -eq 1 ] && [ "$RUBOCOP_VERSION_MINOR" -ge 13 ]; }; then
    bundle exec rubocop "$PARAM_CHECK_PATH" \
    --format "$PARAM_FORMAT" \
    --no-parallel \
    --out $"$PARAM_OUT_PATH"/"$PARAM_FILE_OUT"
  else
    bundle exec rubocop "$PARAM_CHECK_PATH" \
    --format "$PARAM_FORMAT" \
    --out $"$PARAM_OUT_PATH"/"$PARAM_FILE_OUT"
  fi
fi
