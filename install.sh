#!/bin/bash
# install.sh: installs required packages, makes new user and copies over all
# config files
#
# $1 -> username
#

# =============================================
#   Data Cleansing
# =============================================
if [[ $1 = '' ]]; then
  echo "No username entered!"
  exit 1
fi

if [[ $1 = '--help' ]]; then
  echo "install.sh: install packages and copy config files to new user"
  echo
  echo "Usage: ./install.sh <username>"
  echo "    <username> - Enter a username"
  exit 0
fi

if [[ ! "$1" != *[^[:alnum:]/]* ]]; then
  echo "The username you inputted contains special characters."
  echo "Input only alphanumeric characters."
  exit 1
fi


# =============================================
#   0. add required packages
# =============================================
echo "Installing packages"
sudo pacman -Syu yay xautolock rxvt-unicode mpd flameshot variety conky-lua-nv i3-gaps libmpd libmpdclient mpc ncmpcpp picom polybar rofi python-pywal lxappearance arandr feh powerline nerd-fonts-terminus nemo nemo-fileroller sox

# =============================================
#   1. add user, with shell set as zsh
# =============================================
echo "Creating user with name '$1' at '/home/$1'"
echo "Are you sure you want to do this? (press 'y' to continue, any key to exit)"
echo -n " >  "
read confirm

if [[ $confirm = 'y' ]]; then
  sudo useradd -m -s /usr/bin/zsh $1
  sudo passwd $1
  echo "Complete!"
  echo
else
  echo "Exiting..."
  exit 0
fi

echo "Do you want to add a display name for the user $1?"
echo "Press 'y' to continue, any key to skip"
echo -n " >  "
read confirm

if [[ $confirm = 'y' ]]; then
  echo -n "Enter display name: "
  read disp_name

  while [[ $disp_name == *['!'@#\$%^\&*()_+']''[''>''<''{''}''/']* ]]; 
  do
    echo "The username you inputted contains special characters."
    echo "Input only alphanumeric characters and spaces."
    echo
    echo -n "Enter display name: "
    read disp_name
  done
  sudo usermod -c "$disp_name" $1

else
  echo "Not setting display name, continuing..."
  echo
fi

# =============================================
#   2. copy config files
# =============================================
echo "Copying files..."
sudo cp -rvf home_root/. /home/$1/.
sudo chown -R $1:$1 /home/$1

echo "Setting terminal for file manager..."
sudo -u $1 gsettings set org.cinnamon.desktop.default-applications.terminal exec urxvt
echo "Enabling mpd to start when user logs in"
sudo -u $1 systemctl --user enable mpd
echo "Finished!"
