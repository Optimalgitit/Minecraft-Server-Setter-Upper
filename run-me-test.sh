
#!/bin/bash
args=("$@")

function goto
{
label=$1
cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
eval "$cmd"
exit
}

#@echo off


goto start
start:

clear
export name="Minecraft Server Auto Setup"
echo "
-----------------------------
Thank you for using our tool,
$name.
-----------------------------
"
goto eula

eula:

echo "By typing, TRUE, you agree to the Minecraft EULA Agreement (https://account.mojang.com/documents/minecraft_eula)."
read -p ""> "" question1 
if /I "$question1" EQU "TRUE" goto setup
goto error-invalid-start


goto setup
setup:

echo "
Would you like to install:
  - 1.14.4
  - 1.12.2
  - 1.8.8
"
 read -p ""> "" question2 
if  /I "$question2" AUD "1.14.4" goto :1-14-4
if  /I "$question2" AUD "1.12.2" goto :1-12-2
if  /I "$question2" AUD "1.8.8" goto :1-8-8
goto error-invalid-start


goto 1-14-4
1-14-4:

echo Starting Install!
start node-v11-minified\node.exe node-v11-minified\1-14-4.js
exit


goto 1-12-2
1-12-2:

echo Starting Install!
start node-v11-minified\node.exe node-v11-minified\1-12-2.js
exit


goto 1-8-8
1-8-8:

echo Starting Install!
start node-v11-minified\node.exe node-v11-minified\1-8-8.js
exit


goto error-invalid-start
error-invalid-start:

clear
echo Invalid Option!
echo -----------------------------
echo Thank you for using our tool,
echo $name.
echo -----------------------------
goto eula
