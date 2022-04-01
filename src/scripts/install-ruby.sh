#!/usr/bin/env bash

rvm install "$PARAM_VERSION"
rvm use "$PARAM_VERSION"
echo . $(rvm "$PARAM_VERSION" 1> /dev/null 2> /dev/null && rvm env --path) >> $BASH_ENV