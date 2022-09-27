#!/usr/bin/env bash

if test -f "$PARAM_GEMFILE.lock"; then
  APP_BUNDLER_VERSION=$(cat "$PARAM_GEMFILE.lock" | tail -1 | tr -d " ")
  if [ -z "$APP_BUNDLER_VERSION" ]; then
    echo "Could not find bundler version from $PARAM_GEMFILE.lock. Please use bundler-version parameter"
  else
    echo "$PARAM_GEMFILE.lock is bundled with bundler version $APP_BUNDLER_VERSION"
  fi
fi

if [ -n "$PARAM_BUNDLER_VERSION" ]; then
  echo "Found bundler-version parameter to override"
  APP_BUNDLER_VERSION="$PARAM_BUNDLER_VERSION"
fi

if ! bundle version | grep -q $APP_BUNDLER_VERSION; then
  echo "Installing bundler $APP_BUNDLER_VERSION"
  gem install bundler:$APP_BUNDLER_VERSION
else
  echo "bundler $APP_BUNDLER_VERSION is already installed."
fi

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