#!/bin/bash

echo "Welcome to server setup!"
echo "By continuing, you agree to the EULA."
wget https://raw.githubusercontent.com/Optimalgitit/Minecraft-Server-Setter-Upper/master/start-server.sh

java -Xmx1024M -Xms1024M -jar server.jar nogui

echo "eula=true" > eula.txt

echo "Calling run script."
echo "Next time you want to run your server, simply run start-server.sh"
./start-server.sh