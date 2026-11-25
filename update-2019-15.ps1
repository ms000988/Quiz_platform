# update-2019-15.ps1 - Populates Reading, Writing, and Listening data for 2019-15

Write-Host "Populating Reading, Writing, and Listening data for 2019-15..." -ForegroundColor Cyan

$examDir = "data/sfi/2019-15"
$readingDir = Join-Path $examDir "reading"
$writingDir = Join-Path $examDir "writing"
$listeningDir = Join-Path $examDir "listening"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null
New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null

# ==========================================
# 1. READING CONFIG & SECTIONS (A - D)
# ==========================================

$configJson = @'
{
  "year": "2019-15",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt prov 15, 2019",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Uppgift 1 - En tidningsartikel: Nathanel tog med sig mormor på resa
$secA = @'
{
  "section": "A",
  "icon": "✈️",
  "title": "Uppgift 1: Nathanel tog med sig mormor på resa",
  "instructions": "Läs artikeln om Nathanel och hans mormor Edna och svara på frågorna.",
  "texts": [
    {
      "heading": "Nathanel tog med sig mormor på resa",
      "body": "Nathanel och hans mormor bor på olika ställen i världen men nu har de haft mycket tid tillsammans. De har just kommit hem från en lång resa.\n\nNathanel är 26 år och kommer från Göteborg. De senaste sju åren har han rest mycket själv och studerat på olika platser i Europa. Senast bodde han i Barcelona.\n\nNär Nathanel bodde i Barcelona kom hans mormor Edna och besökte honom. De gick långa promenader och pratade. Då märkte Nathanel att han hade många frågor som han ville få svar på. Han undrade till exempel hur hans mormor och morfar hade träffats och hur hans mamma var som barn.\n\nDärför började Nathanel fundera på att göra en resa med sin mormor. På en resa skulle de få tid att umgås och han skulle få svar på sina frågor.\n\nNathanel ville åka iväg så fort som möjligt. Han tänkte på att mormor var gammal och kanske inte skulle orka resa i många år till.\n- Jag kände att det var 'nu eller aldrig', säger Nathanel.\n\nFöre resan diskuterade de vart de ville åka. De bestämde sig för Asien och vilka länder de ville besöka där. Men de bestämde inte exakt vilka städer de ville se. När de kom till en ny stad försökte de få kontakt med människor som bodde där. Av dem fick de tips om roliga saker att göra.\n\nDe sov oftast på hotell eller vandrarhem. Men båda var intresserade av att möta nya människor, så om de fick chansen att sova i någons vardagsrum så tackade de gärna ja.\n\nNathanel berättar att resan var olik hans tidigare resor med kompisar. Han och mormor hade ett långsamt tempo. På dagarna besökte de marknader, satt en stund i någon park och promenerade i naturen. På kvällarna brukade de läsa eller titta på något tv-program och lägga sig tidigt.\n\nNathanel tycker att unga kan lära sig mycket av hur äldre personer tänker, men också tvärtom. Därför vill han inspirera andra att resa med en äldre släkting.\n- Den här resan har varit vårt livs äventyr, avslutar han."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Varför ville Nathanel resa med sin mormor? Han ville veta mer om ...",
      "options": [
        "mormors hemland.",
        "sin familj.",
        "andra länder."
      ],
      "answer": "sin familj."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Varför ville Nathanel göra resan just då?",
      "options": [
        "för att han hittade billiga flygbiljetter",
        "för att fira mormors födelsedag",
        "för att mormor fortfarande var frisk"
      ],
      "answer": "för att mormor fortfarande var frisk"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Hur planerade de resan innan de åkte?",
      "options": [
        "De bestämde bara vilka länder de skulle åka till.",
        "De kontaktade vänner för att få bo hos dem.",
        "De bokade hotell och vandrarhem i alla städer."
      ],
      "answer": "De bestämde bara vilka länder de skulle åka till."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad berättar Nathanel om resan?",
      "options": [
        "att han saknade sina vänner",
        "att mormor var trött hela tiden",
        "att han och mormor tog det lugnt"
      ],
      "answer": "att han och mormor tog det lugnt"
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Varför tycker Nathanel att fler unga och gamla ska resa tillsammans? För att lära sig ...",
      "options": [
        "att lösa problem.",
        "att förstå varandra.",
        "att sluta stressa."
      ],
      "answer": "att förstå varandra."
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Uppgift 2 - Ett diagram (Aktiviteter som elever i olika årskurser gick på 2017)
$secB = @'
{
  "section": "B",
  "icon": "📊",
  "title": "Uppgift 2: Ett diagram (Aktiviteter 2017)",
  "instructions": "Studera diagrammet som visar några aktiviteter som elever i olika årskurser gick på år 2017 och svara på frågorna.",
  "texts": [
    {
      "heading": "Information om diagrammet",
      "body": "Diagrammet visar hur stor andel (i procent) av elever i årskurs 5, årskurs 8 och gymnasiets årskurs 2 som gick på olika kulturaktiviteter under sex månader år 2017.\nKälla: Myndigheten för kulturanalys."
    }
  ],
  "charts": [
    {
      "id": "chartActivities2017",
      "type": "bar",
      "title": "Aktiviteter som elever i olika årskurser gick på 2017",
      "labels": ["Bio", "Dansföreställning", "Konsert", "Konstutställning", "Museum"],
      "datasets": [
        {
          "label": "Elever i årskurs 5",
          "data": [86, 37, 31, 32, 48],
          "backgroundColor": "#0284c7"
        },
        {
          "label": "Elever i årskurs 8",
          "data": [81, 27, 29, 30, 34],
          "backgroundColor": "#1e293b"
        },
        {
          "label": "Elever i gymnasiets årskurs 2",
          "data": [81, 21, 33, 28, 31],
          "backgroundColor": "#eab308"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "short",
      "prompt": "A. Hur många procent av eleverna i årskurs 8 gick på konsert?",
      "answer": "29%",
      "acceptedAnswers": ["29%", "29", "28%", "28", "30%", "30"]
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. I vilken årskurs var andelen elever som gick på museum störst?",
      "options": [
        "årskurs 5",
        "årskurs 8",
        "gymnasiet årskurs 2"
      ],
      "answer": "årskurs 5"
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Uppgift 3 - En intervju med Omar som arbetar som tolk
$secC = @'
{
  "section": "C",
  "icon": "🗣️",
  "title": "Uppgift 3: En intervju med Omar (Tolk)",
  "instructions": "Läs frågorna och välj bland svaren (1–6) från intervjun med tolk Omar. Skriv siffran för rätt svar.",
  "texts": [
    {
      "heading": "Svar från intervjun (1–6)",
      "body": "1. Det varierar, men ofta gör man först språktest i båda språken och efter det studerar man cirka ett år på högskola. Sedan kan man fortsätta med flera kurser.\n\n2. Man får arbeta kvällar och helger ibland. Och när man har hjälpt en person som är i en jobbig situation kan det vara svårt att koppla av och tänka på något annat när man kommer hem från arbetet.\n\n3. En tolk är en person som hjälper människor att förstå varandra fast de talar olika språk.\n\n4. Jag har alltid varit intresserad av språk och jag ville ha ett jobb där man har mycket kontakt med människor. Jag ville också känna att jag gör något som är viktigt för andra.\n\n5. En tolk måste vara lugn och pålitlig. Men också neutral och bra på att lyssna. Och man måste vara social och öppen.\n\n6. Jag hjälper personer som är nya i Sverige i kontakt med myndigheter. Jag tolkar på sjukhus, socialkontor och i möten med advokat. Ibland tolkar jag via telefon eller video-chatt."
    }
  ],
  "questions": [
    {
      "id": "C_Q0",
      "type": "mcq",
      "prompt": "Exempel: Vad är en tolk?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Varför bestämde du dig för att bli tolk?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Vad gör du på jobbet?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Vilka egenskaper är viktiga hos en tolk?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Hur utbildar man sig till tolk?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    }
  ]
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Uppgift 5 - Tankar om att umgås
$secD = @'
{
  "section": "D",
  "icon": "🤝",
  "title": "Uppgift 5: Tankar om att umgås",
  "instructions": "Några personer berättar på en webbsida om hur de umgås med vänner. Svara på frågorna genom att skriva personens namn.\n\nPersoner: Fartun, Anton, Isabel, Hamid, Emil",
  "texts": [
    {
      "heading": "Fartun",
      "body": "Jag har en stor familj och barnen har alltid massor av saker som de ska göra när vi är lediga så jag hinner sällan träffa mina vänner så ofta som jag skulle vilja."
    },
    {
      "heading": "Anton",
      "body": "Det är så skönt att alltid kunna ringa en vän när man har något problem. Som förra månaden, då lagade en kompis min bil när den gick sönder. Mina vänner finns alltid där för mig."
    },
    {
      "heading": "Isabel",
      "body": "Vi är ett stort gäng från min gamla klass som träffas en gång i månaden. Då går vi på någon klubb eller på bio eller spelar spel. Det är så kul att göra roliga saker tillsammans."
    },
    {
      "heading": "Hamid",
      "body": "Jag är en nyfiken person som gärna pratar med alla jag möter. Att gå på en fest där jag inte känner så många är toppen. Det är alltid så spännande med folk som man inte vet något om."
    },
    {
      "heading": "Emil",
      "body": "Jag har flera trevliga arbetskamrater och är faktiskt väldigt social på jobbet. Men när jag är ledig stannar jag helst hemma och tar det lugnt eller promenerar själv i skogen."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "short",
      "prompt": "A. Vem älskar att träffa nya människor?",
      "answer": "Hamid",
      "acceptedAnswers": ["Hamid", "hamid"]
    },
    {
      "id": "D_Q2",
      "type": "short",
      "prompt": "B. Vem trivs med att vara ensam?",
      "answer": "Emil",
      "acceptedAnswers": ["Emil", "emil"]
    },
    {
      "id": "D_Q3",
      "type": "short",
      "prompt": "C. Vem har inte så mycket tid för sina vänner?",
      "answer": "Fartun",
      "acceptedAnswers": ["Fartun", "fartun"]
    },
    {
      "id": "D_Q4",
      "type": "short",
      "prompt": "D. Vem får mycket hjälp av sina vänner?",
      "answer": "Anton",
      "acceptedAnswers": ["Anton", "anton"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# ==========================================
# 2. WRITING PROMPT (prompt.json)
# ==========================================

$writingPrompt = @'
{
  "examId": "2019-15",
  "title": "Skriva 2019, 15/16 – Att lära sig svenska",
  "promptHtml": "<p><strong>Skriv en text om att lära dig svenska.</strong></p><p style='margin-top: 12px;'><strong>Du ska berätta om:</strong></p><ul><li>varför du vill lära dig svenska,</li><li>vad du gör för att lära dig svenska,</li><li>vad du tycker är lätt eller svårt,</li><li>hur andra människor kan hjälpa dig att bli bättre på svenska.</li></ul>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $writingPrompt -Encoding utf8

# ==========================================
# 3. LISTENING TASKS (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2019-15",
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
          "options": ["vård", "utbildning"],
          "answer": "vård"
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

Write-Host "=== Successfully populated 2019-15 Reading, Writing, and Listening! ===" -ForegroundColor Cyan
