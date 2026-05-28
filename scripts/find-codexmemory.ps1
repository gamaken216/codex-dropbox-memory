param(
    [string[]]$AdditionalPaths = @()
)

$ErrorActionPreference = 'Stop'

$candidates = @(
    "$env:USERPROFILE\Dropbox\Codexmemory",
    "$env:USERPROFILE\Dropbox\GAI\Codexmemory",
    "D:\Dropbox\Codexmemory",
    "D:\Dropbox\GAI\Codexmemory",
    "D:\Users\$env:USERNAME\Dropbox\Codexmemory",
    "D:\Users\$env:USERNAME\Dropbox\GAI\Codexmemory"
) + $AdditionalPaths

foreach ($path in $candidates) {
    if (Test-Path -LiteralPath $path) {
        Resolve-Path -LiteralPath $path | Select-Object -ExpandProperty Path
        exit 0
    }
}

Write-Error "Codex memory folder was not found. Checked: $($candidates -join ', ')"
exit 1
