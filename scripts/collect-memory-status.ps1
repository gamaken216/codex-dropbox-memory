$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$memoryRoot = Resolve-Path -LiteralPath (Join-Path $scriptDir '..') | Select-Object -ExpandProperty Path

$paths = [ordered]@{
    Root = $memoryRoot
    Memory = Join-Path $memoryRoot 'memory.md'
    Inbox = Join-Path $memoryRoot 'inbox'
    Daily = Join-Path $memoryRoot 'daily'
    Projects = Join-Path $memoryRoot 'projects'
    Prompts = Join-Path $memoryRoot 'prompts'
}

foreach ($item in $paths.GetEnumerator()) {
    [PSCustomObject]@{
        Name = $item.Key
        Path = $item.Value
        Exists = Test-Path -LiteralPath $item.Value
    }
}

Write-Output ''
Write-Output 'Recent inbox logs:'
Get-ChildItem -LiteralPath $paths.Inbox -Filter '*.md' -File -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 5 Name, LastWriteTime

Write-Output ''
Write-Output 'Recent daily summaries:'
Get-ChildItem -LiteralPath $paths.Daily -Filter '*.md' -File -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 5 Name, LastWriteTime

Write-Output ''
Write-Output 'Project memories:'
Get-ChildItem -LiteralPath $paths.Projects -Filter '*.md' -File -ErrorAction SilentlyContinue |
    Sort-Object Name |
    Select-Object Name, LastWriteTime
