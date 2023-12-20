#!/data/data/com.termux/files/usr/bin/bash

echo -e "\n\033[0;32mSteamCMD Options\n"
echo -e "\n1- Full SteamCMD launch configuration."
echo -e "2- Store Steam username (and password) for auto login."
echo -e "3- Login anonymously to Steam."
echo -e "4- Choose desired platform (Windows/Linux/MacOS)."
echo -e "5- Change the Steam directory (Where files are downloaded)."
echo -e "6- Manually edit the SteamCMD bin file (with vi)."
echo -e "7- Exit."

read -p "Select an option:" option
case $option in
1) ./option_scripts/steam_login.sh
./option_scripts/steam_platform.sh
./option_scripts/steam_installdir.sh
echo -e
exit;;

2) ./option_scripts/steam_login.sh
echo -e
exit;;

3) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm usrdata 2> /dev/null
echo "+login anonymous" >> usrdata
cd
echo -e
exit;;

4) ./option_scripts/steam_platform.sh
echo -e
exit;;

5) ./option_scripts/steam_installdir.sh
echo -e
exit;;

6) echo -e "\nIf you are not familiar with vi, here are a couple of commands to get you going:\n"
echo -e "Press \033[0;36mi \033[0;37mon the keyboard to enter \033[0;32mINPUT \033[0;37mmode (editing).\nPress \033[0;36mESC \033[0;37mon the termux keyboard to enter \033[0;32mCOMMAND \033[0;37mmode (to save, exit, etc.).\n\nIn \033[0;32mCOMMAND \033[0;37mmode:\nType \033[0;36m:wq \033[0;37mand press \033[0;36mEnter \033[0;37mto save and exit.\nType \033[0;36m:q \033[0;37mand press \033[0;36mEnter \033[0;37mto exit.\nType \033[0;36m:q! \033[0;37mand press \033[0;36mEnter \033[0;37mto force quit (without saving).\n"
read -n 1 -s -r -p "Press any key to continue.\n\n"
vi $PREFIX/var/lib/proot-distro/installed-rootfs/debian/bin/steamcmd
exit;;

7) echo -e "Exiting..\n"
exit;;

*) echo -e "Invalid option. Exiting..\n"
exit;;
esac
