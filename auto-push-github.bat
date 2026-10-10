@echo off
title Tra Sua DO DO - Tu Dong Day Code Len GitHub
color 0B
cls
echo ==================================================
echo   TRA SUA DO DO - AUTO SYNC GITHUB WATCHER
echo ==================================================
echo.
cd /d "%~dp0"
node auto-push-github.js
pause
