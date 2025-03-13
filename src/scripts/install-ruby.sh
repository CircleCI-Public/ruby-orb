#!/usr/bin/env bash

PARAM_RUBY_VERSION=$(eval echo "${PARAM_VERSION}")
RUBY_VERSION_MAJOR=$(echo "$PARAM_VERSION" | cut -d. -f1)
RUBY_VERSION_MINOR=$(echo "$PARAM_VERSION" | cut -d. -f2)
detected_platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

# When on MacOS, and versions minor or equal to 3.0.x. These are the versions depending on OpenSSL 1.1
if [[ ( "$RUBY_VERSION_MAJOR" -le 2 || ( "$RUBY_VERSION_MAJOR" -eq 3  &&  "$RUBY_VERSION_MINOR" -eq 0 ) ) ]]; then
    if [[ "$detected_platform" = "darwin" ]]; then
        rbenv install $PARAM_RUBY_VERSION
        rbenv global $PARAM_RUBY_VERSION
        exit 0
    else
        if [ -n "$PARAM_OPENSSL_PATH" ]; then
            echo "Using path $PARAM_OPENSSL_PATH for OpenSSL"
            WITH_OPENSSL="--with-openssl-dir=$PARAM_OPENSSL_PATH"
        elif ! openssl version | grep -q -E '1\.[0-9]+\.[0-9]+'; then 
            echo "Did not find supported openssl version. Installing Openssl rvm package."
            rvm pkg install openssl
            # location of RVM is expected to be available at RVM_HOME env var
            WITH_OPENSSL="--with-openssl-dir=$RVM_HOME/usr"
        fi
    fi
else
    rvm autolibs enable
fi

rvm get master
rvm install "$PARAM_RUBY_VERSION" "$WITH_OPENSSL"
rvm use "$PARAM_RUBY_VERSION"

RUBY_PATH="$(rvm $PARAM_RUBY_VERSION 1> /dev/null 2> /dev/null && rvm env --path)"
printf '%s\n' "source $RUBY_PATH" >> "$BASH_ENV"
