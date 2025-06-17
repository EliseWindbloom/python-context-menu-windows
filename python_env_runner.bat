@echo off
setlocal enabledelayedexpansion

:: Get the full path of the Python script
set "SCRIPT_PATH=%~1"
set "SCRIPT_DIR=%~dp1"
set "SCRIPT_NAME=%~nx1"

echo Running Python script: %SCRIPT_NAME%
echo Script location: %SCRIPT_DIR%
echo.

:: Initialize variables
set "VENV_FOUND=0"
set "PYTHON_EXE=python"

:: Strategy 1: Look for virtual environment in subfolders of script directory
echo Checking for virtual environment in subfolders of script directory...
for /d %%i in ("%SCRIPT_DIR%*") do (
    if exist "%%i\pyvenv.cfg" (
        if exist "%%i\Scripts\python.exe" (
            echo Found virtual environment: %%i
            set "PYTHON_EXE=%%i\Scripts\python.exe"
            set "VENV_FOUND=1"
            goto :run_script
        )
    )
)

:: Strategy 2: Look in parent directory for environment folders
echo Checking parent directory for virtual environments...
for /f "delims=" %%p in ('cd') do set "CURRENT_DIR=%%p"
cd /d "%SCRIPT_DIR%.."
for /d %%i in (*) do (
    if exist "%%i\pyvenv.cfg" (
        if exist "%%i\Scripts\python.exe" (
            echo Found virtual environment: %CD%\%%i
            set "PYTHON_EXE=%CD%\%%i\Scripts\python.exe"
            set "VENV_FOUND=1"
            cd /d "!CURRENT_DIR!"
            goto :run_script
        )
    )
)
cd /d "%CURRENT_DIR%"

:run_script
echo.
if "%VENV_FOUND%"=="1" (
    echo Using Python from virtual environment: %PYTHON_EXE%
) else (
    echo No virtual environment found, using system Python
)

echo.
echo ==================== SCRIPT OUTPUT ====================
echo.

:: Change to script directory before running
cd /d "%SCRIPT_DIR%"

:: Run the Python script
"%PYTHON_EXE%" "%SCRIPT_PATH%"
set "EXIT_CODE=%ERRORLEVEL%"

echo.
echo ==================== SCRIPT FINISHED ====================
echo Exit code: %EXIT_CODE%
echo.

:: Keep window open so user can see output
echo Press any key to close...
pause >nul