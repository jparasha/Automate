@echo off
mode con:cols=90 lines=20

rem following to path needs to be setup [backupLocationPath] and [backupSourcePath]
rem backupLocationPath will be the initial path where backup will be saved [e.g.- C:\USERS\ADMINISTRATOR\DESKTOP  --> no backward slashes at the end]
set backupLocationPath=D:\Users\jparasha\Documents\GitHub

rem backupSourcePath is the path from where backup can be created.
set backupSourcePath=D:\Users\jparasha\Documents\GitHub\aws


set rootFolderName=%date:~-4,4%%date:~-10,2%%date:~7,2%
set log=%backupLocationPath%\%rootFolderName%\log_%rootFolderName%\log.txt
set bu=%backupLocationPath%\%rootFolderName%\Backup_%rootFolderName%

pushd %backupLocationPath%
mkdir %rootFolderName%

cd %rootFolderName%
mkdir "Backup_"%rootFolderName%
mkdir "log_"%rootFolderName%
cd "log_"%rootFolderName%

copy nul log.txt > nul
cd..
echo.
echo.
echo.
echo                 =======Making Directory %rootFolderName% ========
echo.
echo                 =======COPYING FILES AND FOLDERS=======
echo.
echo  ===Find backed up Files in %bu%===
echo.
echo                  =========== Backup in Progress ==========
echo.
echo                 =======Will exit once Backup finishes=======
echo.
echo.
ROBOCOPY %backupSourcePath% %bu% /E /V /ETA /R:0 /W:0 /COPYALL /LOG:%log% /NP
pause

