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
"1" "openssh" ON \
"12" "Firefox" ON \
"2" "Filezilla" ON \
"3" "Terminator" ON \
"4" "Gthumb" ON \
"5" "VLC" ON \
"6" "Geary" ON \
"7" "Keepassxc" ON \
"8" "Gimp" ON \
"9" "Notepadqq" ON \
"10" "htop" ON \
"11" "Neofetch" ON \
"13" "Fish" OFF 2>packages

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
