#!/usr/bin/env bash

PARAM_RUBY_VERSION=$(eval echo "${PARAM_VERSION}")
RUBY_VERSION_MAJOR=$(echo "$PARAM_VERSION" | cut -d. -f1)
detected_platform="$(uname -s | tr '[:upper:]' '[:lower:]')"
if [ "$detected_platform" = "darwin" ] && [ "$RUBY_VERSION_MAJOR" -le 2 ]; then
    brew install openssl@1.1
    OPENSSL_LOCATION="$(brew --prefix openssl@1.1)"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_LOCATION"
    rbenv install $PARAM_RUBY_VERSION
    rbenv global $PARAM_RUBY_VERSION
    exit 0
fi

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
