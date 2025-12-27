#!/bin/sh
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S ttf-ms-fonts
pacman -S prismlauncher
yay -S xnviewmp

git clone https://github.com/scripts-for-mistik/dotfiles.git
cd dotfiles
cp -r ./ /home/mistik

cd /home/mistik
git clone https://github.com/scripts-for-mistik/scripts.git
