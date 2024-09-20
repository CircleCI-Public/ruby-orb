#!/usr/bin/env bash

mkdir -p "$PARAM_OUT_PATH"

if [ "$PARAM_PARALLEL" -eq 1 ]; then
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --format "$PARAM_FORMAT" \
  --out $"$PARAM_OUT_PATH"/check-results.xml
else
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --format "$PARAM_FORMAT" \
  --no-parallel \
  --out $"$PARAM_OUT_PATH"/check-results.xml
fi
