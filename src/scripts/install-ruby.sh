#!/usr/bin/env bash

rvm install "$PARAM_VERSION"
rvm use "$PARAM_VERSION"
echo . "$(rvm $PARAM_VERSION; do rvm env --path)" >> $BASH_ENV