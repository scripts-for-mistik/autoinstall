#!/bin/sh
ln -sf /usr/share/zoneinfo/Europe/Kyiv /etc/localtime
hwclock —systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo uk_UA.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen
localectl set-locale LANG=uk_UA.UTF-8 UTF-8

echo pavilion > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo 127.0.1.1 mistik >> /etc/hosts

pacman -S networkmanager
systemctl enable NetworkManager

pacman -S sudo
echo %wheel ALL=(ALL:ALL) NOPASSWD: ALL >> /etc/sudoers
useradd -m mistik
usermod -aG wheel,video,audio,storage,floppy mistik
passwd
passwd mistik

pacman -S grub efibootmgr os-prober dosfstools ntfs-3g
grub-install /dev/sda
echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S pipewire-pulse pipewire-alsa
pacman -S xfce4 xfce4-goodies gvfs gvfs-mtp pavucontrol network-manager-applet

mkdir /home/mistik

echo EDITOR=micro >> /home/mistik/.bashrc
echo export EDITOR >> /home/mistik/.bashrc
echo "alias sudo='sudo '" >> /home/mistik/.bashrc
echo alias 'qemu="qemu-system-x86_64"' >> /home/mistik/.bashrc
echo "[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startxfce4" >> /home/mistik/.bash_profile
echo 'export PATH="/home/svyatik/scripts/mini_programs:$PATH"' >> /home/mistik/.bashrc
echo 'export PATH="/home/svyatik/scripts/mcaselector:$PATH"' >> /home/mistik/.bashrc
echo 'export PATH="/home/svyatik/scripts/mcmap:$PATH"' >> /home/mistik/.bashrc

pacman --needed -S base-utils

pacman --needed -S firefox obs-studio telegram-desktop git xarchiver qbittorrent audacity gimp qalculate-qt imagemagick libreoffice-fresh gparted flameshot micro jdk8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk git wget kdenlive android-tools cdrtools qemu-desktop 7zip unrar unzip zip xorg yt-dlp alsa-utils arch-install-scripts htop xdg-user-dirs mediainfo-gui mc scrot

cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S ttf-ms-fonts
yay -S polymc-qt5-bin
yay -S xnviewmp

git clone https://github.com/scripts-for-mistik/dotfiles.git
cd dotfiles
cp -r ./ /home/mistik

cd /home/mistik
git clone https://github.com/scripts-for-mistik/scripts.git