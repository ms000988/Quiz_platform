# update-2025-8.ps1 - Populates official reading data for exam session 2025-8

Write-Host "Populating reading data for 2025-8..." -ForegroundColor Cyan

$readingDir = "data/sfi/2025-8/reading"
if (!(Test-Path $readingDir)) {
    New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
}

# 1. Config.json
$configJson = @"
{
  "year": "2025-8",
  "module": "reading",
  "title": "SFI Läsförståelse – Exam 2025-8",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json", "H.json"]
}
"@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# 2. Section A (Uppgift 1: En intervju med Emil)
$secA = @"
{
  "section": "A",
  "icon": "🛒",
  "title": "En intervju",
  "instructions": "Läs frågorna och intervjun med Emil som arbetar i en mataffär. Välj det svar som passar bäst till varje fråga (1–5).",
  "texts": [
    {
      "heading": "Emil arbetar i en mataffär",
      "body": "Svarsalternativ:\n1. Det är bra om man har mycket tålamod och är snabb. Det hjälper också om man är social och så måste man vara trevlig mot kunderna såklart.\n2. - Jag tänker fortsätta jobba inom försäljning. Det skulle vara kul att få mer ansvar och leda en grupp eller att prova på andra yrken inom service.\n3. - På dagarna arbetar jag i kassan i en matbutik. Jag har jobbat här i snart fem år och jag trivs jättebra. När jag är ledig brukar jag umgås med min familj och vänner.\n4. Ibland, när vi har för lite personal. Då blir det långa köer till kassan och en del kunder blir arga och otrevliga mot mig. Man hinner inte heller ta rast. Det är jobbigt, men det händer inte så ofta.\n5. - Jag hade praktik här när jag gick på gymnasiet. Och efter studenten ringde chefen och frågade om jag ville komma tillbaka. Jag tackade ja för det är en bra arbetsplats."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Hur fick du ditt jobb?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vilka egenskaper är viktiga i ditt arbete?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. När kan det vara stressigt i ditt arbete?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad vill du göra i framtiden?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    }
  ]
}
"@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# 3. Section B (Uppgift 3: En dagbok - Leo)
$secB = @"
{
  "section": "B",
  "icon": "📔",
  "title": "En dagbok",
  "instructions": "Leo har semester. Han skriver i en dagbok om sin första semestervecka. Välj det ord som passar bäst i texten.",
  "texts": [
    {
      "heading": "måndag 2 juli",
      "body": "Idag började min semester. Min granne Amir ringde och frågade om jag ville se en film på tv tillsammans hos honom. Jag tackade ja. Filmen var inte så bra, men det var kul att [träffa] Amir i alla fall."
    },
    {
      "heading": "tisdag 3 juli",
      "body": "Vilken tråkig dag! Jag hade tänkt att ha picknick med mina vänner, men jag ändrade mig när jag tittade ut genom fönstret och såg att det blåste och regnade. Det är inget bra sommarväder i år! Jag är så [besviken]!"
    },
    {
      "heading": "onsdag 4 juli",
      "body": "Idag kom mamma och pappa på besök. Jag gjorde en fisksoppa. Det var första gången jag lagade den så jag var lite nervös, men mamma tyckte att den smakade bra. Hon ville till och med [ta] mer."
    },
    {
      "heading": "torsdag 5 juli",
      "body": "Imorgon flyger jag till Paris. Mitt flyg går redan klockan fem på morgonen och det går inga bussar till flygplatsen så tidigt. Så min kompis Jakob har sagt att han kan [köra] mig dit."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vilket ord passar bäst i måndagens text?",
      "options": ["hitta", "träffa", "visa"],
      "answer": "träffa"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Vilket ord passar bäst i tisdagens text?",
      "options": ["besviken", "nöjd", "lugn"],
      "answer": "besviken"
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Vilket ord passar bäst i onsdagens text?",
      "options": ["ta", "handla", "ge"],
      "answer": "ta"
    },
    {
      "id": "B_Q4",
      "type": "mcq",
      "prompt": "D. Vilket ord passar bäst i torsdagens text?",
      "options": ["anmäla", "flytta", "köra"],
      "answer": "köra"
    }
  ]
}
"@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# 4. Section C (Uppgift 4: Åsikter om ett bostadsområde)
$secC = @"
{
  "section": "C",
  "icon": "👨‍👩‍👧‍👦",
  "title": "Åsikter om ett bostadsområde",
  "instructions": "I en grupp på internet skriver några grannar om vad de vill ska bli bättre i området där de bor. Svara på frågorna genom att skriva personens namn.",
  "texts": [
    {
      "heading": "Daniel",
      "body": "Bostäderna på Granvägen är jättefina. Men nu har de byggt två nya hus och det är många som har flyttat in. Det börjar bli trångt på gatan och ibland vet jag inte var jag ska ställa min bil. Det är dags att bygga ett garage i närheten!"
    },
    {
      "heading": "Maja",
      "body": "Jag älskar att sitta ute i solen, men det är inte kul att se allt skräp på gräsmattan och på gården. Det skulle vara bra om hyresbolaget kunde tömma alla papperskorgar oftare och anställa personal som håller rent på marken i området."
    },
    {
      "heading": "Elias",
      "body": "Jag har bil men tycker att det är härligt att cykla till och från jobbet. Tidigare brukade jag alltid låsa min cykel utanför huset. Tyvärr har det blivit osäkert att lämna den där. Två gånger har någon tagit min cykel på natten. Hyresbolaget borde sätta upp en kamera!"
    },
    {
      "heading": "Hanna",
      "body": "Det är så grått och tråkigt här mellan husen. Jag tycker att hyresbolaget ska ställa dit några lådor med jord som vi alla kan plantera i. Det skulle vara trevligt med lite mer grönt. Luften blir friskare då också. Det är ju så mycket trafik här omkring."
    },
    {
      "heading": "Nasir",
      "body": "På vintern är det så mörkt ute när jag kommer hem från jobbet. Då måste man verkligen akta sig för bilarna så att man inte blir påkörd. Och en gång trampade jag i hundbajs precis framför dörren. Mer belysning på gatorna, tack! Så att man ser var man ska gå."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "short",
      "prompt": "A. Vem vill odla växter?",
      "answer": "Hanna",
      "acceptedAnswers": ["Hanna", "hanna"]
    },
    {
      "id": "C_Q2",
      "type": "short",
      "prompt": "B. Vem vill ha fler parkeringsplatser / ett garage?",
      "answer": "Daniel",
      "acceptedAnswers": ["Daniel", "daniel"]
    },
    {
      "id": "C_Q3",
      "type": "short",
      "prompt": "C. Vem vill ha fler lampor (belysning)?",
      "answer": "Nasir",
      "acceptedAnswers": ["Nasir", "nasir"]
    },
    {
      "id": "C_Q4",
      "type": "short",
      "prompt": "D. Vem vill ha bättre städning?",
      "answer": "Maja",
      "acceptedAnswers": ["Maja", "maja"]
    }
  ]
}
"@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# 5. Section D (Empty placeholder for diagrams or additional tasks)
$secD = @"
{
  "section": "D",
  "icon": "📊",
  "title": "Diagram",
  "instructions": "Studera diagrammen om det finns några i detta prov.",
  "texts": [],
  "charts": [],
  "questions": []
}
"@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# 6. Section E (Uppgift 2: Några personer berättar om sina jobb)
$secE = @"
{
  "section": "E",
  "icon": "🚗",
  "title": "Några personer berättar om sina jobb",
  "instructions": "Läs vad personerna säger och svara på frågorna.",
  "texts": [
    {
      "heading": "Elsa (Frisör)",
      "body": "Jag är frisör och för några år sedan öppnade jag en egen salong. Jag har bara två anställda och vi har många kunder så det kan vara lite stressigt. Men min salong har god ekonomi så jag har en ordentlig inkomst varje månad och det känns skönt!"
    },
    {
      "heading": "Sven (Bovärd)",
      "body": "Jag är bovärd på ett hyresbolag och tar emot anmälningar om fel och löser problem i våra bostäder. Det kan till exempel vara ett trasigt kylskåp eller ett lås som ska bytas. Jag gillar att det är så olika saker att göra varje dag, så det är aldrig tråkigt på jobbet."
    },
    {
      "heading": "Alexandra (Möbelaffär)",
      "body": "Jag jobbar i en möbelaffär och hjälper kunder att hitta möbler till sina bostäder. Jag skulle vilja tjäna mer, men pengar är inte allt. Det är viktigare att man trivs med dem man jobbar med. Och det gör jag verkligen. Vi har alltid så trevligt i personalrummet."
    },
    {
      "heading": "Bartek / Yumi / Massoud",
      "body": "Yumi: Jag talar flera språk. Förra året blev jag kontaktad av en kvinna som ville anställa mig som tolk på sitt företag och jag tackade ja. Det är så roligt att få jobba med språk varje dag och hjälpa kunder med översättningar.\nMassoud: Jag studerar till tandläkare och har ett extra arbete. Jag kör taxi. Det passar mig för jag kan välja själv när och hur mycket jag ska arbeta. Perfekt, för då kan jag kombinera utbildningen med arbetet."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vad tycker Elsa är bra med jobbet?",
      "options": ["lönen", "arbetstiderna", "kollegorna"],
      "answer": "lönen"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vad tycker Sven är bra med jobbet?",
      "options": ["arbetstiderna", "arbetsuppgifterna", "lokalerna"],
      "answer": "arbetsuppgifterna"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Alexandra är bra med jobbet?",
      "options": ["lönen", "kollegorna", "lokalerna"],
      "answer": "kollegorna"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Yumi är bra med jobbet?",
      "options": ["lokalerna", "arbetstiderna", "arbetsuppgifterna"],
      "answer": "arbetsuppgifterna"
    },
    {
      "id": "E_Q5",
      "type": "mcq",
      "prompt": "E. Vad tycker Massoud är bra med jobbet?",
      "options": ["lönen", "arbetstiderna", "arbetsuppgifterna"],
      "answer": "arbetstiderna"
    }
  ]
}
"@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# 7. Section F (Tidningsartikel: Ett oväntat möte - Irma och Nelly)
$secF = @"
{
  "section": "F",
  "icon": "🍦",
  "title": "Ett oväntat möte",
  "instructions": "Läs tidningsartikeln om Irina Larssen och Nelly Reganski och svara på frågorna.",
  "texts": [
    {
      "heading": "Ett oväntat möte",
      "body": "Irina Larssen och Nelly Reganski är bästa vänner. Deras vänskap började på ett lite ovanligt sätt.\nIrma berättar att det var en vinterkväll i december. Hon var på väg till Stockholm och hade fått ett erbjudande om ett jobb på ett sjukhus där. Hon ville fira det med sina föräldrar. Därför var hon på väg från Stockholm till Hälledal, en liten ort i norra Sverige, där de bor.\n- Jag var glad men jättetrött efter en intensiv dag. Dessutom var jag lite nervös för jag hade hört på radio att det kunde bli snökaos och problem med trafiken, berättar Irma.\nHon somnade på bussen och när hon vaknade mitt i natten hade den stannat på slutstationen. De hade åkt förbi Hälledal, där hon skulle stiga av.\n- Där stod jag helt ensam i minus 15 graders kyla och visste inte hur jag skulle komma till Hälledal, säger Irma.\nMen då stannade en bil på vägen framför henne. En helt okänd tjej, Nelly, öppnade dörren. Hon frågade om Irma behövde skjuts. Sedan körde hon Irma hela vägen till Hälledal. Det var så de träffades och blev vänner. Nelly berättade att hon också bodde i Stockholm, men att hon skulle gå på ett bröllop i närheten av Hälledal dagen efter.\nIrma och Nelly började umgås när de kom tillbaka till Stockholm. De brukar ses flera gånger i veckan. Nelly undervisar i sång och dans på ett gymnasium som ligger alldeles bredvid sjukhuset där Irma arbetar. Så ibland ses de och äter lunch på en pizzeria runt hörnet. Men oftast möts de på gymmet eller springer en runda efter jobbet.\n- Vi båda är ganska aktiva personer och älskar att röra på oss, berättar Irma.\nJust nu längtar de till semestern. Nelly fyller 25 år i juli och Irma har redan köpt en födelsedagspresent – tågbiljetter till Tyskland. De har planerat att resa tillsammans då.\n- Det ska bli jättekul att göra det ihop med Nelly, för jag har aldrig haft en så bra vän som hon. Jag är väldigt tacksam för den där bussresan som gjorde att vi möttes. Det var verkligen tur i oturen, avslutar Irma."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Vad skulle Irma göra i Hälledal?",
      "options": ["träffa familjen", "arbeta", "studera"],
      "answer": "träffa familjen"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vad hände på resan till Hälledal?",
      "options": ["Irma blev sjuk.", "Irma tog fel buss.", "Irma missade sin hållplats."],
      "answer": "Irma missade sin hållplats."
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Hur blev Irma och Nelly vänner?",
      "options": ["Nelly hjälpte Irma.", "Nelly och Irma träffades på en fest.", "Nelly och Irma åkte samma buss."],
      "answer": "Nelly hjälpte Irma."
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vad brukar Irma och Nelly göra tillsammans?",
      "options": ["laga mat", "träna", "lyssna på musik"],
      "answer": "träna"
    },
    {
      "id": "F_Q5",
      "type": "mcq",
      "prompt": "E. Vad ska de göra i sommar?",
      "options": ["ha en stor fest", "åka utomlands", "flytta till en annan stad"],
      "answer": "åka utomlands"
    }
  ]
}
"@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# 8. Sections G & H (Placeholders if needed)
$secG = @'
{
  "section": "G",
  "icon": "📱",
  "title": "Sociala medier",
  "instructions": "Läs inläggen och svara på frågorna.",
  "texts": [],
  "questions": []
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

$secH = @'
{
  "section": "H",
  "icon": "🏛️",
  "title": "Information",
  "instructions": "Läs informationen och svara på frågorna.",
  "texts": [],
  "questions": []
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

Write-Host "=== Successfully populated reading JSON files for 2025-8! ===" -ForegroundColor Cyan
