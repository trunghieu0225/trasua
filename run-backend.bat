@echo off
title Tra Sua DO DO - Backend API Server
color 0F
cls
echo ==================================================
echo   TRA SUA DO DO - BACKEND API SERVER
echo ==================================================
echo.
echo [1/2] Dang kiem tra va giai phong cong 5000...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000') do taskkill /f /pid %%a >nul 2>&1
echo [2/2] Dang khoi chay Server Backend...
echo.
cd /d "%~dp0server"
node index.js
if %errorlevel% neq 0 (
    C:\node.js\node.exe index.js
)
pause
