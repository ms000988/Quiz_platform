# update-2022-3-writing.ps1 - Populates official Writing prompt for exam session 2022-3

Write-Host "Populating Writing prompt for 2022-3..." -ForegroundColor Cyan

$writingDir = "data/sfi/2022-3/writing"
if (!(Test-Path $writingDir)) {
    New-Item -ItemType Directory -Path $writingDir -Force | Out-Null
}

$promptJson = @'
{
  "examId": "2022-3",
  "title": "Svara på ett mejl (Pension)",
  "promptHtml": "<p><strong>Du har fått ett mejl från en vän som ska sluta jobba och bli pensionär. Läs mejlet och skriv ett svar.</strong></p><div style='background: var(--bg-page); padding: 16px; border-radius: 8px; border: 1px solid var(--border); margin: 12px 0;'><p><strong>Hej!</strong></p><p>Allt bra med dig?</p><p>Nästa månad blir jag 65 år och då ska jag sluta jobba. Jag blir äntligen pensionär! Det ska bli skönt men jag får så mycket ledig tid. Har du några bra tips på vad jag kan göra på dagarna?</p><p>Min chef vill att jag jobbar extra ibland när någon blir sjuk. Jag vet inte om jag vill det. Hur tycker du att jag ska göra?</p><p>Jag vill gärna träffa dig snart. När har du tid? Var ska vi ses?</p><p>Hör av dig!</p></div><p style='margin-top: 16px;'><strong>Svara på mejlet och:</strong></p><ul><li>ge tips på vad din vän kan göra på dagarna,</li><li>berätta om du tycker att din vän ska jobba extra eller inte, och varför du tycker det,</li><li>ge förslag på en tid och plats där ni kan träffas.</li></ul><p style='margin-top: 8px; color: var(--text-muted); font-size: 0.9rem;'>Tänk på hur du börjar och avslutar mejlet.</p>",
  "minWords": 80
}
'@

Set-Content -Path "$writingDir/prompt.json" -Value $promptJson -Encoding utf8
Write-Host "=== Successfully populated 2022-3 Writing prompt! ===" -ForegroundColor Cyan
