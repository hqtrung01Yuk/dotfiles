# . $env:USERPROFILE\.config\powershell\user_profile.ps1g

oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes\nordtron.omp.json' | Invoke-Expression

#Alias
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
Set-Alias ga Git
Set-Alias gcmess GitCommitMes

Import-Module Terminal-Icons

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}