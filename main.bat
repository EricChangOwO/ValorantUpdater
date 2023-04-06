@echo off
call config.bat
set FileName=HomepageEp6A2.mp4

:update
if exist %videodir%\%FileName% (goto original) else (
    ren "%videodir%" "%FileName%"
) 

:original
if exist Original if exist Original\Videos\*.mp4 (goto main)
md Original\Videos
md Original\langdefault
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('This time will not work, because program was updating...', 'Eric Valorant Updater', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
start "" "%valodir%\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live"
goto checkbutnocopy

:checkbutnocopy
tasklist /nh /fi "imagename eq VALORANT.exe" | findstr /i "VALORANT.exe" >nul && (goto copyback) || (timeout 1
goto checkbutnocopy)

:copyback
copy "%valodir%\VALORANT\live\ShooterGame\Content\Movies\Menu\*" Original\Videos /y
copy "%valodir%\VALORANT\live\ShooterGame\Content\Paks\ja_JP_Text-WindowsClient.*" Original\langdefault /y
exit

:main
copy "Original\Videos\*" "%valodir%\VALORANT\live\ShooterGame\Content\Movies\Menu" /y
copy "Original\langdefault\*" "%valodir%\VALORANT\live\ShooterGame\Content\Paks" /y
cls
echo Starting Riot Client
start "" "%valodir%\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live"
goto check

:check
tasklist /nh /fi "imagename eq VALORANT.exe" | findstr /i "VALORANT.exe" >nul && (goto copy) || (timeout 1
goto check)

:copy
copy %videodir% "%valodir%\VALORANT\live\ShooterGame\Content\Movies\Menu" /y
copy "langen\*.*" "%valodir%\VALORANT\live\ShooterGame\Content\Paks"/y
exit
