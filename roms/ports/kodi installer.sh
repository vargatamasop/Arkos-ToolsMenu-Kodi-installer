#!/bin/bash

clear > /dev/tty1
echo "Unpacking Kodi Please Wait" > /dev/tty1
sleep 3
sudo mkdir /home/ark/kodi-tools/category
sudo cp -rf "/etc/emulationstation/es_systems.cfg" "/home/ark/kodi-tools/category/es_systems.cfg.ori"
xz -dc /roms/ports/kodi.tar.xz | sudo tar --overwrite -C / -xzvf /roms/ports/kodi.tar.gz > /dev/tty1 2>&1
xz -dc /roms2/ports/kodi.tar.xz | sudo tar --overwrite -C / -xzvf /roms2/ports/kodi.tar.gz > /dev/tty1 2>&1
sleep 3
clear > /dev/tty1
echo "Removing Installer Files" > /dev/tty1
sleep 3
sudo mkdir /roms/kodi
sudo mkdir /roms2/kodi
sudo cp -rf "/home/ark/kodi-tools/category/es_systems.cfg.kodi" "/etc/emulationstation/es_systems.cfg"
sudo rm "/roms/ports/kodi.tar.gz" > /dev/tty1 2>&1
sudo rm "/roms2/ports/kodi.tar.gz" > /dev/tty1 2>&1
sudo rm "/roms/ports/kodi Installer.sh" > /dev/tty1 2>&1
sudo rm "/roms2/ports/kodi Installer.sh" > /dev/tty1 2>&1
sleep 3
echo "Finish Kodi Rebooting" > /dev/tty1
sleep 4
sudo reboot > /dev/tty1 2>&1
clear > /dev/tty1
