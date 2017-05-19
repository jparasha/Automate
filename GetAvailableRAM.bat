@echo off
set /a memoryThreshold = 500

for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do (set m=%%p
goto :done)

:done
set /a FreeMem = %m%/1000
if  %FreeMem% LEQ %memoryThreshold% ( goto :error ) ELSE ( goto :go )

:go
exit

:error
mode con:cols=55 lines=10
COLOR 4F
echo Hey %username%!
echo.
echo Remaining Free Memory is ONLY --- %FreeMem% MB---
echo.
echo It's not safe to go ahead!
echo.
goto :ask

:ask
echo Do you want me to open Task Manager for you? (y/n)
set  INPUT=
set /p INPUT=Type input: %=%
If  /I  "%INPUT%"=="y" goto :yes
If  /I "%INPUT%" =="n" goto :no
echo Incorrect Input & goto :ask

:yes 
TASKMGR
goto cont

:no
echo.
echo AS you Wish!
echo.
goto cont

:cont
pause