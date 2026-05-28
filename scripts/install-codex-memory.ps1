param(
    [Parameter(Mandatory = $true)]
    [string]$Target,

    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..') | Select-Object -ExpandProperty Path
$targetPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Target)

$directories = @(
    '',
    'inbox',
    'daily',
    'projects',
    'summaries',
    'prompts',
    'scripts',
    'archive'
)

foreach ($dir in $directories) {
    New-Item -ItemType Directory -Force -Path (Join-Path $targetPath $dir) | Out-Null
}

$templateMap = @{
    'templates\memory.md' = 'memory.md'
    'templates\CODEX_STARTUP_PROMPT.md' = 'CODEX_STARTUP_PROMPT.md'
    'templates\SESSION_TEMPLATE.md' = 'SESSION_TEMPLATE.md'
    'templates\DAILY_SUMMARY_TEMPLATE.md' = 'DAILY_SUMMARY_TEMPLATE.md'
    'templates\PROJECT_MEMORY_TEMPLATE.md' = 'PROJECT_MEMORY_TEMPLATE.md'
}

$copyMap = @{}

foreach ($item in $templateMap.GetEnumerator()) {
    $copyMap[$item.Key] = $item.Value
}

Get-ChildItem -LiteralPath (Join-Path $repoRoot 'scripts') -Filter '*.ps1' -File |
    Where-Object { $_.Name -ne 'install-codex-memory.ps1' } |
    ForEach-Object {
        $copyMap["scripts\$($_.Name)"] = "scripts\$($_.Name)"
    }

Get-ChildItem -LiteralPath (Join-Path $repoRoot 'prompts') -Filter '*.md' -File |
    ForEach-Object {
        $copyMap["prompts\$($_.Name)"] = "prompts\$($_.Name)"
    }

foreach ($item in $copyMap.GetEnumerator()) {
    $source = Join-Path $repoRoot $item.Key
    $destination = Join-Path $targetPath $item.Value

    if ((Test-Path -LiteralPath $destination) -and -not $Force) {
        Write-Output "Skip existing: $destination"
        continue
    }

    Copy-Item -LiteralPath $source -Destination $destination -Force:$Force
    Write-Output "Copied: $destination"
}

$memoryPath = Join-Path $targetPath 'memory.md'
if (Test-Path -LiteralPath $memoryPath) {
    $today = Get-Date -Format 'yyyy-MM-dd'
    $content = Get-Content -LiteralPath $memoryPath -Raw
    if ($content -match 'YYYY-MM-DD') {
        $content = $content.Replace('YYYY-MM-DD', $today)
        Set-Content -LiteralPath $memoryPath -Value $content -Encoding UTF8
    }
}

Write-Output ''
Write-Output "Codex memory folder is ready:"
Write-Output $targetPath
