@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Run this file from the folder with the images.
cd /d "%~dp0"

set "count=0"
for /f "delims=" %%F in ('dir /b /a-d *.jpg *.jpeg 2^>nul ^| sort') do (
    set /a count+=1
    set "num=000000!count!"
    set "num=!num:~-6!"
    ren "%%F" "__rename_tmp_!num!%%~xF"
)

set "count=0"
for /f "delims=" %%F in ('dir /b /a-d __rename_tmp_* 2^>nul ^| sort') do (
    set /a count+=1
    ren "%%F" "!count!.jpg"
)

echo.
echo Done. Renamed %count% image(s).
pause
