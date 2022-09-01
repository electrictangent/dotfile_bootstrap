#!/bin/bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

#CONNECTED_DISPLAY="$(xrandr | grep HDMI-0)"

#if [[ $CONNECTED_DISPLAY == *"disconnected"* ]]; then
#  ~/.screenlayout/single_layout.sh
#else
~/.screenlayout/dual_layout.sh
#fi
