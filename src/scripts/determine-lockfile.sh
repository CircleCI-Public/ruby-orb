#!/usr/bin/env bash

TARGET_DIR="/tmp"
if [ -n "$HOMEDRIVE" ]; then
    TARGET_DIR="$HOMEDRIVE\\tmp"
fi

# Link corresponding lock file to a temporary file used by cache commands
if [ -n "$PARAM_OVERRIDE_LOCKFILE" ] && [ -f "$PARAM_OVERRIDE_LOCKFILE" ]; then
    echo "Using $PARAM_OVERRIDE_LOCKFILE as lock file"
    cp "$PARAM_OVERRIDE_LOCKFILE" $TARGET_DIR/ruby-project-lockfile
elif [[ "$PARAM_GEMFILE" == *.rb ]]; then
    GEMS_LOCKED="${PARAM_GEMFILE%.rb}.locked"

    if [ -f "$GEMS_LOCKED" ]; then
        echo "Using $GEMS_LOCKED as lock file"
        cp "$GEMS_LOCKED" $TARGET_DIR/ruby-project-lockfile
    else
        echo "Could not find $GEMS_LOCKED file"
    fi
elif [ -f "$PARAM_GEMFILE.lock" ]; then
    echo "Using $PARAM_GEMFILE.lock as lock file"
    cp "$PARAM_GEMFILE.lock" $TARGET_DIR/ruby-project-lockfile
else 
    echo "Unable to determine lock file for $PARAM_GEMFILE."
fi