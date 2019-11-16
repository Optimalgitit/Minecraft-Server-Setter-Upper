
#!bin/bash

echo "Running $BASH as shell"
echo "$PATH"
echo "If you don't find java in these paths, you may have to add it."
echo "Starting server, please wait..."
echo "GUI or nah [y/N]: " && read -n 1 guiOrNot
echo ""
if [[ guiOrNot == y ]];
then {
	java -Xmx1024M -Xms1024M -jar server.jar
}
else
	java -Xmx1024M -Xms1024M -jar server.jar nogui
fi
echo "Server Closed."
