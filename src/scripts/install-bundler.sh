#!/usr/bin/env bash

TARGET_DIR="/tmp"
if [ -n "$HOMEDRIVE" ]; then
    TARGET_DIR="$HOMEDRIVE\\tmp"
fi

if test -f "$TARGET_DIR/ruby-project-lockfile"; then
  APP_BUNDLER_VERSION=$(cat "$TARGET_DIR/ruby-project-lockfile" | tail -1 | tr -d " ")
  if [ -z "$APP_BUNDLER_VERSION" ]; then
    echo "Could not find bundler version from lockfile. Please use bundler-version parameter"
  else
    echo "Lock file detected bundler version $APP_BUNDLER_VERSION"
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
