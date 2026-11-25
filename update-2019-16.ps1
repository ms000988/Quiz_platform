# update-2019-16.ps1 - Populates Reading, Writing, and Listening data for 2019-16

Write-Host "Populating Reading, Writing, and Listening data for 2019-16..." -ForegroundColor Cyan

$examDir = "data/sfi/2019-16"
$readingDir = Join-Path $examDir "reading"
$writingDir = Join-Path $examDir "writing"
$listeningDir = Join-Path $examDir "listening"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null
New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null

# ==========================================
# 1. READING CONFIG & SECTIONS (A - B)
# ==========================================

$configJson = @'
{
  "year": "2019-16",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt prov 16, 2019",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Uppgift 1 - En tidningsartikel: Livet som pappa (Muene)
$secA = @'
{
  "section": "A",
  "icon": "📰",
  "title": "Uppgift 1: Livet som pappa",
  "instructions": "Läs artikeln om Muene och lilla Nancy och svara på frågorna.",
  "texts": [
    {
      "heading": "Livet som pappa",
      "body": "Muene blev pappa för första gången för ett halvår sedan. Snart ska han vara föräldraledig med lilla Nancy.\n\nMuene är 31 år och bor utanför Stockholm. För några månader sedan föddes hans dotter. Muene och hans sambo hade inte planerat att få barn precis nu, men Nancy var en välkommen överraskning.\n\nJust nu är Muenes sambo hemma från jobbet och tar hand om Nancy på dagarna. Men Muene ska vara föräldraledig från april till januari nästa år.\n- Vi ska dela lika på ledigheten. Det är viktigt för oss att Nancy är lika trygg med mig som med sin mamma, säger han.\n\nHan umgås mycket med sin kusin som har flera barn. Kusinen är cool och lugn tillsammans med barnen. Det har hjälpt Muene till att inte oroa sig för allt.\n- Man behöver inte vara så hysteriskt noga. Det går bra ändå. Det är bra att vara lugn och inte bli tokig innerst inne om man är stressad, säger han.\n\nHan önskar förstås att Nancy får en god hälsa och hittar något i livet som hon verkligen tycker om att göra. Men Muene tycker också att det är viktigt att hon får uppleva lite svårigheter.\n- Livet är upp ibland och ner ibland. Man ska ha det lite tufft också, för man kan lära sig mycket av sina misstag."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Hur tycker Muene att det är att vara pappa?",
      "options": [
        "Det är svårt.",
        "Det är roligt.",
        "Det är stressigt."
      ],
      "answer": "Det är roligt."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vad har Muene lärt sig av sin kusin om livet?",
      "options": [
        "att be om hjälp",
        "att planera mycket",
        "att ta det lugnt"
      ],
      "answer": "att ta det lugnt"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vad berättar Muene om sin pappa? Att hans pappa ...",
      "options": [
        "ger tips om livet.",
        "har studerat mycket.",
        "är gammal men frisk."
      ],
      "answer": "ger tips om livet."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Varför vill Muene och hans sambo dela på föräldraledigheten?",
      "options": [
        "för att Muenes sambo har ett viktigt jobb",
        "för att båda ska ha bra kontakt med barnet",
        "för att Muene vill lära känna andra föräldrar"
      ],
      "answer": "för att båda ska ha bra kontakt med barnet"
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Vad tycker Muene är viktigt för Nancy? Att Nancy ...",
      "options": [
        "skaffar sig en utbildning och ett bra jobb",
        "möter både jobbiga och roliga saker i livet",
        "aldrig behöver vara olycklig eller ledsen"
      ],
      "answer": "möter både jobbiga och roliga saker i livet"
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Intervju med Frida om att öppna ett café
$secB = @'
{
  "section": "B",
  "icon": "☕",
  "title": "Uppgift B: Intervju med Frida (Café)",
  "instructions": "Läs svaren från intervjun med Frida som har öppnat ett café och välj rätt svar till varje fråga.",
  "texts": [
    {
      "heading": "Svar från intervjun med Frida",
      "body": "• Svar 1: Jag bodde i Malmö några år direkt efter gymnasiet och jobbade på kontor. Sen arbetade jag på olika caféer och restauranger, och där lärde jag mig att baka och brygga gott kaffe.\n\n• Svar 2: Det är inte bestämt än för jag vet inte när kunderna vill komma. Men i början är jag på plats hela dagarna så att folk kan komma från tidig morgon till sent på kvällen. Jag får se hur det blir sen.\n\n• Svar 3: För att jag har drömt om att ha ett eget café sedan jag var liten. Min pappa tog med mig till ett fint konditori när jag var fem år och jag minns att det var så mysigt.\n\n• Svar 4: Det var inte lätt, jag letade länge. Men en kväll gick jag förbi och såg att det var tomt. Det hade varit en affär här. Perfekt läge och hyran var låg så det var toppen!\n\n• Svar 5: Kaféet har blivit så väl mottagen här. Många kommer hit och fikar i lugnet och vi har redan haft ett födelsedagskalas här när en kille fyllde år och bjöd sina kompisar på tårta."
    }
  ],
  "questions": [
    {
      "id": "B_Q0",
      "type": "mcq",
      "prompt": "Exempel: Varför har du öppnat ett café?",
      "options": ["Svar 1", "Svar 2", "Svar 3", "Svar 4", "Svar 5"],
      "answer": "Svar 3"
    },
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Hur hittade du den här lokalen?",
      "options": ["Svar 1", "Svar 2", "Svar 3", "Svar 4", "Svar 5"],
      "answer": "Svar 4"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Vad säljer ni på caféet?",
      "options": ["Svar 1", "Svar 2", "Svar 3", "Svar 4", "Svar 5"],
      "answer": "Svar 5"
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Vilka tider ska caféet ha öppet?",
      "options": ["Svar 1", "Svar 2", "Svar 3", "Svar 4", "Svar 5"],
      "answer": "Svar 2"
    },
    {
      "id": "B_Q4",
      "type": "mcq",
      "prompt": "D. Vad har du jobbat med förut?",
      "options": ["Svar 1", "Svar 2", "Svar 3", "Svar 4", "Svar 5"],
      "answer": "Svar 1"
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# ==========================================
# 2. WRITING PROMPT (prompt.json)
# ==========================================

$writingPrompt = @'
{
  "examId": "2019-16",
  "title": "Skriv och berätta (Din fritid)",
  "promptHtml": "<p><strong>Du ska skriva en text om vad du gör på fritiden, när du är ledig.</strong></p><p style='margin-top: 12px;'><strong>Skriv och berätta om din fritid. Du ska berätta:</strong></p><ul><li>vad du gör när du är ledig,</li><li>vad du brukade göra på fritiden förut, innan du kom till Sverige,</li><li>vad du vill göra om du får mer ledig tid.</li></ul>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $writingPrompt -Encoding utf8

# ==========================================
# 3. LISTENING TASKS (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2019-16",
  "parts": [
    {
      "id": 3,
      "title": "Uppgift 3: Nyheter",
      "audio": "audio3.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A",
          "prompt": "A. Vad handlar nyheten om?",
          "options": ["bostad", "ekonomi", "trafik"],
          "answer": "bostad"
        },
        {
          "id": "L3_B",
          "prompt": "B. Vad handlar nyheten om?",
          "options": ["resor", "utbildning", "politik"],
          "answer": "utbildning"
        },
        {
          "id": "L3_C",
          "prompt": "C. Vad handlar nyheten om?",
          "options": ["bostad", "hälsa", "ekonomi"],
          "answer": "ekonomi"
        },
        {
          "id": "L3_D",
          "prompt": "D. Vad handlar nyheten om?",
          "options": ["miljö", "resor", "vård"],
          "answer": "miljö"
        },
        {
          "id": "L3_E",
          "prompt": "E. Vad handlar nyheten om?",
          "options": ["vård", "utbildning", "trafik"],
          "answer": "vård"
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Musik och fritid",
      "audio": "audio4.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_E",
          "prompt": "E. När lyssnar John på musik?",
          "options": ["när han tränar", "när han är i naturen", "när han jobbar"],
          "answer": "när han tränar"
        },
        {
          "id": "L4_F",
          "prompt": "F. När lyssnar Mary på musik?",
          "options": ["när hon jobbar", "när hon studerar", "när hon ska sova"],
          "answer": "när hon studerar"
        },
        {
          "id": "L4_G",
          "prompt": "G. När lyssnar Måns på musik?",
          "options": ["när han ska sova", "när han är på fest", "när han städar"],
          "answer": "när han städar"
        },
        {
          "id": "L4_H",
          "prompt": "H. När lyssnar Anna på musik?",
          "options": ["när hon ska sova", "när hon reser", "när hon studerar"],
          "answer": "när hon reser"
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

Write-Host "=== Successfully populated 2019-16 Reading, Writing, and Listening! ===" -ForegroundColor Cyan
