@echo off
cd /d "%~dp0"

echo Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python not found. Install it from https://python.org
    pause
    exit /b 1
)

for /f "tokens=2 delims= " %%v in ('python --version 2^>^&1') do set PYVER=%%v
for /f "tokens=1,2 delims=." %%a in ("%PYVER%") do (
    set MAJOR=%%a
    set MINOR=%%b
)

if %MAJOR% LSS 3 (
    echo ERROR: Python 3.6+ required. You have %PYVER%
    pause
    exit /b 1
)
if %MAJOR% EQU 3 if %MINOR% LSS 6 (
    echo ERROR: Python 3.6+ required. You have %PYVER%
    pause
    exit /b 1
)

echo Found Python %PYVER%
echo.
echo Starting Note Quiz...
echo Open your browser and go to: http://localhost:8080/note-quiz.html
echo Press Ctrl+C to stop.
echo.
python -m http.server 8080
