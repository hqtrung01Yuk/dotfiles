$extensions = Get-Content "./extensions.json" | ConvertFrom-Json

foreach ($ext in $extensions.recommendations) {
    code --install-extension $ext
}
