@echo off
title TeaJoy Backend API Server
color 0A
echo ==================================================
echo 🧋 HE THONG TEAJOY STORE - BACKEND API SERVER
echo ==================================================
echo.
cd /d "%~dp0server"
C:\node.js\node.exe index.js
pause
