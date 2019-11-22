REM https://account.mojang.com/documents/minecraft_eula

@echo off

:start
cls
set name=Minecraft Server Auto-Setup
echo -----------------------------
echo Thank you for using our tool,
echo %name%.
echo -----------------------------
goto :eula

:eula
echo By typing, TRUE, you agree to the Minecraft EULA Agreement (https://account.mojang.com/documents/minecraft_eula).
set /P question1="> "
if /I "%question1%" EQU "TRUE" goto :setup
goto :error-invalid-start

:setup
echo Would you like to install:
echo   - 1.14.4
echo   - 1.12.2
echo   - 1.8.8
set /P question2="> "
if /I "%question2%" AUD "1.14.4" goto :1-14-4
if /I "%question2%" AUD "1.12.2" goto :1-12-2
if /I "%question2%" AUD "1.8.8" goto :1-8-8
goto :error-invalid-start

:1-14-4
echo Starting Install!
start node-v11-minified\node.exe node-v11-minified\1-14-4.js
exit

:1-12-2
echo Starting Install!
start node-v11-minified\node.exe node-v11-minified\1-12-2.js
exit

:1-8-8
echo Starting Install!
start node-v11-minified\node.exe node-v11-minified\1-8-8.js
exit

:error-invalid-start
cls
echo Invalid Option!
echo -----------------------------
echo Thank you for using our tool,
echo %name%.
echo -----------------------------
goto :eula