@echo off
title TeaJoy Backend API Server
color 0A
echo ==================================================
echo   HE THONG TEAJOY STORE - BACKEND API SERVER
echo ==================================================
echo.
echo [1/2] Dang giai phong cong 5000 neu bi chiem...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000') do taskkill /f /pid %%a >nul 2>&1
echo [2/2] Dang khoi chay Server Backend va ket noi MySQL...
echo.
cd /d "%~dp0server"
node index.js
if %errorlevel% neq 0 (
    C:\node.js\node.exe index.js
)
pause
