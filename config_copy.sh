#!/bin/bash

if [[ $1 = '' ]]; then
  echo "No username entered!"
  exit 1
fi

echo "Installing packages"
sudo pacman -Syu xautolock rxvt-unicode mpd scrot flameshot variety conky-lua-nv python-pywal i3-gaps polybar libmpd libmpdclient mpc ncmpcpp picom rofi lxappearance arandr feh powerline nerd-fonts-terminus nemo nemo-fileroller sox

echo "Copying config files to home directory for $1 at '/home/$1'"
echo "Are you sure you want to do this? (press 'y' to continue, any key to exit)"

read confirm

if [[ $confirm = 'y' ]]; then
  echo "Copying files..."
  cp -rvf home_root/. /home/$1/.
  echo "Finished!"
fi

echo "Setting terminal for file manager"
gsettings set org.cinnamon.desktop.default-applications.terminal exec urxvt
echo "Enabling mpd for user when they login"
systemctl --user enable mpd
echo "Add screenshots folder"
mkdir -p /home/$1/Pictures/screenshots
echo "Exiting..."
