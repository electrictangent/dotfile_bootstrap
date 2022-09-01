#!/usr/bin/env sh

killall -q polybar

#$HOME/.config/wp.py

wal -R
#while pgrep -x polybar >/dev/null; do sleep 1; done
#while pgrep -u $UID -x polybar; do sleep 1; done

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar i3wksp -c ~/.config/polybar/config & done
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar status -c ~/.config/polybar/config & done
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar music -c ~/.config/polybar/config & done
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar tray -c ~/.config/polybar/config & done

echo "Bars launched"
