# update-2026-10.ps1 - Populates official Reading and Writing data for exam session 2026-10

Write-Host "Populating Reading and Writing data for 2026-10..." -ForegroundColor Cyan

$examDir = "data/sfi/2026-10"
$readingDir = Join-Path $examDir "reading"
$writingDir = Join-Path $examDir "writing"

if (!(Test-Path $readingDir)) { New-Item -ItemType Directory -Path $readingDir -Force | Out-Null }
if (!(Test-Path $writingDir)) { New-Item -ItemType Directory -Path $writingDir -Force | Out-Null }

# ==========================================
# 1. READING CONFIG & SECTIONS (A - H)
# ==========================================

$configJson = @'
{
  "year": "2026-10",
  "module": "reading",
  "title": "SFI Läsförståelse – Exam 2026-10",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json", "H.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A (Anslagstavla)
$secA = @'
{
  "section": "A",
  "icon": "📌",
  "title": "Meddelanden på en anslagstavla",
  "instructions": "Läs meddelandena på anslagstavlan och svara på frågorna.",
  "texts": [
    {
      "heading": "Anton",
      "body": "Hej!\nJag har precis flyttat hit till Västköping och börjat läsa kursen Engelska nivå 1 på distans. Det känns lite ensamt här i min lägenhet, så jag vill komma i kontakt med andra för att göra roliga saker efter skolan. Mejla gärna mig om du också vill det.\nHälsningar Anton\nanton@univ.nu"
    },
    {
      "heading": "Emir",
      "body": "Till dig som hittade min dator!\nSå snällt att du lämnade in den på expeditionen. Jag blev så ledsen när datorn var borta, men blev sedan så glad att du hittat den!\nStor kram till dig!\nHälsningar Emir"
    },
    {
      "heading": "Alma",
      "body": "Hej!\nJag är en student som behöver extra pengar. Just nu läser jag en kurs i handel och ekonomi. Vet du något företag inom service som behöver personal på kvällar och helger? Jag har precis tagit B-körkort.\nHälsningar Alma, 070-196652"
    },
    {
      "heading": "Katrin",
      "body": "Hallå allihop!\nJag tycker att vårt fina elevkök ska vara en trevlig plats för alla. Men nu ligger det ofta matlådor och annat på borden, som någon lämnat kvar. Snälla, det är väl inte så svårt att plocka undan efter sig?\n/ Katrin"
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Vad vill Anton?",
      "options": ["hitta en bostad", "träffa nya vänner", "få hjälp med läxor"],
      "answer": "träffa nya vänner"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vad vill Emir?",
      "options": ["hjälpa någon", "be om ursäkt", "tacka för något"],
      "answer": "tacka för något"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vad vill Alma?",
      "options": ["köpa en bil", "hitta ett jobb", "få hjälp med läxor"],
      "answer": "hitta ett jobb"
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad vill Katrin?",
      "options": ["klaga på något", "be om ursäkt", "tacka för något"],
      "answer": "klaga på något"
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B (Intervju med Carlos)
$secB = @'
{
  "section": "B",
  "icon": "🚗",
  "title": "Intervju med Carlos",
  "instructions": "Läs frågorna och intervjun med Carlos som reparerar bilar. Välj det svar som passar bäst till varje fråga (1–5).",
  "texts": [
    {
      "heading": "Svarsalternativ",
      "body": "1. Inte så ofta, men det händer ibland. Nu i somras tog jag faktiskt en tur till Göteborg tillsammans med några vänner. Och bilen fungerade hela vägen!\n2. Det började när jag var barn. Min pappa hade flera bilar som han höll på med i sitt garage. Jag tittade ofta på när han mekade med bilarna. Efter ett tag började jag hjälpa honom.\n3. Det är inte alltid så lätt att hitta reservdelar till gamla bilar. En gång letade jag i flera månader på internet för att hitta de delar som jag behövde.\n4. Det ska vara äldre modeller, tycker jag. Just nu har jag en sportbil från 70-talet, som jag fixar med på helgerna. Det finns bara två av den modellen i hela Sverige.\n5. - Att få se hur bilen får ett nytt liv. Jag blir så glad när jag lyckas laga en bil som har varit trasig länge. Ibland känner jag mig som en läkare som gör sina patienter friska."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. När blev du intresserad av bilar?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Vilka bilar gillar du?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Vad är det roligaste med att reparera bilar?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "B_Q4",
      "type": "mcq",
      "prompt": "D. Brukar du köra dina bilar också?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C (Musiken i Tinas liv)
$secC = @'
{
  "section": "C",
  "icon": "🎸",
  "title": "Musiken i Tinas liv",
  "instructions": "Läs texten om Tina och bandet Glöd och svara på frågorna.",
  "texts": [
    {
      "heading": "Musiken i Tinas liv och bandet Glöd",
      "body": "Musik har alltid varit viktigt för Tina. Sedan ett år tillbaka sjunger hon i bandet Glöd på sin fritid.\nTina berättar att det var mycket musik i hemmet när hon var barn. De sjöng ofta tillsammans och båda hennes föräldrar spelade flera instrument. När Tina fyllde fem år fick hon en gitarr, men hon lärde sig aldrig att spela på den då. Det var först när Tina och hennes klasskompisar fick en väldigt duktig musiklärare, som hon lyckades lära sig spela.\n- Jag är så tacksam för all musik i mitt liv. Den ger mig så mycket glädje, säger Tina.\nEfter gymnasiet arbetade Tina på olika restauranger och på fritiden gick hon ofta på konserter och lyssnade på musik. Hon spelade och sjöng inte så mycket själv då, men efter ett tag började hon längta efter det. En kväll efter arbetet satt hon hemma med sin mobil. Då läste hon om några som ville starta ett band. Hon skrev till dem och två veckor senare startade de ett band tillsammans, bandet Glöd.\n- Tänk att det gick så lätt. Sociala medier är fantastiskt, säger Tina.\nTina och bandet hyr ett rum i källaren i ett hyreshus. Där träffas de efter jobbet och spelar på kvällarna. De bestämmer tillsammans vilka sånger som de ska spela. Kvällarna med bandet blir ofta långa men Tina berättar att hon ändå är pigg och glad när hon går därifrån.\n- Jag har så mycket mer energi än förut. Det är det som jag gillar mest med att vara med i bandet, säger Tina.\nFör en månad sedan hade bandet sin första spelning för publik. Lokalen var full med vänner och familj den kvällen. De hade också bjudit alla som bor i hyreshuset. Tina berättar att kvällen började dåligt men slutade bra.\n- När vi hade spelat två låtar blev det svart i hela rummet och musiken tystnade. Men som tur var ordnade det sig snabbt med elen och vi kunde fortsätta spela. Så kvällen blev lyckad ändå, berättar hon.\nTina och bandet har stora planer för framtiden. De letar efter en pianist och någon som kan spela saxofon. Om man är fler när man spelar blir det ju roligare både för oss och för publiken, avslutar Tina."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Hur lärde sig Tina att spela gitarr?",
      "options": ["genom föräldrarna", "genom kompisar", "genom en lärare"],
      "answer": "genom en lärare"
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Hur fick Tina kontakt med de andra personerna i bandet?",
      "options": ["på sitt jobb", "på en fest", "på internet"],
      "answer": "på internet"
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Vad är det bästa med att vara med i bandet, säger Tina?",
      "options": ["att hon orkar mer nu", "att hon sjunger bättre nu", "att hon är mindre rädd nu"],
      "answer": "att hon orkar mer nu"
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Vad var problemet när de spelade för publik första gången?",
      "options": ["Grannarna blev arga.", "Ljudet och ljuset försvann.", "Nästan ingen kom och lyssnade."],
      "answer": "Ljudet och ljuset försvann."
    },
    {
      "id": "C_Q5",
      "type": "mcq",
      "prompt": "E. Vad berättar Tina att bandet vill göra i framtiden?",
      "options": ["skriva egen musik", "hitta nya medlemmar", "spela i andra städer"],
      "answer": "hitta nya medlemmar"
    },
    {
      "id": "C_Q6",
      "type": "mcq",
      "prompt": "F. Vad handlar texten mest om?",
      "options": ["att umgås med familjen", "att gå en bra utbildning", "att ha ett roligt intresse"],
      "answer": "att ha ett roligt intresse"
    }
  ]
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D (Annonser om sommarjobb)
$secD = @'
{
  "section": "D",
  "icon": "☀️",
  "title": "Annonser om sommarjobb",
  "instructions": "Läs annonserna om sommarjobb och svara på frågorna.",
  "texts": [
    {
      "heading": "Jobba utomhus i sommar (Parkjobb)",
      "body": "Gillar du att arbeta i utemiljö? Då har Ranstad kommun jobbet för dig! Du klipper gräs och planterar blommor i parkerna i stan. Du arbetar dagtid i 5 veckor, med start 17 juni. Observera att det är tidiga morgnar, med start 06:30. Skicka din ansökan senast 15 april. Bengt Strand ger mer information, 072-305411"
    },
    {
      "heading": "Modebutiken Stil",
      "body": "Bli sommarens bästa säljare! Modebutiken Stil söker dig som är positiv och gillar att arbeta i grupp. Dina uppgifter är att hjälpa våra kunder och ta fram varor i affären. Arbetsperioden börjar 15 juni och håller på i 6 veckor, kl. 10-18 mån-fre. Skicka din ansökan senast 30 april. Vill du veta mer, ring Sofia Bergström, 073-951223"
    },
    {
      "heading": "Pizzeria Italiano (Diskare)",
      "body": "Diskare - jobb hela sommaren! Kom och var en del av vårt roliga gäng på pizzeria Italiano! Du har ansvar för att matsalen är fin och att tallrikar, glas och bestick är rena efter dagens lunch och middag. Du arbetar både dagtid och kvällstid i 8 veckor, med start 13 juni. Skicka din ansökan senast 10 april. Hör av dig till Erik Olsson för mer information, 070-196641"
    },
    {
      "heading": "Äldreboendet Solgården",
      "body": "Sommarjobba på äldreboende. Kom till oss på äldreboendet Solgården! Du är omtänksam och ger ett bra stöd, till exempel när de boende ska äta, vill prata eller vill gå en kort promenad. Vårdutbildning är ett krav. Du arbetar dagtid i 9 veckor, med start 10 juni. Därefter kan du arbeta kvällstid under resten av året. Skicka din ansökan senast 1 april. Intresserad? Ring Mehmet Brown, 079-141794"
    },
    {
      "heading": "Rent och fint (Städjobb)",
      "body": "Sommarjobba hos oss på Rent och fint. Vi är ett företag som växer. Nu letar vi efter nya medarbetare. Vi städar hemma hos privatpersoner och hos företag och även på sjukhus och förskolor. Din arbetsperiod börjar 1 juli och du arbetar i 5 veckor. Skicka din ansökan senast 25 april. Ring Maj Roos för mer information, 076-176981"
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "short",
      "prompt": "A. Hur många veckor är butiksjobbet?",
      "answer": "6 veckor",
      "acceptedAnswers": ["6 veckor", "6", "sex veckor"]
    },
    {
      "id": "D_Q2",
      "type": "short",
      "prompt": "B. Vilket datum börjar vårdjobbet?",
      "answer": "10 juni",
      "acceptedAnswers": ["10 juni", "10/6", "den 10 juni"]
    },
    {
      "id": "D_Q3",
      "type": "short",
      "prompt": "C. Vem ska man kontakta om man har frågor om restaurangjobbet?",
      "answer": "Erik Olsson",
      "acceptedAnswers": ["Erik Olsson", "erik olsson"]
    },
    {
      "id": "D_Q4",
      "type": "short",
      "prompt": "D. När är sista datumet att söka städjobbet?",
      "answer": "25 april",
      "acceptedAnswers": ["25 april", "25/4", "den 25 april"]
    },
    {
      "id": "D_Q5",
      "type": "short",
      "prompt": "E. Vilken tid börjar arbetsdagen på parkjobbet?",
      "answer": "06.30",
      "acceptedAnswers": ["06.30", "kl 06.30", "klockan 06.30", "6.30"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E (Några personer går olika kurser)
$secE = @'
{
  "section": "E",
  "icon": "📚",
  "title": "Några personer berättar om sina kurser",
  "instructions": "Några personer går olika kurser på en folkhögskola. Läs vad de säger och svara på frågorna.",
  "texts": [
    {
      "heading": "Alex",
      "body": "- Jag har lärt mig massor och haft roligt på den här kursen. Men jag trodde att vi skulle få lära oss mer om hur man jobbar med bild och text på datorn. Och tyvärr har vi inte fått göra det."
    },
    {
      "heading": "Jim",
      "body": "- Det måste vara svårt att vara lärare när man har många elever, men vår lärare klarar verkligen det. Jag är väldigt imponerad! Jag kommer att rekommendera kursen till alla som funderar på att gå den."
    },
    {
      "heading": "Maya",
      "body": "- Läraren på kursen är toppen. Hon förklarar tydligt så att alla kan förstå. Men många av lektionerna är på distans och det passar inte mig. Jag vill ha mer tid i klassrummet, för jag lär mig mer när jag är tillsammans med läraren och de andra eleverna."
    },
    {
      "heading": "Lisa",
      "body": "- Uppgifterna på kursen är för enkla för mig. Jag kunde nästan allt redan innan jag började. Helt fel kurs för mig."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vad tycker Alex om kursen?",
      "options": ["bra.", "dålig.", "både bra och dålig."],
      "answer": "både bra och dålig."
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vad tycker Jim om kursen?",
      "options": ["bra.", "dålig.", "både bra och dålig."],
      "answer": "bra."
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Maya om kursen?",
      "options": ["bra.", "dålig.", "både bra och dålig."],
      "answer": "både bra och dålig."
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Lisa om kursen?",
      "options": ["bra.", "dålig.", "både bra och dålig."],
      "answer": "dålig."
    }
  ]
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F (Bostadsområdet Kungsgården)
$secF = @'
{
  "section": "F",
  "icon": "🏢",
  "title": "Bostadsområdet Kungsgården",
  "instructions": "Läs texterna om bostadsområdet Kungsgården och välj den rubrik (1–6) som bäst sammanfattar vad varje text handlar om.\n\nRubriker:\n1. Aktiviteter för alla boende\n2. Internet i våra hus\n3. Kontakt och service\n4. Lokal som alla kan hyra\n5. Lediga lägenheter\n6. Sopor och återvinning",
  "texts": [
    {
      "heading": "Text A",
      "body": "Du kan få hjälp av våra fastighetsskötare kl. 8–16 alla vardagar. Vill du göra en felanmälan eller fråga om något kan du ringa eller enkelt göra det på Mina sidor på www.kungsgarden.infosidan.com."
    },
    {
      "heading": "Text B",
      "body": "Det är viktigt att alla hjälps åt att hålla rent och snyggt i området. Bredvid stora parkeringen finns en miljöstation där du slänger skräp och sorterar avfall från hushållet i olika behållare."
    },
    {
      "heading": "Text C",
      "body": "Det finns ett gårdshus med ett stort rum som boende i området kan använda för större privata fester. Bokning och betalning görs på webbsidan. Tänk på att visa hänsyn och städa efter dig."
    },
    {
      "heading": "Text D",
      "body": "För dig som vill umgås med dina grannar ordnas det träffar med fika och spel under hösten och vintern. På sommaren ordnar vi grillkvällar med lekar för både vuxna och barn. Läs mer om vad som händer i området just nu, på anslag i trappuppgångar och på vår webbsida."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik passar till Text A?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik passar till Text B?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik passar till Text C?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik passar till Text D?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    }
  ]
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G (Intervjuer om pension)
$secG = @'
{
  "section": "G",
  "icon": "👴",
  "title": "Intervjuer om pension",
  "instructions": "Några personer berättar i en tidning vad de vill göra när de slutar jobba och går i pension. Svara med personens namn.",
  "texts": [
    {
      "heading": "Boris",
      "body": "- Hela livet har jag arbetat i Göteborg. Men jag planerar att sälja min lägenhet och bo i mitt sommarhus i Skåne i stället. Det ska bli skönt att byta den stressiga stadsmiljön mot naturen och tystnaden."
    },
    {
      "heading": "Hanna",
      "body": "- Jag vill ta det lugnt och slippa alla tidiga morgnar med buss på väg till jobbet. Då ska jag bara vara hemma och vila efter många års hårt arbete. Men även umgås med vänner och kanske gå på bio eller göra något annat roligt."
    },
    {
      "heading": "Simon",
      "body": "- Jag är trött på de kalla och mörka vintrarna här. Det är ofta grått och tråkigt så jag ska spara pengar för jag vill se mer av världen. Jag vill besöka platser som jag bara har läst om. Jag tyckte mycket om historia och geografi när jag var barn och gick i skolan."
    },
    {
      "heading": "Mona",
      "body": "- Jag har två barnbarn så det ska bli härligt att få umgås med dem så mycket jag vill. Min dotter bor långt ifrån mig så vi ses bara ibland. Men när jag slutar mitt jobb som rektor i sommar och blir pensionär, kan jag åka till dem lite oftare."
    },
    {
      "heading": "Anita",
      "body": "- Om en månad går jag i pension och då ska jag ta fram min gamla symaskin som jag fått av min mamma. Jag har länge tänkt att jag vill sy egna kläder, men jag vet inte alls hur man gör. Jag har anmält mig till en sykurs för nybörjare som är två kvällar i veckan. Det ska bli kul!"
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "short",
      "prompt": "A. Vem vill resa till andra länder?",
      "answer": "Simon",
      "acceptedAnswers": ["Simon", "simon"]
    },
    {
      "id": "G_Q2",
      "type": "short",
      "prompt": "B. Vem vill flytta?",
      "answer": "Boris",
      "acceptedAnswers": ["Boris", "boris"]
    },
    {
      "id": "G_Q3",
      "type": "short",
      "prompt": "C. Vem vill träffa sin familj (barnbarn) mer?",
      "answer": "Mona",
      "acceptedAnswers": ["Mona", "mona"]
    },
    {
      "id": "G_Q4",
      "type": "short",
      "prompt": "D. Vem vill lära sig något nytt (sy)?",
      "answer": "Anita",
      "acceptedAnswers": ["Anita", "anita"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H (Diagram)
$secH = @'
{
  "section": "H",
  "icon": "📊",
  "title": "Ett diagram",
  "instructions": "Studera diagrammet om besökare på olika platser i Västerhamns kommun och svara på frågorna.",
  "texts": [
    {
      "heading": "Diagraminformation",
      "body": "Diagrammet visar antal besökare på fyra platser (Sporthall, Badhus, Museum, Bibliotek) under åren 2022, 2023 och 2024 i Västerhamns kommun."
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "short",
      "prompt": "A. Hur många besökte badhuset år 2024?",
      "answer": "6000",
      "acceptedAnswers": ["6000", "6 000"]
    },
    {
      "id": "H_Q2",
      "type": "short",
      "prompt": "B. Vilken plats hade samma antal besökare år 2022 och 2024?",
      "answer": "Bibliotek",
      "acceptedAnswers": ["Bibliotek", "bibliotek"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

# ==========================================
# 2. WRITING PROMPT (prompt.json)
# ==========================================

$promptJson = @'
{
  "examId": "2026-10",
  "title": "Svara på ett mejl",
  "promptHtml": "<p><strong>Du har fått ett mejl från en vän. Läs mejlet och skriv ett svar.</strong></p><div style='background: var(--bg-page); padding: 16px; border-radius: 8px; border: 1px solid var(--border); margin: 12px 0;'><p><strong>Hej!</strong></p><p>Hoppas allt är bra.</p><p>Jag funderar på att flytta till området där du bor. Jag vill gärna veta hur det är att bo där. Vad är bra och vad är dåligt i ditt område? Hur kan man träffa nya vänner där?</p><p>Vad tycker du, ska jag flytta till ditt område eller inte?</p><p>Vi hörs!</p></div><p style='margin-top: 16px;'><strong>Svara på mejlet. Du ska berätta:</strong></p><ul><li>vad som är bra och dåligt i området där du bor,</li><li>hur man kan träffa nya vänner i ditt område,</li><li>om du tycker att din vän ska flytta till ditt område eller inte, och varför du tycker så.</li></ul><p style='margin-top: 8px; color: var(--text-muted); font-size: 0.9rem;'>Tänk på hur du börjar och avslutar mejlet.</p>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $promptJson -Encoding utf8

Write-Host "=== Successfully populated Reading (A-H) and Writing for 2026-10! == = " -ForegroundColor Cyan
