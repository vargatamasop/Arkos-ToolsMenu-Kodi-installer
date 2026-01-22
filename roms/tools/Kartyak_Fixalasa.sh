#!/bin/bash

# 1. SD1 felcsatolása
sudo mkdir -p /mnt/sd1_system
sudo mount /dev/mmcblk1p3 /mnt/sd1_system

# 2. Intelligens összefűzés és takarítás
for dir in $(ls /mnt/sd1_system); do
    if [ -d "/mnt/sd1_system/$dir" ]; then
        
        # Ha létezik a mappa az SD2-n
        if [ -d "/roms/$dir" ]; then
            
            # ELŐSZÖR TÖRÖLJÜK a régi almappát, ha üres (takarítás)
            # Ha be van csatolva, lecsatoljuk, majd töröljük az üres könyvtárat
            sudo umount -l "/roms/$dir/_SD1_jatekok" 2>/dev/null
            sudo rmdir "/roms/$dir/_SD1_jatekok" 2>/dev/null

            # Megnézzük, van-e az SD2-n VALÓDI tartalom (fájl), nem csak almappa
            # Ha a mappa üres vagy csak a most törölt almappa volt benne:
            if [ -z "$(ls -A /roms/$dir)" ]; then
                # CSAK AZ SD1-EN VAN VALÓDI JÁTÉK: Közvetlen csatolás
                sudo mount --bind "/mnt/sd1_system/$dir" "/roms/$dir"
            else
                # MINDKÉT KÁRTYÁN VAN JÁTÉK: Kell az almappa a megkülönböztetéshez
                sudo mkdir -p "/roms/$dir/_SD1_jatekok"
                sudo mount --bind "/mnt/sd1_system/$dir" "/roms/$dir/_SD1_jatekok"
            fi
        else
            # HA NEM LÉTEZIK A MAPPA: Létrehozzuk és közvetlenül csatoljuk
            sudo mkdir -p "/roms/$dir"
            sudo mount --bind "/mnt/sd1_system/$dir" "/roms/$dir"
        fi
    fi
done

# 3. EmulationStation frissítése
echo "Mappák kitakarítva és optimalizálva!"
sleep 2
sudo systemctl restart emulationstation