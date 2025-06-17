@echo off
setlocal EnableDelayedExpansion
title Install "Edit Script" Context Menu
cls

echo ===================================================
echo            Install "Edit Script" Context Menu
echo ===================================================
echo This tool will let you right-click a .py file
echo and open it with the editor you choose.
echo.
echo Step 1:
echo Please choose the program you want to open .py files with
echo (e.g., Notepad++, VS Code, Python IDLE, etc.)
echo.
echo A file picker will appear. Select your desired EXE.
echo ---------------------------------------------------
pause

:: Show file picker using PowerShell
for /f "usebackq delims=" %%A in (`powershell -nologo -noprofile -command ^
    "Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.OpenFileDialog; $f.Filter = 'Executable (*.exe)|*.exe'; if ($f.ShowDialog() -eq 'OK') {Write-Output $f.FileName}"`) do (
    set "editor_path=%%A"
)

if not defined editor_path (
    echo.
    echo ❌ No program was selected. Installation aborted.
    echo Close this window or press any key to exit.
    pause
    exit /b
)

:: Escape backslashes in path
set "editor_path=!editor_path:\=\\!"

:: Registry key to add
set "reg_key=HKCU\Software\Classes\SystemFileAssociations\.py\shell\EditWithCustomEditor"
set "reg_cmd=!reg_key!\command"

:: Create context menu entry
reg add "!reg_key!" /ve /d "Edit Script" /f >nul
reg add "!reg_cmd!" /ve /d "\"!editor_path!\" \"%%1\"" /f >nul

echo.
echo [OK] Success!
echo "Edit Script" has been added to the right-click menu for .py files.
echo Selected editor: !editor_path:\=\\!
echo.
echo You can now right-click any .py file and choose "Edit Script".
echo.
pause
