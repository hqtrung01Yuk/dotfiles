# . $env:USERPROFILE\.config\powershell\user_profile.ps1g

# oh-my-posh
# oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes\nordtron.omp.json' | Invoke-Expression

# Set Alias Powershell
Set-Alias l ls
Set-Alias g git

function GitInit {
    git init
}

function GitAdd($files) {
    git add $files
}

function GitCommitEmptyMes {
    git commit --allow-empty-message
}

function GitCommitMes($message) {
    git commit -m $message
}

function GitLog {
    git log
}

function GitRemoteOrigin($gitPath) {
    git remote add origin $gitPath
}

function GitPushMain {
    git push origin main
}

function GitStatus {
    git status
}

function vscode($files) {
    code $files
}

Set-Alias glog GitLog
Set-Alias gin GitInit
Set-Alias gcempty GitCommitEmptyMes
Set-Alias gmain GitPushMain
Set-Alias gs GitStatus
Set-Alias vs vscode
Set-Alias ga GitAdd
Set-Alias gcmess GitCommitMes
Set-Alias gremote GitRemoteOrigin

#PSFzf
Import-Module PSFzf
Set-PsFzfOption -PSRealineChordProvider "Ctrl+f" -PSReadlinChordReverseHistory "Ctrl+r"

# Terminal Icon
Import-Module Terminal-Icons

#Which command
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
