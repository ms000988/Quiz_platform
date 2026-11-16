# fix-all-styles.ps1 - Fixes CSS syntax error, adds full component styles, and updates all exam hub pages

Write-Host "1. Updating assets/css/style.css..." -ForegroundColor Cyan

if (!(Test-Path "assets/css")) {
    New-Item -ItemType Directory -Path "assets/css" -Force | Out-Null
}

$cssContent = @'
:root {
  --bg-page: #f4f6f9;
  --bg-card: #ffffff;
  --text-main: #1e293b;
  --text-muted: #64748b;
  --primary: #2563eb;
  --primary-hover: #1d4ed8;
  --success: #16a34a;
  --danger: #dc2626;
  --border: #e2e8f0;
  --shadow: 0 2px 8px rgba(15, 23, 42, 0.06);
  --radius: 12px;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  background: var(--bg-page);
  color: var(--text-main);
  padding-bottom: 84px;
  line-height: 1.5;
}

.app-container {
  max-width: 860px;
  margin: 0 auto;
  padding: 28px 16px;
}

.hero-header {
  margin-bottom: 24px;
}

.hub-grid {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.platform-card,
.content-card {
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 20px;
  box-shadow: var(--shadow);
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.content-card:hover {
  box-shadow: 0 6px 16px rgba(15, 23, 42, 0.09);
}

/* Hub Cards & Buttons */
.exam-hub-card {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
}

.exam-hub-card h3 {
  margin: 0 0 6px 0;
  font-size: 1.15rem;
}

.exam-hub-card p {
  margin: 0;
  color: var(--text-muted);
  font-size: 0.92rem;
}

/* Backward-compatible .exam-parts & .btn support */
.exam-parts {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 16px;
}

.btn,
.nav-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  padding: 10px 16px;
  border-radius: 8px;
  border: none;
  font-weight: 600;
  font-size: 0.92rem;
  text-decoration: none;
  cursor: pointer;
  white-space: nowrap;
  transition: background 0.15s ease, transform 0.1s ease;
}

.btn,
.nav-btn.primary {
  background: var(--primary);
  color: #ffffff;
}

.btn:hover,
.nav-btn.primary:hover {
  background: var(--primary-hover);
}

.nav-btn:disabled {
  opacity: 0.45;
  cursor: not-allowed;
}

.nav-btn.secondary {
  background: var(--bg-card);
  color: var(--text-main);
  border: 1px solid var(--border);
}

.nav-btn.secondary:hover {
  background: #f8fafc;
}

.nav-btn.finish,
.nav-btn.success {
  background: var(--success);
  color: #ffffff;
}

.nav-btn.danger {
  background: var(--danger);
  color: #ffffff;
}

.exam-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 10px;
}

.exam-chip {
  background: #eff6ff;
  color: var(--primary);
  border: 1px solid #bfdbfe;
  padding: 8px 14px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.9rem;
}

.exam-chip:hover {
  background: var(--primary);
  color: #ffffff;
}

/* Fixed Top Progress Bar */
.top-progress-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 5px;
  background: #e2e8f0;
  z-index: 1000;
}

.top-progress-fill {
  height: 100%;
  width: 0%;
  background: var(--primary);
  transition: width 0.25s ease;
}

/* Sticky Section Header */
.sticky-exam-header {
  position: sticky;
  top: 5px;
  background: rgba(255, 255, 255, 0.96);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--border);
  padding: 10px 16px;
  z-index: 900;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
}

.header-top-row {
  display: flex;
  justify-content: space-between;
  font-size: 0.78rem;
  color: var(--text-muted);
  margin-bottom: 4px;
}

.header-main-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 12px;
}

.sticky-section-title {
  margin: 0;
  font-size: 1.05rem;
  font-weight: 700;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.section-dropdown {
  padding: 6px 10px;
  border-radius: 8px;
  border: 1px solid var(--border);
  background: var(--bg-page);
  font-size: 0.85rem;
  max-width: 185px;
}

/* Exam Content Stage */
.exam-stage {
  max-width: 820px;
  margin: 0 auto;
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.texts-grid,
.charts-grid,
.questions-list {
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.text-card-title {
  margin: 0 0 6px;
  font-size: 1.05rem;
}

.text-card-meta {
  font-size: 0.8rem;
  color: var(--text-muted);
  margin-bottom: 8px;
}

.text-card-body {
  white-space: pre-line;
}

.chart-wrapper {
  position: relative;
  height: 280px;
  width: 100%;
}

/* Questions & Options */
.question-header {
  display: flex;
  gap: 8px;
  font-weight: 600;
  margin-bottom: 12px;
}

.question-prompt {
  margin: 0;
}

.options-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.option-label {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px;
  border: 1px solid var(--border);
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.15s, border-color 0.15s;
}

.option-label:hover {
  background: #f8fafc;
}

.option-label.selected {
  background: #eff6ff;
  border-color: var(--primary);
  font-weight: 500;
}

.short-answer-input,
textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid var(--border);
  border-radius: 8px;
  font-size: 1rem;
  font-family: inherit;
}

/* Review & Summary */
.review-banner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  padding: 10px 14px;
  border-radius: 8px;
  font-weight: 600;
}

.review-correct {
  border-left: 4px solid var(--success);
}

.review-incorrect {
  border-left: 4px solid var(--danger);
}

.review-feedback {
  margin-top: 10px;
  padding-top: 8px;
  border-top: 1px dashed var(--border);
  font-size: 0.9rem;
}

.summary-hero {
  text-align: center;
  padding: 24px 16px;
}

.summary-hero.status-pass {
  border-top: 5px solid var(--success);
}

.summary-hero.status-fail {
  border-top: 5px solid var(--danger);
}

.total-score-display {
  font-size: 2.2rem;
  font-weight: 800;
  margin: 8px 0;
}

.summary-section-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 12px 16px;
  margin-bottom: 10px;
}

.summary-sec-info {
  display: flex;
  align-items: center;
  gap: 12px;
}

.summary-icon {
  font-size: 1.5rem;
}

.summary-actions {
  display: flex;
  justify-content: space-between;
  gap: 12px;
}

/* Writing Error Highlighting */
.highlighted-text-output {
  background: #f8fafc;
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 14px;
  line-height: 1.8;
  white-space: pre-wrap;
  margin-top: 12px;
}

.error-grammar {
  background-color: #fee2e2;
  border-bottom: 2px solid var(--danger);
  padding: 1px 2px;
  border-radius: 3px;
  cursor: help;
}

.error-spelling {
  background-color: #fef9c3;
  border-bottom: 2px solid #ca8a04;
  padding: 1px 2px;
  border-radius: 3px;
  cursor: help;
}

.error-punctuation {
  background-color: #e0f2fe;
  border-bottom: 2px solid var(--primary);
  padding: 1px 2px;
  border-radius: 3px;
  cursor: help;
}

.error-legend {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  margin-top: 12px;
  font-size: 0.85rem;
  color: var(--text-muted);
}

.legend-item {
  display: flex;
  align-items: center;
  gap: 6px;
}

.dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  display: inline-block;
}

.dot.grammar { background: var(--danger); }
.dot.spelling { background: #ca8a04; }
.dot.punctuation { background: var(--primary); }

.cefr-badge {
  background: var(--primary);
  color: #ffffff;
  padding: 3px 10px;
  border-radius: 6px;
  font-size: 0.95rem;
}

.error-card {
  background: #fef2f2;
  border: 1px solid #fecaca;
  color: #991b1b;
  padding: 12px 16px;
  border-radius: 8px;
}

/* Fixed Bottom Navigation */
.bottom-nav-bar {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background: var(--bg-card);
  border-top: 1px solid var(--border);
  padding: 10px 16px;
  display: flex;
  justify-content: space-between;
  gap: 8px;
  z-index: 950;
}

@media (max-width: 600px) {
  .exam-hub-card {
    flex-direction: column;
    align-items: flex-start;
  }
  .exam-hub-card .nav-btn {
    width: 100%;
  }
}
'@

Set-Content -Path "assets/css/style.css" -Value $cssContent -Encoding utf8
Write-Host "  [Fixed] assets/css/style.css" -ForegroundColor Green

# Helper function to generate clean hub HTML with the exact relative depth
function Write-ExamHub {
    param (
        [string]$FolderPath,
        [string]$RelativeRoot
    )
    $examId = Split-Path $FolderPath -Leaf
    $hubFile = Join-Path $FolderPath "index.html"

    $html = @"
<!DOCTYPE html>
<html lang='sv'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>SFI Delprov – $examId</title>
    <link rel='stylesheet' href='${RelativeRoot}assets/css/style.css'>
</head>
<body>
    <div class='app-container'>
        <header class='hero-header'>
            <a href='${RelativeRoot}index.html' class='nav-btn secondary' style='margin-bottom: 16px;'>← Tillbaka till översikten</a>
            <h1 style='margin: 0 0 6px 0; font-size: 1.8rem;'>Delprov: $examId</h1>
            <p style='color: var(--text-muted); margin: 0;'>Välj vilket delprov du vill träna på nedan.</p>
        </header>

        <main class='hub-grid'>
            <div class='content-card exam-hub-card'>
                <div>
                    <h3>📘 Läsförståelse (Reading)</h3>
                    <p>Sektioner A till H med flerval och korta svar.</p>
                </div>
                <a href='reading/index.html' class='nav-btn primary'>Starta Läsa</a>
            </div>

            <div class='content-card exam-hub-card'>
                <div>
                    <h3>🎧 Hörförståelse (Listening)</h3>
                    <p>Ljudfiler med max 2 spelningar och tillhörande frågor.</p>
                </div>
                <a href='listening/index.html' class='nav-btn primary'>Starta Lyssna</a>
            </div>

            <div class='content-card exam-hub-card'>
                <div>
                    <h3>✍️ Skriva (Writing)</h3>
                    <p>Skriv uppgift med LanguageTool felmarkering och CEFR-analys.</p>
                </div>
                <a href='writing/index.html' class='nav-btn primary'>Starta Skriva</a>
            </div>

            <div class='content-card exam-hub-card'>
                <div>
                    <h3>🗣️ Tala (Speaking)</h3>
                    <p>Interaktiva talövningar (Del 1 & Del 2) med timer och AI-stöd.</p>
                </div>
                <a href='speaking/index.html' class='nav-btn primary'>Starta Tala</a>
            </div>
        </main>
    </div>
</body>
</html>
"@
    Set-Content -Path $hubFile -Value $html -Encoding utf8
    Write-Host "  [Updated] $hubFile" -ForegroundColor Green
}

Write-Host "2. Updating hub pages in data/sfi/..." -ForegroundColor Cyan
if (Test-Path "data/sfi") {
    Get-ChildItem -Path "data/sfi" -Directory | ForEach-Object {
        Write-ExamHub -FolderPath $_.FullName -RelativeRoot "../../../"
    }
}

Write-Host "3. Updating legacy hub pages in years/ (if still open in browser)..." -ForegroundColor Cyan
if (Test-Path "years") {
    Get-ChildItem -Path "years" -Directory | ForEach-Object {
        Write-ExamHub -FolderPath $_.FullName -RelativeRoot "../../"
    }
}

Write-Host "=== Done! Press Ctrl+F5 in your browser to see the updated styles. ===" -ForegroundColor Cyan
