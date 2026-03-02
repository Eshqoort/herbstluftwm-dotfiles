#!/bin/bash


sudo pacman -S i3lock librewolf xarchiver gammastep feh polybar rofi yay ttf-jetbrains-mono ttf-font-awesome lsd flameshot discord flatpak cachyos-gaming-meta nwg-look steam brightnessctl
sleep 1
flatpak install flathub com.spotify.Client
flatpak install flathub org.telegram.desktop
sleep 1
yay -S ttf-twemoji-color dracula-gtk-theme dracula-icons-theme urusai
sleep 1
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install
sudo rm -r i3lock-fancy/

brightnessctl set 100

sleep 3
sh -c "$(curl -sS https://vencord.dev/install.sh)"


