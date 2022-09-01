#!/bin/bash

#pidof xautolock

if [ -z "$(pidof xautolock)" ]; then
  xautolock -time 10 -locker '~/.bin/lock.sh' &
  xset s on +dpms
  #notify-send '   Sleep is now enabled' --expire-time 1
else
  killall xautolock
  xset s off -dpms
  #notify-send '   Sleep is now disabled' --expire-time 1
fi
