#!/bin/sh
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S ttf-ms-fonts
yay -S prismlauncher
yay -S xnviewmp

git clone https://github.com/scripts-for-mistik/dotfiles.git
cd dotfiles
cp -r ./ /home/mistik
mkdir /home/mistik/temp

cd /home/mistik
git clone https://github.com/scripts-for-mistik/scripts.git

chmod +x /home/mistik/scripts/mcaselector/mcaselector
cd /home/mistik/scripts/mcmap
chmod +x *
chmod +x /home/mistik/scripts/mini_programs/cubiomes-viewer
chmod +x /home/mistik/scripts/mini_programs/screenshot

cd /home/mistik/scripts/mcaselector
7z x zulu.zip
rm zulu.z*
mkdir zulu
mv zulu.7z ./zulu
cd zulu
7z x zulu.7z
rm zulu.7z

chmod +x /home/mistik/scripts/mcaselector/zulu/bin/java
