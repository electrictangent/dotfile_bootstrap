#!/bin/bash

#pidof xautolock

if [ -z "$(pidof xss-lock)" ]; then
  #xautolock -time 10 -locker '~/.bin/lock.sh' &
  xset s 300 5
  echo sleep on
  xss-lock -n /usr/lib/xsecurelock/dimmer -l -- ~/.bin/lock.sh
  #xset s off -dpms
  #notify-send '   Sleep is now enabled' --expire-time 1
else
  killall xss-lock
  echo sleep off
  xset s off -dpms
  #notify-send '   Sleep is now disabled' --expire-time 1
fi
