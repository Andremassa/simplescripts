#!/bin/bash

clear

########

if [ "$MENU1" != "1" ]; then
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
        MENU2=2
        export MENU2
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
  MENU2=2
  export MENU2
fi

########

OPTION=$(whiptail --title "Arch Menu" --menu "Choose an option" 20 78 10 \
"1" "Desktops" \
"2" "Tools" \
"3" "Some Basic Packages" 3>&1 1>&2 2>&3)



if [ "$OPTION" = "1" ]; then
  bash ./Arch/desktops.sh
  unset MENU2
elif [ "$OPTION" = "2" ]; then
  bash ./Arch/tools.sh
  unset MENU2
elif [ "$OPTION" = "3" ]; then
  bash ./Arch/basic_packages.sh
  unset MENU2
else
  clear
  echo -e "\nThis is not available yet.\n"
fi

exit
