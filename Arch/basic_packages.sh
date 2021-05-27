#!/bin/bash
clear

if [ "$MENU2" != "2" ]; then
  while true
  do
    clear
    echo -e "\e[1;95m
    \t███████╗██╗███╗   ███╗██████╗ ██╗     ███████╗
    \t██╔════╝██║████╗ ████║██╔══██╗██║     ██╔════╝
    \t███████╗██║██╔████╔██║██████╔╝██║     █████╗
    \t╚════██║██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝
    \t███████║██║██║ ╚═╝ ██║██║     ███████╗███████╗
    \t╚══════╝╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝
    \t███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
    \t██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
    \t███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
    \t╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
    \t███████║╚██████╗██║  ██║██║██║        ██║   ███████║
    \t╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝
    \e[0m"
    read -r -p "        Ready? [Y/N] " exe1
    echo ""

    case $exe1 in
      [yY][eE][sS]|[yY])
        break
    ;;
      [nN][oO]|[nN])
        exit
    ;;
      *)
        echo "        Type Y/yes or N/no"
        sleep 2
    esac
  done
else
  echo ""
fi

whiptail --title "Packages" --checklist --separate-output \
"Choose packages to install" 20 78 12 \
"openssh" "SSH server" ON \
"firefox" "Browser" ON \
"filezilla" "FPT/SFTO Client" ON \
"terminator" "Terminal Emulator" ON \
"gthumb" "Image Viewer" ON \
"vlc" "Media Player" ON \
"geary" "Mail Client" ON \
"keepassxc" "Passwd Manager" ON \
"gimp" "Image Editor" ON \
"notepadqq" "Notepad++ Alike" ON \
"htop" "htop" ON \
"neofetch" "Sys info" ON \
"fish" "User Friendly Shell" OFF 2>packages

sudo pacman -S $(cat ./packages) --needed --noconfirm

if grep -Fxq "openssh" packages
then
    sudo systemctl enable sshd
    sudo systemctl start sshd
fi

#if grep -Fxq "fish" distrochoice
#then
#    echo "fish"
#fi

exit
