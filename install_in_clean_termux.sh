echo -e "\nPlease press Allow to grant Termux access to the internal storage.\n"
termux-setup-storage

echo -e "\nThis script will install proot-distro, install Debian on it and then run the script that will install box86-64 and SteamCMD.\n"
read -n 1 -s -r -p "Press any key to continue."
echo -e "\n"

echo -e "\nInstalling proot-distro...\n"
apt install proot-distro nano -y

echo -e "\nInstalling Debian...\n"
proot-distro install debian

echo -e "\nDownloading and starting the install script...\n"
wget https://raw.githubusercontent.com/ahshalaby/SteamCMD-on-Termux/main/install_box86-64_steamcmd.sh

mv install_box86-64_steamcmd.sh $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root
chmod +x $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/install_box86-64_steamcmd.sh 
proot-distro login debian --user root --shared-tmp -- bash -c ./install_box86-64_steamcmd.sh

rm $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/install_box86-64_steamcmd.sh

echo '#!/data/data/com.termux/files/usr/bin/bash

proot-distro login debian --user root --shared-tmp -- bash -c steamcmd' >> steamcmd
chmod +x steamcmd
mv steamcmd /data/data/com.termux/files/usr/bin

echo -e "\nDownloading SteamCMD options scripts...\n"
mkdir option_scripts && cd option_scripts
wget https://raw.githubusercontent.com/ahshalaby/SteamCMD-on-Termux/main/option_scripts/steam_installdir.sh && chmod +x steam_installdir.sh
wget https://raw.githubusercontent.com/ahshalaby/SteamCMD-on-Termux/main/option_scripts/steam_login.sh && chmod +x steam_login.sh
wget https://raw.githubusercontent.com/ahshalaby/SteamCMD-on-Termux/main/option_scripts/steam_platform.sh && chmod +x steam_platform.sh
wget https://raw.githubusercontent.com/ahshalaby/SteamCMD-on-Termux/main/option_scripts/steamcmd-options && chmod +x steamcmd-options
mv steamcmd-options /data/data/com.termux/files/usr/bin
cd

echo 'echo -e "\n\nStart SteamCMD:  \033[0;32msteamcmd\033[0;37m\n"' >> .bashrc
echo 'echo -e "SteamCMD Option Menu:  \033[0;32msteamcmd-options\033[0;37m\n"' >> .bashrc

echo -e "\nInstallation completed.\nNow you can start SteamCMD either by typing \033[0;32msteamcmd \033[0;37min the Termux or Debian console.\nYou can tweak SteamCMD's launch options by typing \033[0;32msteamcmd-options \033[0;37min Termux.\n"
echo -e "NOTE: SteamCMD was configured to install to the Steam folder in the internal storage (will appear with first launch)."
read -n 1 -s -r -p "Press any key to continue."
echo -e "\n"
