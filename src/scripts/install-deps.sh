#!/usr/bin/env bash

if bundle config set > /dev/null 2>&1; then
  if [ "$PARAM_PATH" == "./vendor/bundle" ]; then
    bundle config deployment 'true'
  fi
  bundle config gemfile "$PARAM_GEMFILE"
  bundle config path "$PARAM_PATH"
else
  if [ "$PARAM_PATH" == "./vendor/bundle" ]; then
    bundle config set deployment 'true'
  fi
  bundle config set gemfile "$PARAM_GEMFILE"
  bundle config set path "$PARAM_PATH"
fi

bundle check || bundle install