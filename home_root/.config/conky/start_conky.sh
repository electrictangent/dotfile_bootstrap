#!/bin/bash
# Based on https://github.com/xexpanderx/conky-pywal/blob/master/start_conky.sh

killall conky
~/.config/conky/apply_pywal.sh
conky --config ~/.config/conky/pywal_applied/clock.lua &
conky --config ~/.config/conky/pywal_applied/network.lua &
while inotifywait -qqe modify ~/.cache/wal/colors.Xresources; do ~/.config/conky/apply_pywal.sh ; done
