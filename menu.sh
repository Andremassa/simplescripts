#!/bin/bash

if [ "$EUID" = "0" ]; then
  clear
  echo ""
  echo "Do not run this as root!"
  echo ""
  exit
else
   echo ""
fi

if [ "$OSTYPE" != "linux-gnu" ]; then
  echo -e "\n""This OS is not suported!""\n"
  sleep 5
  exit
else
   echo ""
fi

# Execute Script?
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
      MENU1=1
      export MENU1
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

DISTRO=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
if [ "$DISTRO" = "arch" ]; then
  bash ./Arch/archmenu.sh
  unset MENU1
elif [ "$DISTRO" = "manjaro" ]; then
  echo ./archmenu.sh
  unset MENU1
elif [ "$DISTRO" = "debian" ]; then
  echo "debian"
  unset MENU1
else
  clear
  echo -e "\nThis Distro has not been tested on""\n""You can still run this by picking a distro manually\n"
fi

exit
