#!/usr/bin/env bash

PARAM_RUBY_VERSION=$(eval echo "${PARAM_VERSION}")

if ! openssl version | grep -q -E '1\.[0-9]+\.[0-9]+' 
then 
    echo "Did not find supported openssl version. Installing Openssl rvm package."
    rvm pkg install openssl
    # location of RVM is expected to be available at RVM_HOME env var
    WITH_OPENSSL="--with-openssl-dir=$RVM_HOME/usr"
fi

rvm install "$PARAM_RUBY_VERSION" "$WITH_OPENSSL"
rvm use "$PARAM_RUBY_VERSION"

RUBY_PATH="$(rvm $PARAM_RUBY_VERSION 1> /dev/null 2> /dev/null && rvm env --path)"
printf '%s\n' "source $RUBY_PATH" >> "$BASH_ENV"
