@echo off
setlocal
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js 18+ is required.
  echo Install Node.js, then run this file again.
  pause
  exit /b 1
)
node tools\serve.js 8080
pause
