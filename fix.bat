@echo off
setlocal

REM Find and extract export.appx using 7-Zip
set "appxFile=export.appx"
set "extractDir=export"

REM Check if export.appx exists
if not exist "%appxFile%" (
    echo File "%appxFile%" not found.
    pause
    exit /b 1
)

REM Check if 7-Zip is installed (adjust path if necessary)
set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"
if not exist "%sevenZipPath%" (
    echo 7-Zip not found. Please install 7-Zip and ensure it's in the path specified.
    pause
    exit /b 1
)

REM Extract export.appx using 7-Zip
"%sevenZipPath%" x "%appxFile%" -o"%extractDir%"

REM Delete [Content_Types].xml and AppxBlockMap.xml
del "%extractDir%\[Content_Types].xml"
del "%extractDir%\AppxBlockMap.xml"

REM Use Developer Command Prompt for VS 2019 to run MakeAppx pack
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\Tools\VsDevCmd.bat"

REM Navigate to the directory where the script is located
cd /d "%~dp0"

REM Run MakeAppx pack command
makeappx pack /d "%extractDir%" /p my_game.appx

pause
