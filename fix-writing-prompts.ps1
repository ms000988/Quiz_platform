# fix-writing-prompts.ps1 - Cleans broken 404 iframe embeds from prompt.json and removes unused legacy quiz.js in writing folders

Write-Host "Cleaning writing prompts and legacy files..." -ForegroundColor Cyan

$targets = @()
if (Test-Path "data/sfi") { $targets += Get-ChildItem -Path "data/sfi" -Directory }
if (Test-Path "years") { $targets += Get-ChildItem -Path "years" -Directory }

foreach ($examDir in $targets) {
    $examId = $examDir.Name
    $writingDir = Join-Path $examDir.FullName "writing"
    if (!(Test-Path $writingDir)) { continue }

    # 1. Remove unused legacy quiz.js inside writing/ so it causes no confusion
    $legacyJs = Join-Path $writingDir "quiz.js"
    if (Test-Path $legacyJs) {
        Remove-Item $legacyJs -Force
    }

    # 2. Check prompt.json for broken <iframe> / <embed> / <object> tags
    $promptJsonPath = Join-Path $writingDir "prompt.json"
    if (Test-Path $promptJsonPath) {
        $raw = Get-Content -Path $promptJsonPath -Raw -Encoding utf8
        if ($raw -match "<iframe|<embed|<object|Läs instruktionerna nedan:") {
            $cleanPrompt = @"
{
  "examId": "$examId",
  "title": "Skrivuppgift – $examId",
  "promptText": "Skriv en sammanhängande text på svenska där du beskriver dina tankar och motiverar dina åsikter.",
  "minWords": 80
}
"@
            Set-Content -Path $promptJsonPath -Value $cleanPrompt -Encoding utf8
            Write-Host "  [Cleaned 404 iframe] $examId/writing/prompt.json" -ForegroundColor Green
        }
    }
}

Write-Host "=== Done! Press Ctrl+F5 in your browser to clear cache and reload 2025-9/writing/index.html ===" -ForegroundColor Cyan
