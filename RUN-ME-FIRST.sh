#!/bin/bash
programName="Minecraft-Server-Setter-Upper"
programVer=2.0

echo "
-------------------------
Thank you for using
$programName $programVer
-------------------------
"
echo "
-------------------------
Which version would you like to install?
  - 1.14.4
  - 1.12.2
  - 1.8.8
-------------------------
"
read -p "> " serverVersion
echo "Installing..."
echo "Note: You will need to have wget installed."
if [[ serverVersion == "1.14.4" ]]
then
    wget https://github.com/Optimalgitit/Minecraft-Server-Setter-Upper/raw/huge-update-beta/serverfiles/1.14.4.jar
elif [[ serverVersion == "1.12.2" ]]
then
    wget https://github.com/Optimalgitit/Minecraft-Server-Setter-Upper/raw/huge-update-beta/serverfiles/1.12.2.jar
elif [[ serverVersion == "1.8.8" ]]
then
    wget https://github.com/Optimalgitit/Minecraft-Server-Setter-Upper/raw/huge-update-beta/serverfiles/1.8.8.jar
else
    echo "Invalid option. Exiting..."
    exit
fi
