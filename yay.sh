#!/bin/bash

pacman -S base-devel git

cd /tmp
git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:users ./yay
cd yay
makepkg -si
