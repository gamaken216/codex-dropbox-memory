param(
    [string]$Date = (Get-Date -Format 'yyyy-MM-dd')
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$memoryRoot = Resolve-Path -LiteralPath (Join-Path $scriptDir '..') | Select-Object -ExpandProperty Path
$dailyDir = Join-Path $memoryRoot 'daily'
$inboxDir = Join-Path $memoryRoot 'inbox'
$target = Join-Path $dailyDir "$Date.md"
$templatePath = Join-Path $memoryRoot 'DAILY_SUMMARY_TEMPLATE.md'

New-Item -ItemType Directory -Force -Path $dailyDir | Out-Null

if (Test-Path -LiteralPath $target) {
    Write-Output $target
    exit 0
}

$template = Get-Content -LiteralPath $templatePath -Raw
$logs = @()

if (Test-Path -LiteralPath $inboxDir) {
    $compactDate = $Date.Replace('-', '')
    $logs = Get-ChildItem -LiteralPath $inboxDir -Filter "$compactDate*.md" -File |
        Sort-Object Name |
        Select-Object -ExpandProperty Name
}

$sourceLines = if ($logs.Count -gt 0) {
    ($logs | ForEach-Object { '- `inbox/{0}`' -f $_ }) -join [Environment]::NewLine
} else {
    "- No matching inbox logs found yet."
}

$content = $template.Replace('YYYY-MM-DD', $Date)
$content = $content -replace '## Source Logs\s*\r?\n\s*-\s*', "## Source Logs`r`n`r`n$sourceLines"

Set-Content -LiteralPath $target -Value $content -Encoding UTF8
Write-Output $target
