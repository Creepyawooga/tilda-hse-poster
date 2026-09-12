@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Put this file into the folder containing 1.jpg, 2.jpg, 3.jpg, etc.
cd /d "%~dp0"

set "count=0"
for %%F in (*.jpg) do set /a count+=1

if %count% EQU 0 (
    echo No JPG files found.
    pause
    exit /b
)

rem First give every file a temporary name to avoid name collisions.
for %%F in (*.jpg) do ren "%%F" "__reverse_tmp_%%~nF.jpg"

rem Reverse the sequence: last image becomes 1.jpg.
for %%F in (__reverse_tmp_*.jpg) do (
    set "old=%%~nF"
    set "old=!old:__reverse_tmp_=!"
    set /a new=count-old+1
    ren "%%F" "!new!.jpg"
)

echo.
echo Done. Reversed %count% image(s).
pause
