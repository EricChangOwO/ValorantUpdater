@echo off
call config.bat
set FileName=Homepage_Ep5_AIII.mp4

:update
if exist %videodir%\%FileName% (goto main) else (
    ren "%videodir%" "%FileName%"
) 

:main
cls
echo Starting Riot Client
start "" "%valodir%\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live"
goto clienton

:clienton
tasklist /nh /fi "imagename eq RiotClientUx.exe" | findstr /i "RiotClientUx.exe" >nul && goto clsgo

:clsgo
cls
echo Check if valorant is opened.
timeout 1 >nul
cls
echo Check if valorant is opened..
timeout 1 >nul
cls
echo Check if valorant is opened...
timeout 1 >nul
goto check

:check
tasklist /nh /fi "imagename eq VALORANT.exe" | findstr /i "VALORANT.exe" >nul && (goto copy) || (goto clsgo && goto check)

:copy
copy %videodir% "%valodir%\VALORANT\live\ShooterGame\Content\Movies\Menu" /y
copy "langen\*.*" "%valodir%\VALORANT\live\ShooterGame\Content\Paks"/y
cls
color 0a
echo Already done! this window will close after 5 sec
timeout 5 >nul
