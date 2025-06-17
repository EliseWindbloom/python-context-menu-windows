@echo off
setlocal
title Uninstall "Edit Script" Context Menu
cls

echo ===================================================
echo          Uninstall "Edit Script" Context Menu
echo ===================================================
echo This will remove the custom right-click menu option
echo named "Edit Script" from .py files.
echo.
echo Are you sure you want to continue?
echo Press Ctrl+C to cancel or any key to proceed...
pause >nul

:: Registry key to remove
reg delete "HKCU\Software\Classes\SystemFileAssociations\.py\shell\EditWithCustomEditor" /f >nul

echo.
echo [OK] "Edit Script" context menu removed successfully!
echo You will no longer see it when right-clicking .py files.
echo.
pause
