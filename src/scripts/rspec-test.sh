#!/usr/bin/env bash

if [ "$CIRCLE_NODE_TOTAL" -eq 1 ]; then
  printf '%s\n' "Your job parallelism is set to 1."
  printf '%s\n' "The split test by timings requires at least 2 nodes to generate historical timing data."
  printf '%s\n' "Consider increasing your job parallelism to 2 or more."
  printf '%s\n' "See https://circleci.com/docs/guides/test/getting-started-with-smarter-testing/ for more information."
fi

if ! mkdir -p "$PARAM_OUT_PATH"; then
  printf '%s\n' "Failed to create output directory: \"$PARAM_OUT_PATH\""
  exit 1
fi

set -x
circleci testsuite run "$PARAM_SUITE_NAME"
