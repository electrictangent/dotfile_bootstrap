#!/bin/bash

# Set wallpaper
~/.config/variety/scripts/set_wallpaper ~/Pictures/default-wallpaper.jpg

# Remove first_load.sh from running again
awk '{gsub("exec --no-startup-id ~/.bin/first_load.sh", "#exec --no-startup-id ~/.bin/first_load.sh", $0); print}' ~/.config/i3/config > config.tmp && mv config.tmp ~/.config/i3/config
