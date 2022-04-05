#!/usr/bin/env bash

mkdir -p "$PARAM_OUT_PATH"

set -x
bundle exec rubocop "$PARAM_CHECK_PATH" \
  --out $"$PARAM_OUT_PATH"/check-results.xml \
  --format "$PARAM_FORMAT" \
  ${PARAM_EXTRA_ARGS:+"$PARAM_EXTRA_ARGS"}