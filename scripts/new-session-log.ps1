$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$memoryRoot = Resolve-Path -LiteralPath (Join-Path $scriptDir '..') | Select-Object -ExpandProperty Path
$date = Get-Date -Format 'yyyy-MM-dd'
$timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$pcName = $env:COMPUTERNAME
$target = Join-Path $memoryRoot "inbox\$timestamp-$pcName.md"
$templatePath = Join-Path $memoryRoot 'SESSION_TEMPLATE.md'

New-Item -ItemType Directory -Force -Path (Join-Path $memoryRoot 'inbox') | Out-Null

$template = Get-Content -LiteralPath $templatePath -Raw
$content = $template.
    Replace('YYYY-MM-DD', $date).
    Replace('PC:', "PC: $pcName")

Set-Content -LiteralPath $target -Value $content -Encoding UTF8
Write-Output $target
