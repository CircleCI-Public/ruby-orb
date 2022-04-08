#!/usr/bin/env bash

rvm install "$PARAM_VERSION"
rvm use "$PARAM_VERSION"

readonly ruby_path="$(rvm $PARAM_VERSION 1> /dev/null 2> /dev/null && rvm env --path)"
printf '%s\n' "source $ruby_path" >> $BASH_ENV