#!/bin/sh
echo "WARNING: This script only works for Arch based distributions!"

sudo pacman -S neovim neofetch xorg kitty polybar rofi maim xdotool xclip

git clone https://aur.archlinux.org/paru.git && cd paru && makepkg-si

paru -S shell-color-scripts i3-gaps pfetch

cp -r * ~/.config
