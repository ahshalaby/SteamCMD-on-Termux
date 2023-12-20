#!/data/data/com.termux/files/usr/bin/bash

echo -e "\nType in your preferred path for Steam folder:\n\n| Leave empty for default (sdcard/Steam) << Folder named Steam in your Android file explorer |\n\n"

while true; do

while true; do

while true; do

read -p "Path: " steam_path

if [[ "$steam_path" = "cancel" ]];
then exit
fi

if [[ -z "$steam_path" ]];
then echo -e "\n\nAre you sure you want to change your Steam path to ' \033[0;32mdefault (sdcard/Steam) \033[0;37m' ?"
read -n 1 -p "Choose ( y / n ): " option

case $option in
y) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm installdir 2> /dev/null
echo "+force_install_dir sdcard/Steam" >> installdir
cd
echo -e "\n\nChanged Steam path to default (sdcard/Steam)."
echo -e "Exiting..\n"
exit;;

n) echo -e "\n\nOperation cancelled. You can type \033[0;32mcancel \033[0;37mto exit. Returning to the previous step..\n\n";;
esac
else continue_if=no
fi
[ "$continue_if" = "no" ] && break
done

case $steam_path in
*\ * ) echo -e "\nPath can not contain spaces. Please try again or type \033[0;32mcancel \033[0;37mto exit.\n\n"
echo -e "NOTE: If a folder name contains spaces use single quotes around it, e.g steam/path/\033[0;32m'is here'\033[0;37m.\n"
read -n 1 -s -r -p "Press any key to continue."
echo -e "\n";;
*) break;;
esac

done

echo -e "\n\nAre you sure you want to change your Steam path to '\033[0;32m $steam_path \033[0;37m' ?"
read -n 1 -p "Choose ( y / n ): " option

case $option in
y) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm installdir 2> /dev/null
echo "+force_install_dir $steam_path" >> installdir
cd
echo -e "\n\nChanged Steam path to '\033[0;32m $steam_path \033[0;37m'.\nIf it does not already exist, it will be created the next time you start SteamCMD (If the user has enough permissions).\n"
echo -e "Exiting..\n"
exit;;

n) echo -e "\n\nOperation cancelled. You can type \033[0;32mcancel \033[0;37mto exit. Returning to the previous step..\n\n";;
esac

done