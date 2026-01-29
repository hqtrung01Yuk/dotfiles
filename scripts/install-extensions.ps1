$extensions = Get-Content (Join-Path $PSScriptRoot "extensions.json") | ConvertFrom-Json

foreach ($ext in $extensions){
    code --install-extension $ext
}
