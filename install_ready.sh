echo -e "Please press Allow to grant Termux access to the internal storage."
termux-setup-storage

echo -e "This script will install box86-64, SteamCMD and will create a shortcut to run SteamCMD directly from Termux."
read -n 1 -s -r -p "Press any key to continue."
echo -e

echo -e "Downloading and starting the install script..."
wget https://github.com/ahshalaby/SteamCMD-on-Termux/blob/main/install_box86-64_steamcmd.sh
mv install_box86-64_steamcmd.sh $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root
proot-distro login debian --user root --shared-tmp -- bash -c ./install_box86-64_steamcmd.sh

rm $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/install_box86-64_steamcmd.sh

echo '#!/data/data/com.termux/files/usr/bin/bash

proot-distro login debian --user root --shared-tmp -- bash -c steamcmd' >> steamcmd
chmod +x steamcmd
mv steamcmd /data/data/com.termux/files/usr/bin

echo -e "Installation completed. Now you can start SteamCMD either by typing steamcmd in the Termux or Debian console."
echo -e "NOTE: SteamCMD was configured to install to the Steam folder in the internal storage (will appear with first launch)."
read -n 1 -s -r -p "Press any key to continue."
echo -e
