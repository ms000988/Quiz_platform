# upgrade-reading.ps1 - Upgrades all reading/index.html files to use the universal ReadingRenderer

Write-Host "1. Upgrading all reading/index.html files..." -ForegroundColor Cyan

$targets = @()
if (Test-Path "data/sfi") {
    $targets += Get-ChildItem -Path "data/sfi" -Directory
}
if (Test-Path "years") {
    $targets += Get-ChildItem -Path "years" -Directory
}

foreach ($examDir in $targets) {
    $examId = $examDir.Name
    $readingDir = Join-Path $examDir.FullName "reading"

    if (!(Test-Path $readingDir)) {
        New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
    }

    # Determine relative path back to root (data/sfi/2025-9/reading -> ../../../../ vs years/2025-9/reading -> ../../../)
    $relRoot = if ($examDir.FullName -match "data[\\/]sfi") { "../../../../" } else { "../../../" }

    # Ensure config.json exists
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

    # Write clean, valid HTML wired to assets/core/reading-renderer.js
    $htmlContent = @"
<!DOCTYPE html>
<html lang="sv">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SFI Läsförståelse – $examId</title>
  <link rel="stylesheet" href="${relRoot}assets/css/style.css" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <div id="reading-app"></div>

  <script type="module">
    import { ReadingRenderer } from '${relRoot}assets/core/reading-renderer.js';

    const app = new ReadingRenderer({
      configPath: './config.json',
      rootElement: document.getElementById('reading-app'),
      examId: '$examId'
    });
    app.init();
  </script>
</body>
</html>
"@

    Set-Content -Path (Join-Path $readingDir "index.html") -Value $htmlContent -Encoding utf8
    Write-Host "  [Upgraded] $examId/reading/index.html" -ForegroundColor Green
}

# 2. Create a 1-click local server script (required for ES modules & JSON fetch)
$serverScript = @'
Write-Host "Starting local web server at http://localhost:8080 ..." -ForegroundColor Cyan
Write-Host "Open http://localhost:8080/data/sfi/2025-9/reading/index.html in your browser." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop the server." -ForegroundColor Gray

if (Get-Command python -ErrorAction SilentlyContinue) {
    python -m http.server 8080
} elseif (Get-Command npx -ErrorAction SilentlyContinue) {
    npx http-server -p 8080 -c-1
} else {
    Write-Host "Neither Python nor Node/npx was found. Install VS Code 'Live Server' extension or Python to serve JSON files." -ForegroundColor Red
}
'@
Set-Content -Path "start-server.ps1" -Value $serverScript -Encoding utf8
Write-Host "  [Created] start-server.ps1" -ForegroundColor Green

Write-Host "=== Done! Run ./start-server.ps1 to view your exam in the browser. ===" -ForegroundColor Cyan
