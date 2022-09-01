#!/usr/bin/env bash
echo "IMPORTANT! Switch 'copy' to 'sync' after initial run!"
echo "Not meant to be run on startup"

##########################################
##        Run once on startup           ##
##########################################

pacman -Qqen > ~/.config/installed_packages.lst
pacman -Qqem > ~/.config/installed_packages_aur.lst

# Config folder backup
rclone sync --fast-list --exclude Nextcloud/** --exclude Atom/** --exclude discord/** --exclude chromium/** -P ~/.config cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.config
rclone sync --fast-list --exclude Trash/** -P ~/.local cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.local
rclone sync --fast-list -P ~/.bin cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.bin
rclone sync --fast-list -P ~/.screenlayout cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.screenlayout
rclone sync --fast-list -P ~/.themes cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.themes
rclone sync --fast-list -P ~/.gitconfig cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.gitconfig
rclone sync --fast-list -P ~/.cinnamon cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.cinnamon
rclone sync --fast-list -P ~/.arduino15 cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.arduino15
#rclone sync --fast-list -P ~/.minecraft cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.minecraft
rclone sync --fast-list -P ~/.jupyter cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.jupyter
rclone sync --fast-list -P ~/.FreeCAD cloud-lilcalcboy_main:/.strawberry/dotfiles/app_configs/.FreeCAD

# Dotfile backup
rclone sync  -P ~/.bashrc cloud-lilcalcboy_main:/.strawberry/dotfiles
rclone sync  -P ~/.zshrc cloud-lilcalcboy_main:/.strawberry/dotfiles
rclone sync  -P ~/.Xdefaults cloud-lilcalcboy_main:/.strawberry/dotfiles
rclone sync  -P ~/.xinitrc cloud-lilcalcboy_main:/.strawberry/dotfiles


# Music, Videos and Pictures
#rclone copy --exclude /home/ethan/Videos/The.Death.of.Stalin.2017.1080p.BluRay.X264-AMIABLE[EtHD].mkv -P ~/Videos cloud-lilcalcboy_main:/Videos
rclone copy --fast-list -P ~/Music cloud-lilcalcboy_main:/Music
rclone copy --fast-list -P --exclude /home/ethan/Pictures/Multi\ monitor\ wallpapers/** ~/Pictures cloud-lilcalcboy_main:/Pictures


#########################
#    Encrypted copies
#########################

# VirutalBox
rclone sync  --fast-list -P --exclude cloud-lilcalcboy/** --exclude OS\ Installation\ Images/** -P ~/Documents cloud-lilcalcboy_crypt:/.secret/Documents


##########################################
##  Run every 10 minutes after startup  ##
##########################################

# Documents (encrypted)

rclone copy --fast-list -P ~/VirtualBox\ VMs cloud-lilcalcboy_crypt:/.strawberry/.secret/VirtualBox\ VMs
