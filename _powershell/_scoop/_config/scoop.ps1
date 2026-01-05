# import file
. "$PSScriptRoot\Install-Java.ps1"

# download scoop
$has_command = Get-Command scoop -ErrorAction SilentlyContinue
$has_path = Test-Path "$env:USERPROFILE\scoop\shims\scoop.ps1"
if(-not $has_command -and -not $has_path) {
    Write-Host "Installing Scoop..." -ForegroundColor Yellow

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    try {
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    } catch {
        Write-Host "Error while installing Scoop" -ForegroundColor Red
        exit 1
    }
} elseif ($has_command -and -not $has_path) {
    Write-Host "Don't have PATH. Reloading PATH..." -ForegroundColor Yellow
    
    # add PATH
    $env:PATH = @(
            [System.Environment]::GetEnvironmentVariable("PATH", "User")
            [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
        ) -join ";"

    if(Get-Command scoop -ErrorAction SilentlyContinue) {
        Write-Host "PATH have been added, Scoop have been had" -ForegroundColor Green
    } else {
        Write-Host "PATH have been added, Scoop haven't been had" -ForegroundColor Red
    }

    Write-Host "Set Scoop PATH already" -ForegroundColor Green
} else {
    Write-Host "Scoop are ready" -ForegroundColor Green
}

$backup_file = "$PSScriptRoot\backup.json";
if([System.IO.File]::Exists($backup_file)) {
    & scoop import $backup_file
    Write-Host "Import file backup successfully" -ForegroundColor Green
} else {
    Write-Host "Can't not import backup by Scoop" -ForegroundColor Red
}

$javaManifests = @{
    "java8"  = "$PSScriptRoot\_java\java8.json"
    "java11" = "$PSScriptRoot\_java\java11.json"
    "java17" = "$PSScriptRoot\_java\java17.json"
    "java21" = "$PSScriptRoot\_java\java21.json"
    "java25" = "$PSScriptRoot\_java\java25.json"
}

Install-JavaFromManifest -JavaManifests $javaManifests -Global
