#!/bin/bash

echo "Welcome to server setup!"
echo "By continuing, you agree to the EULA."
echo "Please type in your admin password: "
sudo apt update
sudo apt install wget --yes
wget https://github.com/Optimalgitit/Minecraft-Server-Setter-Upper/blob/fully-auto/start-server.sh

java -Xmx1024M -Xms1024M -jar server.jar nogui

echo "eula=true" > eula.txt

echo "Calling run script."
echo "Next time you want to run your server, simply run start-server.sh"
./start-server.sh