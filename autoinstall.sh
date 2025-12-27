#!/bin/sh
ln -sf /usr/share/zoneinfo/Europe/Kyiv /etc/localtime
hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo uk_UA.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen
echo "LANG=uk_UA.UTF-8" | sudo tee /etc/locale.conf

echo pavilion > /etc/hostname

pacman --needed -S networkmanager
systemctl enable NetworkManager

pacman --needed -S sudo
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
useradd -m mistik
usermod -aG wheel,video,audio,storage,floppy mistik
passwd
passwd mistik

pacman --needed -S grub os-prober dosfstools ntfs-3g
grub-install /dev/sda
echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

pacman --needed -S pipewire-pulse pipewire-alsa
pacman --needed -S xfce4 xfce4-goodies gvfs gvfs-mtp pavucontrol network-manager-applet

echo EDITOR=micro >> /home/mistik/.bashrc
echo export EDITOR >> /home/mistik/.bashrc
echo "alias sudo='sudo '" >> /home/mistik/.bashrc
echo alias 'qemu="qemu-system-x86_64"' >> /home/mistik/.bashrc
echo 'export PATH="/home/svyatik/scripts/mini_programs:$PATH"' >> /home/mistik/.bashrc
echo 'export PATH="/home/svyatik/scripts/mcaselector:$PATH"' >> /home/mistik/.bashrc
echo 'export PATH="/home/svyatik/scripts/mcmap:$PATH"' >> /home/mistik/.bashrc

pacman --needed -S base-devel

pacman --needed -S firefox obs-studio telegram-desktop git xarchiver qbittorrent audacity gimp qalculate-qt imagemagick libreoffice-fresh gparted flameshot micro jdk8-openjdk jre11-openjdk jre17-openjdk jre21-openjdk git wget kdenlive android-tools cdrtools qemu-desktop 7zip unrar unzip zip xorg yt-dlp alsa-utils arch-install-scripts htop xdg-user-dirs mediainfo-gui mc scrot micro
