param(
    [int]$DebounceSeconds = 2
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

git config core.hooksPath .githooks | Out-Null

Write-Host "Watching $repoRoot for changes. Press Ctrl+C to stop."

while ($true) {
    Start-Sleep -Seconds $DebounceSeconds

    $status = git status --porcelain --untracked-files=all
    if (-not $status) {
        continue
    }

    git add -A
    git diff --cached --quiet
    if ($LASTEXITCODE -eq 0) {
        continue
    }

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    git commit -m "auto: sync changes $timestamp"
    git push origin HEAD
}