function Install-JavaFromManifest {
    param (
        [Parameter(Mandatory)]
        [hashtable]$JavaManifests,

        [switch]$Global
    )

    foreach ($name in $JavaManifests.Keys) {

        $isInstalled = scoop list |
            ForEach-Object { $_.Name } |
            Where-Object { $_ -eq $name }

        if (-not $isInstalled) {

            Write-Host "Installing $name..." -ForegroundColor Yellow

            try {
                if ($Global) {
                    scoop install --global $JavaManifests[$name]
                } else {
                    scoop install $JavaManifests[$name]
                }

                Write-Host "$name installed" -ForegroundColor Green
            } catch {
                Write-Host "Failed to install $name" -ForegroundColor Red
            }

        } else {
            Write-Host "$name already installed" -ForegroundColor Green
        }
    }
}
