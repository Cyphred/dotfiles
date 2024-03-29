#!/bin/sh -e
#
# Dynamically change font size in rxvt.
#

# Tweak this with your own font settings
readonly PREFIX='xft:Noto Sans Mono:size='

if [ -z "$1" ]; then
    echo 'Usage: fz <size>'
    exit 1
fi

printf '\33]50;%s%d\007' "$PREFIX" "$1"
