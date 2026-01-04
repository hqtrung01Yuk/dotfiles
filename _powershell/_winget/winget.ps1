$BackupPath = Join-Path $PSScriptRoot "backup.json"

function Add-WingetPath {
    # Winget default path
    $wingetPath = "C:\Windows\System32"

    # Check if already in PATH (Current User)
    $userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    if (-not ($userPath.Split(";") -contains $wingetPath)) {
        [Environment]::SetEnvironmentVariable("PATH", "$userPath;$wingetPath", "User")
        Write-Host "Added Winget to PATH for current user. Restart PowerShell to apply." -ForegroundColor Green
    } else {
        Write-Host "ℹWinget path already exists in user PATH." -ForegroundColor Cyan
    }

    # Also add to current session PATH immediately
    if (-not ($env:PATH.Split(";") -contains $wingetPath)) {
        $env:PATH = "$env:PATH;$wingetPath"
    }
}

function Test-Winget {
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        # Try adding PATH and check again
        Add-WingetPath
        if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
            return "not-installed"
        }
    }

    try {
        winget --info | Out-Null
    } catch {
        return "broken"
    }

    try {
        winget source list | Out-Null
    } catch {
        return "service-down"
    }

    return "ok"
}

if (-not (Test-Path $BackupPath)) {
    Write-Host "backup.json not found, downloading..." -ForegroundColor Yellow
    try {
        Invoke-WebRequest -Uri $BackupUrl -OutFile $BackupPath -UseBasicParsing
        Write-Host "backup.json downloaded." -ForegroundColor Green
    } catch {
        Write-Host "Failed to download backup.json: $_" -ForegroundColor Red
    }
}

# Import vào Winget
if (Test-Path $BackupPath) {
    Write-Host "Importing backup.json packages via Winget..." -ForegroundColor Cyan
    try {
        winget import -i $BackupPath --accept-source-agreements --accept-package-agreements
        Write-Host "Winget packages installed from backup.json" -ForegroundColor Green
    } catch {
        Write-Host "Failed to import packages from backup.json: $_" -ForegroundColor Red
    }
}

# Run test and display result
switch (Test-Winget) {
    "ok" {
        Write-Host "Winget is installed, working, and sources are reachable." -ForegroundColor Green
    }
    "not-installed" {
        Write-Host "Winget is NOT installed on this system." -ForegroundColor Red
        Write-Host "Download from Microsoft Store: https://aka.ms/getwinget" -ForegroundColor Yellow
    }
    "broken" {
        Write-Host "Winget is installed but NOT working." -ForegroundColor Red
        Write-Host "Try reinstalling App Installer from Microsoft Store." -ForegroundColor Yellow
    }
    "service-down" {
        Write-Host "Winget sources are not reachable (service or network issue)." -ForegroundColor Yellow
        Write-Host "Check your internet connection or try again later." -ForegroundColor Yellow
    }
}

# Optional: Output version if OK
if ((Test-Winget) -eq "ok") {
    $wingetVersion = winget --version
    Write-Host "Winget version:" $wingetVersion -ForegroundColor Cyan
}
