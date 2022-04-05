#!/usr/bin/env bash

mkdir -p "$PARAM_OUT_PATH"
bundle exec rubocop "$PARAM_CHECK_PATH" --out $"$PARAM_OUT_PATH"/check-results.xml --format "$PARAM_FORMAT"