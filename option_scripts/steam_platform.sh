#!/data/data/com.termux/files/usr/bin/bash

echo -e "\nSelect your desired platform:\n\n| Leave empty for default (\033[0;32mLinux\033[0;37m) |\n"
echo -e "1- \033[0;32mLinux\033[0;37m"
echo -e "2- \033[0;32mWindows\033[0;37m"
echo -e "3- \033[0;32mMacOS\033[0;37m\n"

read -p "Select an option:" option
case $option in

1) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm pltfrm 2> /dev/null
cd
exit;;

2) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm pltfrm 2> /dev/null
echo "+@sSteamCmdForcePlatformType windows" >> pltfrm
cd
exit;;

3) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm pltfrm 2> /dev/null
echo "+@sSteamCmdForcePlatformType macos" >> pltfrm
cd
exit;;

*) cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm pltfrm 2> /dev/null
cd
exit;;
esac