#!/bin/bash
CURRENT_BRIGHTNESS="$(cat $1/brightness)"

if [ "$2" = "inc" ]; then
  echo $(("$CURRENT_BRIGHTNESS"+10)) > "$1/brightness"
elif [ "$2" = "dec" ]; then
  echo $(("$CURRENT_BRIGHTNESS"-10)) > "$1/brightness"
else
  echo "usage: set_brightness.sh <path-to-backlight> <inc|dec>"
fi
