@echo off
REM Check if python3 is installed
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python is not installed or not in PATH.
    pause
    exit /b 1
)

REM Create virtual environment if it doesn't exist
IF NOT EXIST ".venv\Scripts\activate.bat" (
    echo Creating virtual environment...
    python -m venv .venv
)

REM Activate virtual environment
call .venv\Scripts\activate.bat

REM Check pip version
for /f "tokens=2 delims== " %%a in ('pip show pip ^| findstr Version') do set "PIP_VERSION=%%a"
REM Simple pip version check - upgrade pip always (change if needed)
echo Upgrading pip...
pip install --upgrade pip

REM Check if rich is installed
pip show rich >nul 2>&1
IF ERRORLEVEL 1 (
    echo Installing rich...
    pip install rich
) ELSE (
    echo rich is already installed.
)

REM Run the server
python serve.py

pause