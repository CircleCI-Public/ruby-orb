#!/usr/bin/env bash

mkdir -p "$PARAM_OUT_PATH"

if [ "$PARAM_PARALLEL" -eq 0 ]; then
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --format "$PARAM_FORMAT" \
  --out $"$PARAM_OUT_PATH"/check-results.xml
else
  bundle exec rubocop "$PARAM_CHECK_PATH" \
  --parallel \
  --format "$PARAM_FORMAT" \
  --out $"$PARAM_OUT_PATH"/check-results.xml
fi
