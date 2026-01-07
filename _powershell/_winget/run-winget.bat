@echo off
REM Run winget.ps1 as Machine (Admin)
REM Must run this BAT "Run as Administrator"

@REM call "%~dp0install_all.bat"

where pwsh >nul 2>nul && (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "%~dp0winget.ps1"
    exit /b
)

where powershell >nul 2>nul && (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0winget.ps1"
    exit /b
)

echo Neither PowerShell nor pwsh is installed
exit /b 1
