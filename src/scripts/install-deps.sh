#!/usr/bin/env bash

if bundle config set > /dev/null 2>&1; then
  if [ "$PARAM_PATH" == "./vendor/bundle" ]; then
    bundle config deployment 'true'
  fi
  bundle config gemfile "$PARAM_GEMFILE"
  bundle config path "$PARAM_PATH"

  if [ -d /opt/circleci/.rvm ]; then
    RVM_HOME=/opt/circleci/.rvm
  else
    # Most circle builds run as a root user, in which case rvm gets installed in /usr/local/rvm instead of $HOME/.rvm
    RVM_HOME=$HOME/.rvm
    if [ ! -f "$RVM_HOME/scripts/rvm" ]; then
      RVM_HOME=/usr/local/rvm
    fi
  fi

  if [ -d "$RVM_HOME/usr/ssl" ]; then
    echo "Detected rvm ssl version. Configuring bundle package with openssl dir $RVM_HOME/usr."
    bundle config build.openssl --with-openssl-dir="$RVM_HOME/usr"
  fi
else
  if [ "$PARAM_PATH" == "./vendor/bundle" ]; then
    bundle config set deployment 'true'
  fi
  bundle config set gemfile "$PARAM_GEMFILE"
  bundle config set path "$PARAM_PATH"

  if [ -d "$RVM_HOME/usr/ssl" ]; then
    echo "Detected rvm ssl version. Configuring bundle package with openssl dir $RVM_HOME/usr."
    bundle config set build.openssl --with-openssl-dir="$RVM_HOME/usr"
  fi
fi

if [ "$PARAM_CLEAN_BUNDLE" = 1 ]; then
  bundle check || (bundle install && bundle clean --force)
else
  bundle check || bundle install
fi
