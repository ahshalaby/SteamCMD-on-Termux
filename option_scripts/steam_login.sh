#!/data/data/com.termux/files/usr/bin/bash

while true; do

while true; do
read -p "Username: " un

case "$un" in
*\ * ) echo -e "Username can not contain spaces. Please try again or type \033[0;32mcancel \033[0;37mto exit.";;
*) break;;
esac

done

if [[ "$un" = "cancel" ]]; then
exit
fi

[ -n "$un" ] && break || echo -e "\nUsername can't be empty. Please try again or type \033[0;32mcancel \033[0;37mto exit."
echo -e "\n"
done

while true; do

while true; do
read -s -p "Password (can be left empty): " pw
echo

if [[ "$pw" = "cancel" ]]; then
exit
fi

case "$pw" in 
*\ *) echo -e "Password can not contain spaces. Please try again or type \033[0;32mcancel \033[0;37mto exit.";;
*) break ;;
esac

done

if [[ -z "$pw" ]]; then cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config && rm usrdata 2> /dev/null && echo "$un" >> usrdata && cd
exit
fi

read -s -p "Password (again): " pw2
echo 

[ "$pw" = "$pw2" ] && break || echo -e "\nPasswords do not match. Please try again."
read -n 1 -s -r -p "Press any key to retry."
echo -e "\n"
done

cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/.steamcmd_config
rm usrdata 2> /dev/null
echo "$un $pw" >> usrdata
cd
