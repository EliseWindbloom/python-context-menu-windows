@echo off
:: ======================================================
:: [ INSTALL SCRIPT ] - Adds context menu for .py files
:: Requires Administrator, runs from the current directory
:: ======================================================

:: Check for admin rights
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo This installer must be run as Administrator.
    echo Please right-click and choose "Run as administrator".
    pause
    exit /b 1
)

:: Get the path of the folder containing this script
set "INSTALL_DIR=%~dp0"
set "INSTALL_DIR=%INSTALL_DIR:~0,-1%"

:: Path to the runner file
set "RUNNER_PATH=%INSTALL_DIR%\python_env_runner.bat"

:: Ensure the runner file exists
if not exist "%RUNNER_PATH%" (
    echo Error: python_env_runner.bat not found in this directory.
    echo Make sure all 3 files are in the same folder.
    pause
    exit /b 1
)

:: Add the context menu entry (for .py files)
echo Installing registry entries...
reg add "HKCU\Software\Classes\SystemFileAssociations\.py\shell\RunWithEnv" /ve /d "Run with Python (auto-venv)" /f >nul
reg add "HKCU\Software\Classes\SystemFileAssociations\.py\shell\RunWithEnv\command" /ve /d "\"%RUNNER_PATH%\" \"%%1\"" /f >nul

echo.
echo [OK] Installed successfully!
echo [!] You may need to restart File Explorer (or log out/back in) to see the new menu.
pause
