#!/bin/sh

if [ -n "$RELAY_TARGET" ]; then
    echo "$RELAY_TARGET" > /root/target
else
    echo >&2 "Error: RELAY_TARGET not set"
fi

exec rsyslogd "$@"
