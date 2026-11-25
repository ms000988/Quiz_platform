# update-2020-18.ps1 - Populates Writing prompt plus practice Reading and Listening tasks for 2020-18

Write-Host "Populating Writing, Reading, and Listening data for 2020-18..." -ForegroundColor Cyan

$examDir = "data/sfi/2020-18"
$readingDir = Join-Path $examDir "reading"
$listeningDir = Join-Path $examDir "listening"
$writingDir = Join-Path $examDir "writing"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null

# ==========================================
# 1. WRITING PROMPT (prompt.json)
# ==========================================

$writingPrompt = @'
{
  "examId": "2020-18",
  "title": "Svara på ett mejl (Stress och studier)",
  "promptHtml": "<p><strong>Du har fått ett mejl från en vän. Läs mejlet och skriv ett svar.</strong></p><div style='background: var(--bg-page); padding: 16px; border-radius: 8px; border: 1px solid var(--border); margin: 12px 0;'><p style='color: var(--text-muted); font-size: 0.9rem;'>Från: vännen</p><p><strong>Hej!</strong></p><p>Hur är det med dig och hur går det på sfi?</p><p>Jag har så mycket att göra både hemma och med mina studier, så jag är lite stressad. Har du några tips på vad jag kan göra för att må bättre?</p><p>Har du tid att ses snart? Och har du förslag på något som vi kan göra då?</p><p>Kram 😊</p></div><p style='margin-top: 16px;'><strong>Svara på mejlet. Du ska:</strong></p><ul><li>berätta kort om hur du har det och hur det går på sfi,</li><li>ge tips på vad din vän kan göra för att må bättre,</li><li>berätta när du kan ses och vad ni kan göra då.</li></ul><p style='margin-top: 8px; color: var(--text-muted); font-size: 0.9rem;'>Tänk på hur du inleder och avslutar mejlet.</p>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $writingPrompt -Encoding utf8

# ==========================================
# 2. READING CONFIG & SECTIONS (A - B)
# ==========================================

$configJson = @'
{
  "year": "2020-18",
  "module": "reading",
  "title": "SFI Läsförståelse – Övning 2020-18",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

$secA = @'
{
  "section": "A",
  "icon": "🌿",
  "title": "Uppgift A: Råd mot stress i vardagen",
  "instructions": "Läs texten om hur man kan hantera stress när man pluggar och har mycket hemma, och svara på frågorna.",
  "texts": [
    {
      "heading": "Ta pauser och planera i lugn takt",
      "body": "När man både studerar svenska och har ansvar hemma kan det lätt kännas som att tiden inte räcker till. Ett vanligt misstag är att försöka göra allt på en gång. Många lärare tipsar om att dela upp uppgifterna i mindre delar och bestämma en tydlig tid för när man stänger böckerna för dagen.\n\nKorta pauser utomhus, en promenad i parken eller att prata med en vän gör det lättare att rensa tankarna. Att sova tillräckligt och äta regelbundet hjälper också kroppen och hjärnan att orka bättre."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Vad är ett vanligt misstag när man har mycket att göra enligt texten?",
      "options": [
        "Att försöka göra allt på en gång.",
        "Att gå en promenad utomhus.",
        "Att sova för länge på natten."
      ],
      "answer": "Att försöka göra allt på en gång."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vad rekommenderas för att rensa tankarna?",
      "options": [
        "Att plugga utan rast hela kvällen.",
        "Att ta korta pauser utomhus eller prata med en vän.",
        "Att hoppa över måltiderna."
      ],
      "answer": "Att ta korta pauser utomhus eller prata med en vän."
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Varför är det bra att bestämma när man stänger böckerna?",
      "options": [
        "Det hjälper en att få vila och sätta gränser för studierna.",
        "Det gör att man slipper skriva prov.",
        "Det ersätter all sömn."
      ],
      "answer": "Det hjälper en att få vila och sätta gränser för studierna."
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

$secB = @'
{
  "section": "B",
  "icon": "💬",
  "title": "Uppgift B: Tips från kurskamrater på sfi",
  "instructions": "Läs vad några studerande skriver i en chattgrupp och svara på frågorna.",
  "texts": [
    {
      "heading": "Chatt: Studier och fritid",
      "body": "• Nora: Jag pluggar glosor i tjugo minuter på morgonen och sedan tar jag en kopp kaffe innan jag börjar städa hemma.\n\n• Tariq: När jag känner mig stressad brukar jag bjuda en kompis på fika på ett kafé. Då tänker jag på annat en stund.\n\n• Malin: Jag skriver en kort lista på tre saker jag ska göra idag. Om jag inte hinner allt flyttar jag resten till i morgon."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "short",
      "prompt": "A. Vem brukar bjuda en kompis på fika när det känns stressigt? (Skriv namn)",
      "answer": "Tariq",
      "acceptedAnswers": ["Tariq", "tariq"]
    },
    {
      "id": "B_Q2",
      "type": "short",
      "prompt": "B. Vem skriver en lista med tre saker per dag? (Skriv namn)",
      "answer": "Malin",
      "acceptedAnswers": ["Malin", "malin"]
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Vad gör Nora på morgonen?",
      "options": [
        "Hon pluggar glosor i tjugo minuter.",
        "Hon går till gymmet i två timmar.",
        "Hon åker tåg till en annan stad."
      ],
      "answer": "Hon pluggar glosor i tjugo minuter."
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# ==========================================
# 3. LISTENING TASKS (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2020-18",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Samtal om sfi och stress",
      "audio": "audio1.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Varför känner sig personen stressad?",
          "options": [
            "Mycket att göra hemma och med studierna.",
            "Bussen blev inställd på morgonen.",
            "Skolan har stängt i en månad."
          ],
          "answer": "Mycket att göra hemma och med studierna."
        },
        {
          "id": "L1_B",
          "prompt": "B. Vilket tips ger vännen för att må bättre?",
          "options": [
            "Att ta en promenad och vila lite.",
            "Att sluta gå på lektionerna.",
            "Att dricka fem koppar kaffe på kvällen."
          ],
          "answer": "Att ta en promenad och vila lite."
        },
        {
          "id": "L1_C",
          "prompt": "C. Vad föreslår de att göra när de ses?",
          "options": [
            "Ta en fika och prata en stund.",
            "Skriva ett långt prov tillsammans.",
            "Flytta till en ny lägenhet."
          ],
          "answer": "Ta en fika och prata en stund."
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Planera en träff",
      "audio": "audio2.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. När passar det bäst för dem att träffas?",
          "options": [
            "På lördag eftermiddag.",
            "Mitt i natten.",
            "Om ett helt år."
          ],
          "answer": "På lördag eftermiddag."
        },
        {
          "id": "L2_B",
          "prompt": "B. Hur går det på sfi enligt samtalet?",
          "options": [
            "Det går ganska bra och känns roligare nu.",
            "Det finns inga böcker alls.",
            "De har redan slutat kursen."
          ],
          "answer": "Det går ganska bra och känns roligare nu."
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

Write-Host "=== Successfully populated 2020-18 Writing, Reading, and Listening! ===" -ForegroundColor Cyan
