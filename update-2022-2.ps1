# update-2022-2.ps1 - Populates official Reading (A-E) and Writing data for exam session 2022-2

Write-Host "Populating Reading and Writing data for 2022-2..." -ForegroundColor Cyan

$examDir = "data/sfi/2022-2"
$readingDir = Join-Path $examDir "reading"
$writingDir = Join-Path $examDir "writing"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null

# ==========================================
# 1. READING CONFIG & SECTIONS (A - E)
# ==========================================

$configJson = @'
{
  "year": "2022-2",
  "module": "reading",
  "title": "SFI Läsförståelse – Exam 2022-2",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Uppgift 1 - Mejlet om kusinträffen
$secA = @'
{
  "section": "A",
  "icon": "✉️",
  "title": "Uppgift 1: Kusinträffen",
  "instructions": "Läs mejlet från Ella till Martin och svara på frågorna.",
  "texts": [
    {
      "heading": "Mejlet: Kusinträffen",
      "body": "Till: Martin\nÄmne: Kusinträffen\n\nHej Martin!\n\nVad kul att du tackade ja till kusinträffen! Det blir nio kusiner och alla tar med sina familjer. Så roligt! Vi hörs inte så ofta men vi har ju bra koll på varandra och vad alla gör tack vare vår facebookgrupp, eller hur? Jag älskar allas bilder och kommentarer!\n\nSom du vet har vi flyttat till en större villa men vi håller på att renovera den just nu. Det finns visserligen gott om plats att duka för alla på uteplatsen och gräsmattan men man kan ju aldrig lita på att vädret blir bra. Men en vän tipsade oss om ett bra ställe som han hade hyrt förra året. Det ligger jättevackert precis vid en liten sjö, så vi bestämde oss för det. Vi har beställt en buffé med både kött, fisk och vegetariskt för att maten ska passa alla.\n\nSen har jag tagit fram mina gamla bilder och videofilmer som vi kan titta på efter middagen. Som du vet hade jag kameran med mig överallt även förr, precis som nu! Jag ser också fram emot att höra sången som du har skrivit om oss alla!\n\nVi ses snart!\nElla"
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Vad berättar Ella om sina kusiner?",
      "options": [
        "De brukar besöka varandra.",
        "De brukar ringa varandra.",
        "De brukar ha kontakt på nätet."
      ],
      "answer": "De brukar ha kontakt på nätet."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Var ska kusinträffen vara?",
      "options": [
        "i Ellas hus",
        "i trädgården",
        "i en festlokal"
      ],
      "answer": "i en festlokal"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Ella om att göra?",
      "options": [
        "fotografera",
        "laga mat",
        "sjunga"
      ],
      "answer": "fotografera"
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Varför skriver Ella till Martin? Hon vill ...",
      "options": [
        "få hjälp av Martin på kusinträffen.",
        "ge Martin information om kusinträffen.",
        "veta om Martin kan komma på kusinträffen."
      ],
      "answer": "ge Martin information om kusinträffen."
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Uppgift 2 - Information om att hyra stuga
$secB = @'
{
  "section": "B",
  "icon": "🏡",
  "title": "Uppgift 2: Information om att hyra stuga",
  "instructions": "Här får du läsa information om vad som gäller när man vill hyra en stuga på semestern. Läs frågorna och välj rätt siffra (1–6).",
  "texts": [
    {
      "heading": "Hyr stuga hos oss (https://www.stugsemester.univ.nu)",
      "body": "1. Om du planerar att semestra i Sverige i år har du kommit rätt. Vi förmedlar stugor i hela landet – i alla storlekar och prisklasser. Vi gör vårt bästa för att du ska bli nöjd med den stuga som du väljer och är flexibla om du får ändrade planer.\n\n2. Alla våra stugor är rökfria. Läs information vid varje objekt om husdjur är tillåtna. Om någon sak i stugan går sönder är du skyldig att ersätta ägaren. Skulle du få något problem med vatten, avlopp eller el under din vistelse ringer du vår jourtelefon.\n\n3. Sök efter en passande stuga här på vår webbsida och reservera den som du är intresserad av. Du är också välkommen att kontakta vår kundservice på vardagar klockan 9–15 så hjälper vi dig att få en stuga som du är nöjd med.\n\n4. Vårt Trygghetspaket ingår alltid i priset. Med detta skydd får du pengarna tillbaka om din semesterresa blir inställd på grund av sjukdom. Du kan också byta till en annan stuga eller annat datum utan kostnad.\n\n5. När du har bestämt dig för vilken stuga du vill ha, får du en personlig sida på internet, som vi kallar 'Min sida'. Där kan du lägga in ditt kortnummer om du vill att avgiften ska dras direkt. Du kan också välja att få en pappersfaktura.\n\n6. Det väljer du själv. Om du vill hålla nere kostnaden gör du rent stugan på egen hand. Om du i stället vill köpa den tjänsten ordnar vi det. Det brukar kosta cirka 700–1000 kronor för rengöring av en normalstor stuga."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Hur bokar jag en stuga?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Hur betalar jag för stugan?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Måste jag betala extra för städning?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "B_Q4",
      "type": "mcq",
      "prompt": "D. Vilka regler gäller om jag behöver avboka?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Uppgift 3 - Åsikter på internet (Tema: relationer på jobbet)
$secC = @'
{
  "section": "C",
  "icon": "💼",
  "title": "Uppgift 3: Åsikter på internet (Relationer på jobbet)",
  "instructions": "Några personer skriver på en webbsida om relationer mellan arbetskamrater. Svara på frågorna genom att skriva personens namn.\n\nPersoner: Berit, Kim, Abdu, Shalini, Tindra, Lukas",
  "texts": [
    {
      "heading": "Inlägg på webbsidan",
      "body": "• Berit (Idag: 12:45): Nu har jag äntligen vågat säga ifrån när jag tycker att någon säger något dumt. På vårt möte igår var det en kollega som pratade illa om vår rektor som är sjukskriven. När jag sa att det inte är okej blev hon lite sur. Men sen bad hon faktiskt om ursäkt.\n\n• Kim (Idag: 15:15): En kille på mitt jobb är i vanliga fall glad och trevlig. Men nu vill han inte prata. Jag vet inte vad som har hänt, om han är deprimerad eller nåt. Jag är bekymrad och undrar vad jag ska göra. Prata med ledningen eller...?\n\n• Abdu (Idag: 17:50): Jobbarkompisarna betyder mycket för mig. Vi skojar alltid med varandra och sitter och pratar i lunchrummet när vi får chansen. På min flickväns jobb verkar det så stressigt. De tar sällan fikapauser. Jag skulle aldrig vilja jobba så.\n\n• Shalini (Idag: 17:58): Jag är ansvarig för en vårdcentral och uppskattar mina medarbetare. Men ibland får jag höra negativa kommentarer från personalen. Det är inte så kul. Om de visste hur tufft det är att ha allt ansvar! De borde tänka sig lite för innan de klagar på allt möjligt.\n\n• Tindra (Idag: 18:40): Jag trivs bra här i mataffären men jag irriterar mig på vår arbetsledare. Jag älskar att stå och sälja ost men vissa får göra det mycket oftare. Det är orättvist att vi behandlas olika. Dessutom sitter en del och fikar jättelänge utan att hon säger nåt.\n\n• Lukas (Idag: 19:10): Jag har ett ganska tråkigt jobb men vill inte byta för jag har blivit förälskad i en ny jobbarkompis. I början var jag nervös när vi jobbade på lagret ihop men nu känns det bara härligt. Vi har träffats en del på fritiden men ingen här vet något än."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "short",
      "prompt": "A. Vem är orolig att en arbetskamrat mår dåligt?",
      "answer": "Kim",
      "acceptedAnswers": ["Kim", "kim"]
    },
    {
      "id": "C_Q2",
      "type": "short",
      "prompt": "B. Vem har blivit kär på jobbet?",
      "answer": "Lukas",
      "acceptedAnswers": ["Lukas", "lukas"]
    },
    {
      "id": "C_Q3",
      "type": "short",
      "prompt": "C. Vem tycker att chefen gör fel?",
      "answer": "Tindra",
      "acceptedAnswers": ["Tindra", "tindra"]
    },
    {
      "id": "C_Q4",
      "type": "short",
      "prompt": "D. Vem tycker att det är viktigt att umgås på rasten?",
      "answer": "Abdu",
      "acceptedAnswers": ["Abdu", "abdu"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Uppgift 4 - Tips när du studerar hemma
$secD = @'
{
  "section": "D",
  "icon": "📚",
  "title": "Uppgift 4: Tips när du studerar hemma",
  "instructions": "Läs texterna på webbsidan (www.studietips.univ.nu) och välj vilken rubrik som passar bäst till varje text.",
  "texts": [
    {
      "heading": "Text A",
      "body": "Sätt dig på en plats där det är tyst och lugnt. Stäng av tv:n och notiser på telefon och dator. Varje litet pip från mobilen tar fokus från studierna och du kan tappa koncentrationen. Om du bor tillsammans med andra kanske du kan gå till ett bibliotek."
    },
    {
      "heading": "Text B",
      "body": "Att studera ett nytt språk kan vara svårt. Ett tips är att läsa igenom de nya orden en gång till före läggdags. När du sen sover fortsätter hjärnan att arbeta och du kommer troligen att minnas den nya informationen lättare dagen efter."
    },
    {
      "heading": "Text C",
      "body": "När du har många uppgifter som du ska hinna med är det bra att skriva en lista på det som du måste göra. Då kan du ta en sak i taget och stryka det som du har gjort. Din hjärna reagerar då positivt och du får mer lust att börja med nästa uppgift."
    },
    {
      "heading": "Text D",
      "body": "Fysisk aktivitet hjälper hjärnan att ta in ny information. När du har suttit länge med studierna kan du ge dig ut och jogga. Gör det nästa gång du blir sömnig i stället för att dricka kaffe eller gå och lägga dig."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik passar bäst till text A?",
      "options": [
        "Sök fakta på internet",
        "Låna dina kursböcker",
        "Ta bort allt som stör"
      ],
      "answer": "Ta bort allt som stör"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik passar bäst till text B?",
      "options": [
        "Repetera gärna på kvällen",
        "Ta det lugnt före ett prov",
        "Dåligt att studera sent"
      ],
      "answer": "Repetera gärna på kvällen"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik passar bäst till text C?",
      "options": [
        "Planera dina studier",
        "Välj det roliga först",
        "Gör alltid läxorna"
      ],
      "answer": "Planera dina studier"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik passar bäst till text D?",
      "options": [
        "Vila när du är trött",
        "Träna för att bli pigg",
        "Drick kaffe för att orka"
      ],
      "answer": "Träna för att bli pigg"
    }
  ]
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Uppgift 5 - Insändarsida
$secE = @'
{
  "section": "E",
  "icon": "📰",
  "title": "Uppgift 5: Insändarsida",
  "instructions": "Läs texterna på tidningens insändarsida och välj rätt rubrik (1–6) för varje insändare.\n\nRubriker:\n1. Stäng av mobilen\n2. Allt slutade bra\n3. Skräpa inte ner\n4. Ring istället\n5. Bjud dina grannar\n6. De gör mig trygg",
  "texts": [
    {
      "heading": "Insändare A (Emil)",
      "body": "Många klagar på polisen. Det tycker jag är dumt. Hur skulle samhället se ut utan dem? När någon kör för fort och polisen tar fast den personen så gör de bara sitt jobb. De ser ju till att trafiken och annat fungerar bra! Jag känner mig lugn och säker när jag ser en polis."
    },
    {
      "heading": "Insändare B (En tant i stan)",
      "body": "Jag var ute och handlade i tisdags och när jag kom hem upptäckte jag att min telefon var borta. Jag blev orolig och tänkte att någon hade tagit den. Men när jag gick tillbaka till affären och frågade efter den i kassan så fanns den där. En ung kille hade hittat den och lämnat in den. Han räddade min dag! Tur att det finns ärliga människor!"
    },
    {
      "heading": "Insändare C",
      "body": "Jag tycker det är tråkigt att vi så sällan pratar med varandra nuförtiden. Vi ser vad andra gör på sociala medier och skickar sms men det är inte samma sak som ett riktigt samtal. Min uppmaning till alla är: lyft luren och prata en stund med en släkting eller gammal vän!"
    },
    {
      "heading": "Insändare D (Valle)",
      "body": "Nu har vi fått besök av råttor igen i vårt område. Det är inte så kul att vara ute på gården och grilla när folk lämnar kvar matrester som råttor och fåglar sen kommer och äter av! Dessutom ser det tråkigt ut med slängda förpackningar och plastflaskor. Plocka undan efter er, är ni snälla!"
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik (1–6) passar bäst till insändare A (Emil)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik (1–6) passar bäst till insändare B (En tant i stan)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik (1–6) passar bäst till insändare C?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik (1–6) passar bäst till insändare D (Valle)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    }
  ]
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8


# ==========================================
# 2. WRITING PROMPT (prompt.json)
# ==========================================

$writingPrompt = @'
{
  "examId": "2022-2",
  "title": "Skriv och berätta (En plats som du tycker mycket om)",
  "promptHtml": "<p><strong>Skriv en text och berätta om en plats som du tycker mycket om.</strong></p><p style='margin-top: 12px;'><strong>Du ska berätta:</strong></p><ul><li>vilken plats det är,</li><li>hur det ser ut där,</li><li>vad man kan göra där,</li><li>varför du tycker om platsen.</li></ul>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $writingPrompt -Encoding utf8

Write-Host "=== Successfully populated Reading (A-E) and Writing for 2022-2! ===" -ForegroundColor Cyan
