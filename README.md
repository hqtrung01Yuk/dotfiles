# Dotfiles

My setup code editor, environment, configuration

# Setup VSCode

Run script after install VSCode to install extensions

## Linux / Git Bash

```bash
#! /usr/bin/bash
chmod +x ./_vscode/install-extensions.sh
./scripts/install-extensions.sh
```

## Windows

Check version Powershell, recommend use Powershell 7+,
default Windows are using Windows Powershell 5

```ps1
# For scoped to the current user (meaning for home directory in Windows)
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Recommend
./scripts/install-extensions.ps1

# Without policy
powershell -ExecutionPolicy Bypass -File install-extensions.ps1

# PowerShell 7
pwsh ./install-extensions.ps1
```

# Setup Powershell

## For Windows

```ps1
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

# About NVim

I've never used Neovim before, so I don't know the configuration; I just copied that from someone else.
