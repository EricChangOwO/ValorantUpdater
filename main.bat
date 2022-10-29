@echo off
call config.bat

:checksameprob
if exist "going.bat" (exit)

:copyback
rename notgoing.bat going.bat
echo 正在複製原檔案...
copy %videodir% "%valodir%\VALORANT\live\ShooterGame\Content\Movies\Menu" /y >nul

:main
cls
echo 啟動 Riot 啟動器
start "" "%valodir%\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live"
goto clienton

:clienton
tasklist /nh /fi "imagename eq RiotClientUx.exe" | findstr /i "RiotClientUx.exe" >nul && goto clsgo

:clsgo
cls
echo 檢查遊戲是否啟動中.
timeout 1 >nul
cls
echo 檢查遊戲是否啟動中..
timeout 1 >nul
cls
echo 檢查遊戲是否啟動中...
timeout 1 >nul
goto check

:check
tasklist /nh /fi "imagename eq VALORANT.exe" | findstr /i "VALORANT.exe" >nul && (goto copy) || (goto clsgo 啟動 && goto check)

:copy
copy %videodir% "%valodir%\VALORANT\live\ShooterGame\Content\Movies\Menu" /y
copy "langen\*.*" "%valodir%\VALORANT\live\ShooterGame\Content\Paks"/y
cls
color 0a
echo 已複製完成，本視窗將在五秒後關閉
rename going.bat notgoing.bat
timeout 5 >nul
