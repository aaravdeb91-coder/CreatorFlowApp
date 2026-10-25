@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo       CreatorFlow - Local Starter
echo ========================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found. Install Node.js 20 or newer from https://nodejs.org/ and reopen this window.
  pause
  exit /b 1
)
where npm >nul 2>nul
if errorlevel 1 (
  echo npm was not found. Reinstall Node.js with npm included, then reopen this window.
  pause
  exit /b 1
)

if not exist .env.local (
  copy .env.example .env.local >nul
  echo Created .env.local from .env.example. Free local templates need no API key.
)

if not exist node_modules (
  echo Installing dependencies. An internet connection is required for this first step.
  call npm install
  if errorlevel 1 (
    echo.
    echo Dependency installation failed. Check your internet connection and try again.
    pause
    exit /b 1
  )
)

echo.
echo Starting CreatorFlow. Keep this window open while using the app.
echo Open http://localhost:3000 in your browser.
echo Press Ctrl+C to stop the development server.
echo.
call npm run dev
pause
