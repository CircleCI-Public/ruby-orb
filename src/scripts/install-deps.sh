#!/usr/bin/env bash

if bundle config set > /dev/null 2>&1; then
  if [ "$PARAM_PATH" == "./vendor/bundle" ]; then
    bundle config deployment 'true'
  fi
  bundle config gemfile "$PARAM_GEMFILE"
  bundle config path "$PARAM_PATH"

  if [ -d "$HOME/.rvm/usr/ssl" ]; then
    echo "Detected rvm ssl version. Configuring bundle package with openssl dir $HOME/.rvm/usr."
    bundle config build.openssl --with-openssl-dir="$HOME/.rvm/usr"
  fi
else
  if [ "$PARAM_PATH" == "./vendor/bundle" ]; then
    bundle config set deployment 'true'
  fi
  bundle config set gemfile "$PARAM_GEMFILE"
  bundle config set path "$PARAM_PATH"

  if [ -d "$HOME/.rvm/usr/ssl" ]; then
    echo "Detected rvm ssl version. Configuring bundle package with openssl dir $HOME/.rvm/usr."
    bundle config set build.openssl --with-openssl-dir="$HOME/.rvm/usr"
  fi
fi

if [ "$PARAM_CLEAN_BUNDLE" = 1 ]; then
  bundle check || (bundle install && bundle clean --force)
else
  bundle check || bundle install
fi
