@echo off
:: ======================================================
:: [ UNINSTALL SCRIPT ] - Removes context menu entry
:: Requires Administrator for safety
:: ======================================================

:: Check for admin privileges
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo This uninstaller must be run as Administrator.
    echo Please right-click and choose "Run as administrator".
    pause
    exit /b 1
)

:: Remove context menu registry key
echo Removing context menu entry...
reg delete "HKCU\Software\Classes\SystemFileAssociations\.py\shell\RunWithEnv" /f >nul

echo.
echo [OK] Uninstalled successfully.
echo [!] You can now delete this folder if you wish.
pause
