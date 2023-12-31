#!/bin/bash

echo -e "\n\033[0;32mStarting installation...\n"
echo -e "\033[0;37m"

echo -e "\n\033[0;32mInstalling box86 dependencies...\n"
echo -e "\033[0;37m"
apt-get update && apt-get upgrade && apt-get install sudo curl wget gnupg -y
sudo dpkg --add-architecture armhf
apt-get update && sudo apt-get install libc6:armhf libtinfo6:armhf -y

echo -e "\n\033[0;32mInstalling box86...\n"
echo -e "\033[0;37m"
sudo wget https://itai-nelken.github.io/weekly-box86-debs/debian/box86.list -O /etc/apt/sources.list.d/box86.list
wget -qO- https://itai-nelken.github.io/weekly-box86-debs/debian/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg
sudo apt update && sudo apt install box86 -y

echo -e "\n\033[0;32mInstalling box64...\n"
echo -e "\033[0;37m"
sudo wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
sudo apt update && sudo apt install box64-arm64 -y

echo -e "\n\033[0;32mRunning cheadrian's script to setup bash Box environment...\n"
echo -e "\033[0;37m"
wget https://raw.githubusercontent.com/cheadrian/termux-chroot-proot-wine-box86_64/main/Scripts/Addons_Proot_Box86_64_Bash.sh
chmod +x Addons_Proot_Box86_64_Bash.sh
./Addons_Proot_Box86_64_Bash.sh
rm Addons_Proot_Box86_64_Bash.sh

echo -e "\n\033[0;32mInstalling SteamCMD...\n"
echo -e "\033[0;37m"
adduser --disabled-password --gecos "" steam
mkdir /home/steam/Steam && cd /home/steam/Steam
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
cd

mkdir /root/.steamcmd_config
cd .steamcmd_config
echo "+force_install_dir sdcard/Steam" >> installdir
cd

echo '#!/bin/bash
pltfrm=$(< /root/.steamcmd_config/pltfrm)
usrdata=$(< /root/.steamcmd_config/usrdata)
installdir=$(< /root/.steamcmd_config/installdir)
box86 /home/steam/Steam/steamcmd.sh $pltfrm $installdir $usrdata' >> steamcmd
mv steamcmd /bin
chmod +x /bin/steamcmd



echo -e "\nInstallation finished. Now you can start SteamCMD by typing \033[0;32msteamcmd \033[0;37min the console.\n"
read -n 1 -s -r -p "Press any key to continue."
echo -e "\n"
