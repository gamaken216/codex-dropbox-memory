param(
    [Parameter(Mandatory = $true)]
    [string]$Name
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$memoryRoot = Resolve-Path -LiteralPath (Join-Path $scriptDir '..') | Select-Object -ExpandProperty Path
$projectDir = Join-Path $memoryRoot 'projects'
$templatePath = Join-Path $memoryRoot 'PROJECT_MEMORY_TEMPLATE.md'
$date = Get-Date -Format 'yyyy-MM-dd'

New-Item -ItemType Directory -Force -Path $projectDir | Out-Null

$safeName = $Name.ToLowerInvariant() -replace '[^a-z0-9\-_]+', '-'
$safeName = $safeName.Trim('-')

if ([string]::IsNullOrWhiteSpace($safeName)) {
    throw 'Project name must contain at least one letter or number.'
}

$target = Join-Path $projectDir "$safeName.md"

if (Test-Path -LiteralPath $target) {
    Write-Output $target
    exit 0
}

$content = Get-Content -LiteralPath $templatePath -Raw
$content = $content.Replace('Project:', "Project: $Name").Replace('YYYY-MM-DD', $date)

Set-Content -LiteralPath $target -Value $content -Encoding UTF8
Write-Output $target
