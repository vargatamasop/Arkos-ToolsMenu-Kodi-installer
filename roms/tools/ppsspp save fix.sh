# 1. Töröljük a hibás linket (ez nem törli a játékaidat, csak az útvonalat)
sudo rm -rf /home/ark/.config/ppsspp

# 2. Hozzunk létre egy VALÓDI mappát a belső tárhelyen
mkdir -p /home/ark/.config/ppsspp/PSP/SYSTEM
mkdir -p /home/ark/.config/ppsspp/PSP/SAVEDATA
mkdir -p /home/ark/.config/ppsspp/PSP/PPSSPP_STATE

# 3. Adjunk rá jogot (itt már engedni fogja!)
sudo chmod -R 777 /home/ark/.config/ppsspp
sudo chown -R ark:ark /home/ark/.config/ppsspp