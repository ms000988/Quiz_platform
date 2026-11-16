# seed-reading-sections.ps1 - Creates empty A.json through H.json and config.json in all reading folders (never overwrites existing files)

Write-Host "Seeding empty reading sections (A-H) across all exam years..." -ForegroundColor Cyan

$sectionTemplates = @(
    @{ section = "A"; icon = "🛒"; title = "Sektion A"; instructions = "Läs texterna och svara på frågorna." },
    @{ section = "B"; icon = "📔"; title = "Sektion B"; instructions = "Läs texterna och välj rätt ord." },
    @{ section = "C"; icon = "👨‍👩‍👧‍👦"; title = "Sektion C"; instructions = "Läs texterna och matcha rätt person med påståendet." },
    @{ section = "D"; icon = "📊"; title = "Sektion D"; instructions = "Studera diagrammen och svara på frågorna." },
    @{ section = "E"; icon = "🚗"; title = "Sektion E"; instructions = "Läs intervjun och svara på frågorna." },
    @{ section = "F"; icon = "🍦"; title = "Sektion F"; instructions = "Läs artikeln och svara på frågorna." },
    @{ section = "G"; icon = "📱"; title = "Sektion G"; instructions = "Läs inläggen och svara på frågorna." },
    @{ section = "H"; icon = "🏛️"; title = "Sektion H"; instructions = "Läs mötesanteckningarna och informationsbladet." }
)

$targets = @()
if (Test-Path "data/sfi") { $targets += Get-ChildItem -Path "data/sfi" -Directory }
if (Test-Path "years") { $targets += Get-ChildItem -Path "years" -Directory }

$createdCount = 0

foreach ($examDir in $targets) {
    $examId = $examDir.Name
    $readingDir = Join-Path $examDir.FullName "reading"

    if (!(Test-Path $readingDir)) {
        New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
    }

    # 1. Ensure config.json exists
    $configPath = Join-Path $readingDir "config.json"
    if (!(Test-Path $configPath)) {
        $configJson = @"
{
  "year": "$examId",
  "module": "reading",
  "title": "SFI Läsförståelse $examId",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json", "H.json"]
}
"@
        Set-Content -Path $configPath -Value $configJson -Encoding utf8
    }

    # 2. Create A.json through H.json only if missing (preserves existing data like 2025-9)
    foreach ($sec in $sectionTemplates) {
        $fileName = "$($sec.section).json"
        $filePath = Join-Path $readingDir $fileName

        if (!(Test-Path $filePath)) {
            $chartsField = if ($sec.section -eq "D") { "`n  `"charts`": []," } else { "" }
            $jsonContent = @"
{
  "section": "$($sec.section)",
  "icon": "$($sec.icon)",
  "title": "$($sec.title)",
  "instructions": "$($sec.instructions)",
  "texts": [],$chartsField
  "questions": []
}
"@
            Set-Content -Path $filePath -Value $jsonContent -Encoding utf8
            $createdCount++
        }
    }

    Write-Host "  [Verified] $examId/reading/ (A.json - H.json)" -ForegroundColor Green
}

Write-Host "=== Done! Created $createdCount new empty section JSON files. Existing files were untouched. ===" -ForegroundColor Cyan
