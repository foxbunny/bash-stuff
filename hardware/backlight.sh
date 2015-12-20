#!/bin/bash

## Smarter backlight control

set -e

BL=$(which xbacklight)
MIN_LEVEL=10
MAX_LEVEL=100

command=$1
param=$2

case "$command" in
    inc)
        $BL -inc $param
        ;;
    dec)
        if [ $(echo "$($BL) - $param < $MIN_LEVEL" | bc) == "1" ]
        then
            $BL =$MIN_LEVEL
        else
            $BL -$param
        fi
        ;;
esac
