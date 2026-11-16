# force-fix-hub.ps1 - Directly overwrites and modernizes all exam hub index.html files

Write-Host "Force-updating exam hub index files..." -ForegroundColor Cyan

$examFolders = Get-ChildItem -Path "data/sfi" -Directory

foreach ($folder in $examFolders) {
    $examId = $folder.Name
    $hubPath = Join-Path $folder.FullName "index.html"

    # Exact HTML structure using correct relative path ../../../assets/css/style.css
    $htmlContent = @"
<!DOCTYPE html>
<html lang='sv'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>SFI Delprov – $examId</title>
    <link rel='stylesheet' href='../../../assets/css/style.css'>
</head>
<body>
    <div class='app-container'>
        <header class='hero-header' style='text-align: left; margin-bottom: 24px;'>
            <a href='../../../index.html' class='nav-btn secondary' style='display: inline-block; margin-bottom: 16px;'>← Tillbaka till översikten</a>
            <h1 style='margin: 0 0 8px 0; font-size: 1.8rem;'>Delprov: $examId</h1>
            <p style='color: var(--text-muted); margin: 0;'>Välj vilket delprov du vill träna på nedan.</p>
        </header>

        <main class='hub-grid' style='display: grid; grid-template-columns: 1fr; gap: 16px;'>
            <div class='content-card' style='display: flex; justify-content: space-between; align-items: center; padding: 20px;'>
                <div>
                    <h3 style='margin: 0 0 6px 0; font-size: 1.1rem;'>📘 Läsförståelse (Reading)</h3>
                    <p style='margin: 0; color: var(--text-muted); font-size: 0.9rem;'>Sektioner A till H med flerval och korta svar.</p>
                </div>
                <a href='reading/index.html' class='nav-btn primary' style='text-decoration: none;'>Starta Läsa</a>
            </div>

            <div class='content-card' style='display: flex; justify-content: space-between; align-items: center; padding: 20px;'>
                <div>
                    <h3 style='margin: 0 0 6px 0; font-size: 1.1rem;'>🎧 Hörförståelse (Listening)</h3>
                    <p style='margin: 0; color: var(--text-muted); font-size: 0.9rem;'>Ljudfiler med max 2 spelningar och tillhörande frågor.</p>
                </div>
                <a href='listening/index.html' class='nav-btn primary' style='text-decoration: none;'>Starta Lyssna</a>
            </div>

            <div class='content-card' style='display: flex; justify-content: space-between; align-items: center; padding: 20px;'>
                <div>
                    <h3 style='margin: 0 0 6px 0; font-size: 1.1rem;'>✍️ Skriva (Writing)</h3>
                    <p style='margin: 0; color: var(--text-muted); font-size: 0.9rem;'>Skriv uppgift med LanguageTool felmarkering och CEFR-analys.</p>
                </div>
                <a href='writing/index.html' class='nav-btn primary' style='text-decoration: none;'>Starta Skriva</a>
            </div>

            <div class='content-card' style='display: flex; justify-content: space-between; align-items: center; padding: 20px;'>
                <div>
                    <h3 style='margin: 0 0 6px 0; font-size: 1.1rem;'>🗣️ Tala (Speaking)</h3>
                    <p style='margin: 0; color: var(--text-muted); font-size: 0.9rem;'>Interaktiva talövningar (Del 1 & Del 2) med timer och AI-stöd.</p>
                </div>
                <a href='speaking/index.html' class='nav-btn primary' style='text-decoration: none;'>Starta Tala</a>
            </div>
        </main>
    </div>
</body>
</html>
"@

    Set-Content -Path $hubPath -Value $htmlContent -Encoding utf8
    Write-Host "  [Forced Update] $hubPath" -ForegroundColor Green
}

Write-Host "=== All exam hubs successfully updated and styled! ===" -ForegroundColor Cyan
