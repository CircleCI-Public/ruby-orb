#!/usr/bin/env bash

mkdir -p "$PARAM_OUT_PATH"

if [ "$PARAM_PARALLEL" -eq 1 ]; then
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --out $"$PARAM_OUT_PATH"/check-results.xml \
  --format "$PARAM_FORMAT"
else
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --out $"$PARAM_OUT_PATH"/check-results.xml \
  --format "$PARAM_FORMAT" \
  --no-parallel
fi
