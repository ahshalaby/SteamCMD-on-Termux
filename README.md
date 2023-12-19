# Installation
## If you don't have Termux:
1- Download Termux from [here](https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_universal.apk).

2- Start Termux and run this code: 
```
apt update && apt upgrade -y
wget https://github.com/ahshalaby/SteamCMD-on-Termux/blob/main/install_in_clean_termux.sh
chmod +x install_in_clean_termux.sh
./install_in_clean_termux.sh
rm install_in_clean_termux.sh
```

## If you have Termux
### Without proot-distro installed:
Go to Step 2 in the previous section.

### With proot-distro and a Debian installation:
Start termux and run this code:
```
apt update && apt upgrade -y
wget https://github.com/ahshalaby/SteamCMD-on-Termux/blob/main/install_ready.sh
chmod +x install_ready.sh
./install_ready.sh
rm install_ready.sh
```
