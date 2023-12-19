#!/bin/bash

echo -e "\033[0;32mStarting installation..."
echo -e "\033[0;37m"

echo -e "\033[0;32mInstalling box86 dependencies..."
echo -e "\033[0;37m"
apt install sudo curl wget -y
sudo dpkg --add-architecture armhf
sudo apt-get update && sudo apt-get install libc6:armhf libtinfo6:armhf -y

echo -e "\033[0;32mInstalling box86..."
echo -e "\033[0;37m"
sudo wget https://itai-nelken.github.io/weekly-box86-debs/debian/box86.list -O /etc/apt/sources.list.d/box86.list
wget -qO- https://itai-nelken.github.io/weekly-box86-debs/debian/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg
sudo apt install box86:armhf -y

echo -e "\033[0;32mInstalling box64..."
echo -e "\033[0;37m"
sudo wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
sudo apt update && sudo apt install box64-arm64 -y

echo -e "\033[0;32mRunning cheadrian's script to setup bash Box environment..."
echo -e "\033[0;37m"
wget https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/blob/main/Scripts/Addons_Proot_Box86_64_Bash.sh
chmod +x Addons_Proot_Box86_64_Bash.sh
./Addons_Proot_Box86_64_Bash.sh
rm Addons_Proot_Box86_64_Bash.sh

echo -e "\033[0;32mInstalling SteamCMD..."
echo -e "\033[0;37m"
mkdir Steam && cd Steam
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

echo '#!/bin/bash

box86 /root/Steam/steamcmd.sh' >> steamcmd
mv steamcmd /bin
chmod +x /bin/steamcmd


echo -e "Installation finished. Now you can start SteamCMD by typing \033[0;32msteamcmd \033[0;37min the console."
read -n 1 -s -r -p "Press any key to continue."
echo -e
