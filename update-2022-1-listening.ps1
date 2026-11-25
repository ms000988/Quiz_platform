# update-2022-1-listening.ps1 - Populates Listening data for 2022-1

Write-Host "Populating Listening data for 2022-1..." -ForegroundColor Cyan

$listeningDir = "data/sfi/2022-1/listening"
if (!(Test-Path $listeningDir)) {
    New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
}

$listeningJson = @'
{
  "examId": "2022-1",
  "parts": [
    {
      "id": 2,
      "title": "Uppgift 2: Ett samtal på jobbet",
      "audio": "audio2.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. Vem vill byta jobb?",
          "options": ["mannen", "kvinnan", "både mannen och kvinnan"],
          "answer": "mannen"
        },
        {
          "id": "L2_B",
          "prompt": "B. Varför är mannen trött?",
          "options": [
            "Han hade svårt att somna igår.",
            "Han vaknade tidigt idag.",
            "Han såg på film hela natten."
          ],
          "answer": "Han såg på film hela natten."
        },
        {
          "id": "L2_C",
          "prompt": "C. Vad ska mannen göra i helgen?",
          "options": ["träna", "gå på fest", "ta det lugnt"],
          "answer": "ta det lugnt"
        },
        {
          "id": "L2_D",
          "prompt": "D. Varför ska kvinnan vara ledig nästa vecka?",
          "options": [
            "Hon ska flytta.",
            "Hon ska gå på kurs.",
            "Hon ska hjälpa en släkting."
          ],
          "answer": "Hon ska hjälpa en släkting."
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Personalmöte på en arbetsplats",
      "audio": "audio5.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. Var ska företagets personal parkera på sommaren?",
          "options": ["på gatan", "i garaget", "vid skolan"],
          "answer": "på gatan"
        },
        {
          "id": "L5_B",
          "prompt": "B. Vad ska Olle göra i höst?",
          "options": ["studera", "börja jobba", "vara föräldraledig"],
          "answer": "studera"
        },
        {
          "id": "L5_C",
          "prompt": "C. Var ska festen vara?",
          "options": ["på en restaurang", "vid en badplats", "i personalrummet"],
          "answer": "vid en badplats"
        }
      ]
    }
  ]
}
'@

Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8
Write-Host "=== Successfully populated 2022-1 Listening module! ===" -ForegroundColor Cyan
