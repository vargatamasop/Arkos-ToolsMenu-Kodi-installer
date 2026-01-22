#!/bin/bash

# 1. Alapértelmezett, működő játéklista visszaállítása
echo "Játékcsoportok visszaállítása..."
sudo cp /etc/emulationstation/es_systems.cfg.dual /etc/emulationstation/es_systems.cfg

# 2. Az utolsó </systemList> sor eltávolítása, hogy bővíthessük
# (Ez felkészíti a fájlt az új blokk befogadására)
sudo sed -i 's/<\/systemList>//g' /etc/emulationstation/es_systems.cfg

# 3. A Kodi blokk hozzáadása a fájl végéhez
echo "Kodi bejegyzés hozzáadása a konfigurációhoz..."
sudo tee -a /etc/emulationstation/es_systems.cfg <<EOF
        <system>
                <name>Kodi</name>
                <fullname>Kodi</fullname>
                <path>/opt/system/kodi/</path>
                <extension>.sh .SH</extension>
                <command>sudo perfmax %GOVERNOR%; bash %ROM%; sudo perfnorm</command>
                <platform>ignore</platform>
                <theme>kodi</theme>
        </system>
</systemList>
EOF

# 4. Az indítófájl meglétének ellenőrzése
if [ ! -f /opt/system/kodi/kodi.sh ]; then
    echo "Indítófájl létrehozása a /opt/system/kodi/ mappában..."
    sudo mkdir -p /opt/system/kodi
    printf '#!/bin/bash\n/opt/kodi/bin/kodi-standalone' | sudo tee /opt/system/kodi/kodi.sh > /dev/null
    sudo chmod +x /opt/system/kodi/kodi.sh
fi

echo "Kész! A játékok és a Kodi menüpontja helyreállítva."
echo "Kérlek indítsd újra az EmulationStation-t!"
