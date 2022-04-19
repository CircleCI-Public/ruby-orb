#!/usr/bin/env bash

PARAM_RUBY_VERSION=$(eval echo "${PARAM_VERSION}")

rvm install "$PARAM_RUBY_VERSION"
rvm use "$PARAM_RUBY_VERSION"

readonly ruby_path="$(rvm $PARAM_RUBY_VERSION 1> /dev/null 2> /dev/null && rvm env --path)"
printf '%s\n' "source $ruby_path" >> $BASH_ENV
