@echo off

REM Keep this in the same directory as server.jar and do not change the name of
REM server.jar or this will not run properly!

set /p ram=<ram.txt
java -Xmx%ram% -Xms%ram% -jar server.jar
echo Server Crash?
pause