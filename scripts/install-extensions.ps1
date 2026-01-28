$extensions = Get-Content "./extensions.json" | ConvertFrom-Json

foreach ($ext in $extensions){
    code --install-extension $ext
}
