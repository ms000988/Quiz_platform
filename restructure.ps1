# restructure.ps1 - SFI Platform Migration Script

Write-Host "=== Starting SFI Platform Restructuring ===" -ForegroundColor Cyan

# 1. Create Core Assets & Data Directories
$coreDirs = @(
    "assets/css",
    "assets/core",
    "assets/images",
    "data/sfi"
)

foreach ($dir in $coreDirs) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
        Write-Host "[Created Core] $dir" -ForegroundColor Green
    }
}

# 2. Get all exam year folders under ./years/
if (!(Test-Path "years")) {
    Write-Host "Error: 'years' directory not found!" -ForegroundColor Red
    exit
}

$examFolders = Get-ChildItem -Path "years" -Directory

foreach ($examFolder in $examFolders) {
    $examId = $examFolder.Name
    $targetExamPath = "data/sfi/$examId"

    Write-Host "Processing Exam Session: $examId" -ForegroundColor Yellow

    # Create centralized data paths for this exam
    $pathReading = "$targetExamPath/reading"
    $pathListening = "$targetExamPath/listening"
    $pathWriting = "$targetExamPath/writing"
    $pathSpeaking = "$targetExamPath/speaking"
    $pathAssetsAudio = "$targetExamPath/assets/audio"
    $pathAssetsImages = "$targetExamPath/assets/images"

    New-Item -ItemType Directory -Path $pathReading -Force | Out-Null
    New-Item -ItemType Directory -Path $pathListening -Force | Out-Null
    New-Item -ItemType Directory -Path $pathWriting -Force | Out-Null
    New-Item -ItemType Directory -Path $pathSpeaking -Force | Out-Null
    New-Item -ItemType Directory -Path $pathAssetsAudio -Force | Out-Null
    New-Item -ItemType Directory -Path $pathAssetsImages -Force | Out-Null

    # Migrate Audio if exists in old structure
    $oldAudio = Join-Path $examFolder.FullName "assets/audio"
    if (Test-Path $oldAudio) {
        Copy-Item "$oldAudio/*" -Destination $pathAssetsAudio -Recurse -Force -ErrorAction SilentlyContinue
    }

    # Migrate Images if exists in old structure
    $oldImages = Join-Path $examFolder.FullName "assets/images"
    if (Test-Path $oldImages) {
        Copy-Item "$oldImages/*" -Destination $pathAssetsImages -Recurse -Force -ErrorAction SilentlyContinue
    }

    # If old folder had 2025-9 style JSON reading files, copy them over
    $oldReadingJson = Join-Path $examFolder.FullName "reading"
    if (Test-Path $oldReadingJson) {
        $jsonFiles = Get-ChildItem -Path $oldReadingJson -Filter "*.json"
        if ($jsonFiles.Count -gt 0) {
            Copy-Item "$oldReadingJson/*.json" -Destination $pathReading -Force -ErrorAction SilentlyContinue
        }
    }

    # Generate meta.json
    $metaJson = @"
{
  "examId": "$examId",
  "title": "SFI Exam Session $examId",
  "passThreshold": 0.60
}
"@
    Set-Content -Path "$targetExamPath/meta.json" -Value $metaJson -Encoding utf8

    # Generate Reading config.json if not present
    if (!(Test-Path "$pathReading/config.json")) {
        $readingConfig = @"
{
  "year": "$examId",
  "module": "reading",
  "title": "SFI Läsförståelse $examId",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json", "H.json"]
}
"@
        Set-Content -Path "$pathReading/config.json" -Value $readingConfig -Encoding utf8
    }

    # Generate Listening JSON template
    if (!(Test-Path "$pathListening/listening.json")) {
        $listeningJson = @"
{
  "examId": "$examId",
  "parts": [
    {
      "id": 1,
      "title": "Del 1",
      "audio": "audio1.mp3",
      "maxPlays": 2,
      "questions": []
    },
    {
      "id": 2,
      "title": "Del 2",
      "audio": "audio2.mp3",
      "maxPlays": 2,
      "questions": []
    }
  ]
}
"@
        Set-Content -Path "$pathListening/listening.json" -Value $listeningJson -Encoding utf8
    }

    # Generate Writing Prompt JSON template
    if (!(Test-Path "$pathWriting/prompt.json")) {
        $writingJson = @"
{
  "examId": "$examId",
  "promptText": "Skriv en text om dina framtidsplaner eller en upplevelse. Motivera dina åsikter.",
  "minWords": 100
}
"@
        Set-Content -Path "$pathWriting/prompt.json" -Value $writingJson -Encoding utf8
    }

    # Generate Speaking JSON template (2 talks: Del 1 & Del 2)
    if (!(Test-Path "$pathSpeaking/speaking.json")) {
        $speakingJson = @"
{
  "examId": "$examId",
  "talks": [
    {
      "part": 1,
      "title": "Tala - Del 1: Situation och beskrivning",
      "prompt": "Beskriv en situation där du behövde lösa ett problem. Vad hände och hur gjorde du?",
      "preparationTimeSeconds": 60,
      "speakingTimeSeconds": 120
    },
    {
      "part": 2,
      "title": "Tala - Del 2: Åsikter och diskussion",
      "prompt": "Vilka för- och nackdelar finns det med att arbeta eller studera på distans? Motivera dina åsikter.",
      "preparationTimeSeconds": 60,
      "speakingTimeSeconds": 120
    }
  ]
}
"@
        Set-Content -Path "$pathSpeaking/speaking.json" -Value $speakingJson -Encoding utf8
    }
}

Write-Host "=== Restructuring Complete! All exam sessions migrated to data/sfi/ ===" -ForegroundColor Cyan
