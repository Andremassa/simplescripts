#!/bin/bash

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



echo -e "\033[38;2;23;147;209m
\t                   ▄
\t                  ▟█▙
\t                 ▟███▙
\t                ▟█████▙
\t               ▟███████▙
\t              ▂▔▀▜██████▙
\t             ▟██▅▂▝▜█████▙
\t            ▟█████████████▙
\t           ▟███████████████▙
\t          ▟█████████████████▙
\t         ▟███████████████████▙
\t        ▟█████████▛▀▀▜████████▙
\t       ▟████████▛      ▜███████▙
\t      ▟█████████        ████████▙
\t     ▟██████████        █████▆▅▄▃▂
\t    ▟██████████▛        ▜█████████▙
\t   ▟██████▀▀▀              ▀▀██████▙
\t  ▟███▀▘                       ▝▀███▙
\t ▟▛▀                               ▀▜▙\e[0m
"
sleep 1


firefox
filezilla
terminator
openssh
gthumb
vlc
geary
keepassxc
gimp
notepadqq
htop
neofetch
fish



whiptail --title "Check list example" --checklist --separate-output \
"Choose user's permissions" 20 78 4 \
"NET_OUTBOUND" "Allow connections to other hosts" ON \
"NET_INBOUND" "Allow connections from other hosts" OFF \
"firefox" "Allow mounting of local devices" OFF \
"REMOTE_MOUNT" "Allow mounting of remote devices" OFF 2>distrochoice


if grep -Fxq "filezilla" distrochoice
then
    echo "yes"
else
    echo "no"
fi



if grep -Fxq "fish" distrochoice
then
    echo "yes"
elif grep -Fxq "NET_INBOUND" distrochoice
then
  echo "hello"
else
    echo "no"
fi
