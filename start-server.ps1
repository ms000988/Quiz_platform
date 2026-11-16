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
