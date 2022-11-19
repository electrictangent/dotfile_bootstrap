#!/usr/bin/env bash
# Requires xsecurelock, xscreensaver
# Uses script at /usr/lib/systemd/system-sleep/xsecurelock
set -euo pipefail

LOCKSCREEN_DIR=~/.bin/lockscreen_images

export XSECURELOCK_LIST_VIDEOS_COMMAND="find ${LOCKSCREEN_DIR}/ -type f"
export XSECURELOCK_IMAGE_DURATION_SECONDS=10

if [ -z ${LOCKSCREEN_DIR+x} ]; then exit 1; fi # bail if lockscreen dir is not set

export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_FONT="Hack Nerd Font Mono"
export XSECURELOCK_PASSWORD_PROMPT="time_hex"
export XSECURELOCK_SHOW_HOSTNAME=1
export XSECURELOCK_SWITCH_USER_COMMAND="dm-tool switch-to-greeter"
export XSECURELOCK_SHOW_DATETIME=1
export XSECURELOCK_AUTH_FOREGROUND_COLOR="rgb:00/ff/00"

xsecurelock


