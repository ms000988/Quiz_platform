# update-2018-14.ps1 - Populates Reading data (Sections A-G) for 2018-14

Write-Host "Populating Reading data for 2018-14..." -ForegroundColor Cyan

$readingDir = "data/sfi/2018-14/reading"
if (!(Test-Path $readingDir)) {
    New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
}

# Config
$configJson = @'
{
  "year": "2018-14",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt prov 14, 2018",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Hunden får Eva att känna sig trygg (Raffe)
$secA = @'
{
  "section": "A",
  "icon": "🐕‍🦺",
  "title": "Uppgift 1: Hunden får Eva att känna sig trygg",
  "instructions": "Läs artikeln om Eva Christiansson och servicehunden Raffe.",
  "texts": [
    {
      "heading": "Hunden får Eva att känna sig trygg",
      "body": "Hunden Raffe innebär en stor trygghet för Eva Christiansson. Han är både hennes assistent och bästa vän.\n\nFör knappt 15 år sedan drabbades Eva Christiansson av en allvarlig sjukdom som gör det svårt för henne att röra sig. Då var hon 24 år gammal och höll på att avsluta sin lärarutbildning. Sjukdomen har gjort att det har blivit svårare för Eva att klara av vardagen.\n- Den påverkar mig i allt. Mina ben fungerar dåligt. Den gör mig trött och jag orkar oftast bara en aktivitet per dag, säger Eva Christiansson.\n\nDet tog tid för henne att acceptera sin nya situation och de nya svårigheter hon upplevde i vardagen. De första två åren ville hon absolut inte använda rullstol. Istället försökte hon gå med hjälp av kryckor, fastän det gjorde henne trött.\n- Jag ville vara som jag alltid hade varit. Det är ett stort steg att säga ja till rullstol.\n\nNär hon träffade sin blivande man pratade han mycket om att hon trots allt skulle acceptera rullstolen. Då skulle hon lättare kunna ta sig till olika platser och ha mer energi till deras gemensamma aktiviteter.\n- Jag ville inte sätta mig ner, men det är det bästa jag har gjort, säger Eva Christiansson idag.\n\nEva Christiansson har alltid haft hund. När hon för drygt tre år sedan skaffade sin fjärde hund Raffe, gick hon och den nya hunden kurs tillsammans. Det var då som läraren pratade om att utbilda Raffe till servicehund, och det tyckte Eva lät som en bra idé.\n\nNu är Raffe en färdigutbildad servicehund och han hjälper Eva i hennes vardag. Han plockar upp saker som hon har tappat eller har svårt att nå från rullstolen och om något skulle hända henne kan han hämta hjälp.\n- Det är en stor trygghet att ha honom med, han är alltid beredd och om nånting händer hjälper han mig.\n\nDessutom gör han henne gladare. När Eva tappade något tidigare blev hon irriterad eftersom hon då blev påmind om sin sjukdom. Nu blir det istället en rolig lek för Raffe att plocka upp det som hon har tappat.\n\nÄven om hon idag har slutat att bry sig om vad folk tänker så är det alltid skönt att ha med Raffe.\n- När jag till exempel går in i en affär så är jag inte bara en tjej i en rullstol utan jag är en tjej med en hund. Det känns bra att folk tittar mer på Raffe än på mig."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Hur gammal var Eva när hon fick sjukdomen?",
      "options": ["20 år", "24 år", "30 år"],
      "answer": "24 år"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vad använde Eva de första två åren istället för rullstol?",
      "options": ["kryckor", "cykel", "bil"],
      "answer": "kryckor"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Hur hjälper Raffe Eva i vardagen?",
      "options": [
        "Han lagar mat och städar.",
        "Han plockar upp tappade saker och kan hämta hjälp.",
        "Han kör bilen åt henne."
      ],
      "answer": "Han plockar upp tappade saker och kan hämta hjälp."
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Två diagram om vatten
$secB = @'
{
  "section": "B",
  "icon": "💧",
  "title": "Uppgift 2: Två diagram (Vatten)",
  "instructions": "Studera diagrammen som visar hur vi använder vatten hemma och hur mycket vatten som behövs för olika varor, och svara på frågorna.",
  "texts": [
    {
      "heading": "Så här använder vi vattnet i våra hem",
      "body": "Mat och dryck: 7%\nToalettspolning: 22%\nDisk och tvätt: 21%\nPersonlig hygien: 43%\nÖvrigt: 7%\nKälla: www.svensktvatten.se"
    }
  ],
  "charts": [
    {
      "id": "chartWaterHome",
      "type": "bar",
      "title": "Så här använder vi vattnet i våra hem (%)",
      "labels": ["Personlig hygien", "Toalettspolning", "Disk och tvätt", "Mat och dryck", "Övrigt"],
      "datasets": [
        {
          "label": "Andel (%)",
          "data": [43, 22, 21, 7, 7],
          "backgroundColor": "#0284c7"
        }
      ]
    },
    {
      "id": "chartWaterGoods",
      "type": "bar",
      "title": "Så här mycket vatten behövs för att producera olika varor (liter)",
      "labels": ["1 kilo vete", "1 kilo ris", "1 kilo majs", "1 kilo ost", "1 liter mjölk"],
      "datasets": [
        {
          "label": "Antal liter",
          "data": [1200, 2700, 450, 5000, 900],
          "backgroundColor": "#334155"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "short",
      "prompt": "A. Hur många procent av vattnet i våra hem använder vi för att diska och tvätta?",
      "answer": "21%",
      "acceptedAnswers": ["21%", "21"]
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Vad använder vi vattnet mest till i våra hem?",
      "options": [
        "mat och dryck",
        "toalettspolning",
        "disk och tvätt",
        "personlig hygien",
        "övrigt"
      ],
      "answer": "personlig hygien"
    },
    {
      "id": "B_Q3",
      "type": "short",
      "prompt": "C. Hur många liter vatten behövs för att producera ett kilo ris?",
      "answer": "2700 liter",
      "acceptedAnswers": ["2700 liter", "2700"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Åsikter på internet (Regn)
$secC = @'
{
  "section": "C",
  "icon": "☔",
  "title": "Uppgift 3: Åsikter på internet (Regn)",
  "instructions": "Några personer berättar på en webbsida om varför de gillar regn. Skriv personens namn.",
  "texts": [
    {
      "heading": "Henry",
      "body": "- Jag älskar regn! Då kan jag pyssla här hemma hela dagen. Jag tvättar, städar, betalar räkningar, bakar bröd och lyssnar på radio. När solen skiner känner jag ofta att jag borde gå ut."
    },
    {
      "heading": "Ayan",
      "body": "- Det är så mysigt att sitta ute och fika på balkongen när det regnar på sommaren. Och att simma i sjön i regnet är också härligt. Men på hösten och vintern är det så kallt och då är det aldrig skönt med regn tycker jag."
    },
    {
      "heading": "Judit",
      "body": "- Jag tycker om att vara aktiv. Men ibland stressar jag för mycket och då har jag svårt för att somna på kvällen. Men när jag hör regnet droppa mot fönstret blir jag avslappnad och kan sova gott."
    },
    {
      "heading": "Magnus",
      "body": "- När de berättar om vädret på tv så pratar de alltid om att regn är dåligt väder. Men regn är bra för vi behöver ju vatten. Jag blir glad när det regnar för då behöver jag inte vattna mina grönsaker som jag odlar."
    },
    {
      "heading": "Carl",
      "body": "- Jag är allergisk mot pollen och kan inte vara ute så mycket när träden blommar. Men när det regnar blir luften ren och jag kan andas lättare. Då passar jag på att jogga en tur. För mig är regn det bästa vädret att träna i!"
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "short",
      "prompt": "A. Vem gillar att springa i regnet?",
      "answer": "Carl",
      "acceptedAnswers": ["Carl", "carl"]
    },
    {
      "id": "C_Q2",
      "type": "short",
      "prompt": "B. Vem blir lugn av att lyssna på regn?",
      "answer": "Judit",
      "acceptedAnswers": ["Judit", "judit"]
    },
    {
      "id": "C_Q3",
      "type": "short",
      "prompt": "C. Vem är gärna inomhus på regniga dagar?",
      "answer": "Henry",
      "acceptedAnswers": ["Henry", "henry"]
    },
    {
      "id": "C_Q4",
      "type": "short",
      "prompt": "D. Vem gillar regn bara när det är varmt ute?",
      "answer": "Ayan",
      "acceptedAnswers": ["Ayan", "ayan"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: En text om vatten
$secD = @'
{
  "section": "D",
  "icon": "🌊",
  "title": "Uppgift 4: En text om vatten",
  "instructions": "Läs faktatexten om Sveriges vatten och välj det ord eller uttryck som passar bäst i varje lucka.",
  "texts": [
    {
      "heading": "Sveriges vatten",
      "body": "Vatten är livsviktigt. Utan vatten skulle det inte finnas något liv alls på jorden. Men 97 procent av jordens vatten finns i haven och är salt, och [A] inte att dricka.\n\nVatten som har så lite salt så att man kan dricka det kallas sötvatten. Det finns i regn, älvar, sjöar och i marken. I Sverige har vi många älvar och sjöar. När man reser genom vårt land [B] man vatten överallt i naturen.\n\nEn del år regnar det väldigt lite och då finns det mindre vatten. Då måste man tänka på att inte använda för mycket vatten. Så läs gärna på din kommuns webbsida där brukar det finnas tips på hur man kan [C] vatten.\n\nVi använder nästan 900 miljarder liter dricksvatten per år i Sverige. Dricksvattnet använder vi även till tvätt, disk, dusch och bad. Vattnet renas och används igen och igen. Därför är det [D] att vi inte spolar och sköljer ner farliga ämnen i toaletten och i köket.\n\nAlla som bor i Sverige tycker nog att det är självklart att få rent vatten ur kranen i köket och badrummet. Men för att vi ska ha friskt vatten och rena hav och sjöar i framtiden också, måste vi alla [E] och vara rädda om vårt vatten."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Vilket ord passar i texten?",
      "options": ["ger", "har", "går"],
      "answer": "går"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Vilket ord passar i texten?",
      "options": ["vet", "ser", "känner"],
      "answer": "ser"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Vilket ord passar i texten?",
      "options": ["sakna", "spara", "smaka"],
      "answer": "spara"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Vilket ord eller uttryck passar i texten?",
      "options": ["svårt", "dåligt", "viktigt"],
      "answer": "viktigt"
    },
    {
      "id": "D_Q5",
      "type": "mcq",
      "prompt": "E. Vilket uttryck passar i texten?",
      "options": ["ta ansvar", "ha bråttom", "få hjälp"],
      "answer": "ta ansvar"
    }
  ]
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsarnas sida
$secE = @'
{
  "section": "E",
  "icon": "🗞️",
  "title": "Uppgift 5: Läsarnas sida",
  "instructions": "Läs vad några personer har skrivit och välj rätt rubrik (1–5).\n\nRubriker:\n1. Tack för hjälpen\n2. Bussen är alltid sen\n3. Ta det lugnt i trafiken\n4. Håll koll på var du går\n5. Alla har inte råd",
  "texts": [
    {
      "heading": "Text A (Johannes)",
      "body": "Till er som kör som riktiga idioter! Ni kör för fort vid skolor och stannar inte för rött ljus. Så bråttom har ni inte! Ni spar några sekunder men ni är farliga för andra! Skärp er!"
    },
    {
      "heading": "Text B (Annie)",
      "body": "Jag är så trött på 'duktiga' människor som tjatar om att man ska tänka på miljön. Vi är många som har dålig ekonomi. Och det är jättedyrt med ekologiska och miljövänliga produkter. Vi skulle gärna handla miljövänligt om priserna var lägre!"
    },
    {
      "heading": "Text C (Karim)",
      "body": "I tisdags missade jag bussen när jag skulle åka till en jobbintervju. Då stannade du din bil och frågade om jag ville åka med! Det är så härligt med människor som tänker på andra! En stor kram till dig!"
    },
    {
      "heading": "Text D (19-årig tjej)",
      "body": "Jag undrar varför en del människor hela tiden tittar i mobilen när de promenerar på stan. Jag är trött på att krocka med folk på trottoaren! Till och med när de ska över gatan tittar de ner i mobilen och ser inte om det kommer någon bil eller buss."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik passar till text A (Johannes)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik passar till text B (Annie)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik passar till text C (Karim)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik passar till text D (19-årig tjej)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    }
  ]
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Tankar om studier & Några mejl
$secF = @'
{
  "section": "F",
  "icon": "✉️",
  "title": "Uppgift 6: Tankar om studier och mejl",
  "instructions": "Läs texterna om studier och mejlen och svara på frågorna.",
  "texts": [
    {
      "heading": "Adrian",
      "body": "- Jag har länge tänkt att jag ska gå en kurs i arabiska. Det skulle vara kul att kunna flera språk. Men jag har så mycket att göra nu med små barn hemma. Jag får vänta några år tills barnen blir större."
    },
    {
      "heading": "Mary",
      "body": "- Jag har precis slutat gymnasiet och är lite trött på skolan nu. Jag har funderat på att söka till polishögskolan till höstterminen men jag har inte bestämt mig än."
    },
    {
      "heading": "Jimmy",
      "body": "- Jag läser till journalist och är snart färdig. Jag gillar att studera, men nu ser jag fram emot att få börja jobba på en tidning. Jag har gjort praktik förut, men nu i höst får jag skriva artiklar på riktigt."
    },
    {
      "heading": "Mejl från Edgar",
      "body": "Hej alla!\nJag har ett extra lexikon som jag inte behöver. Mejla mig om du är intresserad! Du får det för 50 kr - nästan gratis ;) (Nypris är ca 300 kr.)\nHälsningar Edgar"
    },
    {
      "heading": "Mejl från Najma",
      "body": "Hej!\nJag har fått en plats på kursen i ekonomi och har satt in anmälningsavgiften på ert konto. Men jag har tyvärr inte fått schema och datum för kursstart än. Jättefint om ni kan mejla det till mig!\nHälsningar Najma"
    },
    {
      "heading": "Mejl från Sara",
      "body": "Till alla elever i klass Elb:\nVi ses som vanligt för lektion nu på fredag eftermiddag klockan 13.00. Observera att lektionen är flyttad till sal 204 på våning 2, eftersom vårt vanliga klassrum ska renoveras och målas om.\nHälsningar Sara"
    },
    {
      "heading": "Mejl från Lena",
      "body": "Hej!\nDet är jag som håller i veckans lärarmöte. Vi brukar ju ta kaffet före mötet men idag behöver vi börja direkt, klockan tre. Vi har många saker som vi ska diskutera så vi fikar medan vi pratar!\nHälsningar Lena"
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Ska Adrian studera i höst?",
      "options": ["ja", "nej", "kanske"],
      "answer": "nej"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Ska Mary studera i höst?",
      "options": ["ja", "nej", "kanske"],
      "answer": "kanske"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "E. Ska Jimmy studera i höst?",
      "options": ["ja", "kanske", "nej"],
      "answer": "nej"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "Mejl A. Vad vill Edgar?",
      "options": ["ge bort ett lexikon", "köpa ett lexikon", "sälja ett lexikon"],
      "answer": "sälja ett lexikon"
    },
    {
      "id": "F_Q5",
      "type": "mcq",
      "prompt": "Mejl B. Vad vill Najma?",
      "options": ["anmäla sig till en kurs", "betala för en kurs", "få information om en kurs"],
      "answer": "få information om en kurs"
    },
    {
      "id": "F_Q6",
      "type": "mcq",
      "prompt": "Mejl C. Vad vill Sara?",
      "options": ["informera om ny tid", "informera om annan lokal", "informera om ett möte"],
      "answer": "informera om annan lokal"
    },
    {
      "id": "F_Q7",
      "type": "mcq",
      "prompt": "Mejl D. Vad vill Lena?",
      "options": ["bjuda på något", "informera om något", "fråga om något"],
      "answer": "informera om något"
    }
  ]
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: En intervju med Tim om judo
$secG = @'
{
  "section": "G",
  "icon": "🥋",
  "title": "Uppgift 7: En intervju med Tim (Judo)",
  "instructions": "Tim berättar om sitt intresse för sporten judo. Läs frågorna och välj bland svaren (1–6).",
  "texts": [
    {
      "heading": "Svar från intervjun (1–6)",
      "body": "1. Det finns många bra judoklubbar, så kolla om det finns en i din stad. I så fall är det bara att kontakta dem och be att få komma och träna.\n\n2. Då arbetar jag på en fritidsgård och trivs väldigt bra med det. Jag jobbar måndag till fredag så jag har inte så mycket tid över till annat, men jag gillar att se på film också.\n\n3. Det är att man får röra på sig mycket, och så blir man mjuk i kroppen. Sen är det kul att jag har fått många bra kompisar genom judon också.\n\n4. Jag vill fortsätta att utvecklas i den här sporten och kanske börja som tränare för klubbens nybörjare. Och det skulle förstås vara roligt att få vinna en stor tävling någon gång.\n\n5. Jag provade flera lagsporter först, handboll och fotboll, men de passade inte mig. Så hittade jag en annons om judo och testade det.\n\n6. Jag kör ett träningspass varje kväll på vardagar. Och på helgen är det ofta tävling en av dagarna och träning på den andra. Judon är en stor del av mitt liv just nu."
    }
  ],
  "questions": [
    {
      "id": "G_Q0",
      "type": "mcq",
      "prompt": "Exempel: Varför började du med judo?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "A. Vad är det bästa med att träna judo, tycker du?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "B. Hur ofta tränar du judo?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "G_Q3",
      "type": "mcq",
      "prompt": "C. Vad gör du när du inte tränar judo?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    },
    {
      "id": "G_Q4",
      "type": "mcq",
      "prompt": "D. Vad har du för planer för framtiden?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    }
  ]
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

Write-Host "=== Successfully populated 2018-14 Reading (Sections A-G)! ===" -ForegroundColor Cyan
