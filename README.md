# Dotfiles

My setup code editor, environment, configuration

# Setup VSCode

Run script after install VSCode to install extensions

## Linux / Git Bash

```bash
#! /usr/bin/bash
chmod +x ./scripts/install-extensions.sh
./scripts/install-extensions.sh
```

## Windows

Check version Powershell, recommend use Powershell 7+,
default Windows are using Windows Powershell 5

Command to check version into Terminal at Windows.

```powershell
$PSVersionTable

# Output
Name                           Value
----                           -----
PSVersion                      5.1.22621.2506                # <- Here is your default version of your Windows (this version is 5)
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.22621.2506               # <- Here have been builded Windows 10
CLRVersion                     4.0.30319.42000               # <- Here have been builded CLR used to .NET Framework 4
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```

Download Powershell version 7 using winget (package manager)

```powershell
winget search --id Microsoft.PowerShell

# Output
Name               Id                           Version Source
---------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.5.4.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.6.0.6 winget

# Download with --id param
winget install --id Microsoft.PowerShell --source winget
```

Then download extension for VSCode

```powershell
# For scoped to the current user (meaning for home directory in Windows)
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Recommend
./scripts/install-extensions.ps1

# Without policy (Powershell 5)
powershell -ExecutionPolicy Bypass -File install-extensions.ps1

# PowerShell 7
pwsh ./install-extensions.ps1
```

# Setup Powershell

## For Windows

```powershell
# For profile Terminal Powershell
Copy-Item './_powershell/Microsoft.PowerShell_profile.ps1' '~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'

# For profile Terminal VSCode
Copy-Item './_powershell/Microsoft.PowerShell_profile.ps1' '~/Documents/WindowsPowerShell/Microsoft.VSCode_profile.ps1'
```

## For Git Bash / Linux using Powershell instead

```bash
# For profile Terminal Powershell
cp './_powershell/Microsoft.PowerShell_profile.ps1' '~/.config/powershell/Microsoft.PowerShell_profile.ps1'

# For profile Terminal VSCode
cp './_powershell/Microsoft.VSCode_profile.ps1' '~/.config/powershell/Microsoft.VSCode_profile.ps1'
```

# Setup Scoop and Package for Scoop

Install Scoop and its packages:

```powershell
# Temporarily bypass execution policy for the current PowerShell session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Run package installation script
# PowerShell 5 (Windows PowerShell)
powershell -ExecutionPolicy Bypass -File .\_powershell\_scoop\_config\package.ps1

# PowerShell 7 (Recommended)
pwsh -ExecutionPolicy Bypass -File .\_powershell\_scoop\_config\package.ps1
```

# Setup Winget and download backup by Winget process

## Method 1: Using PowerShell (Recommended: PowerShell 7)

```powershell
# PowerShell 7 – Install for Machine (Admin)
pwsh -NoProfile -ExecutionPolicy Bypass -File ".\_powershell\_winget\winget.ps1"

# PowerShell 5 – Install for Machine (Admin)
powershell -NoProfile -ExecutionPolicy Bypass -File ".\_powershell\_winget\winget.ps1"
```

> Note: To install packages into `C:\Program Files` (Machine scope), run PowerShell as Administrator.

Method 2: Using the .bat File

- Double-click run-winget.bat and select Run as Administrator.
- This will automatically execute winget.ps1 with the correct execution policy and install packages for the entire machine.

# About NVim

I've never used Neovim before, so I don't know the configuration; I just copied that from someone else.
