# update-2022-1.ps1 - Populates Reading (A-H) for Nationellt prov 1, 2022 (2022-1)

Write-Host "Populating Reading data for 2022-1..." -ForegroundColor Cyan

$examDir = "data/sfi/2022-1"
$readingDir = Join-Path $examDir "reading"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null

# ==========================================
# READING CONFIG & SECTIONS (A - H)
# ==========================================

$configJson = @'
{
  "year": "2022-1",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt prov 1, 2022",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json", "H.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: En intervju med Fadia Kariti (Schack)
$secA = @'
{
  "section": "A",
  "icon": "♟️",
  "title": "Uppgift 1: En intervju med Fadia Kariti",
  "instructions": "Läs intervjusvaren (1–6) med Fadia Kariti som spelar schack på fritiden och välj det svar som passar bäst till varje fråga.",
  "texts": [
    {
      "heading": "Intervjusvar (1–6)",
      "body": "1. Det är att kunna fatta bra beslut under tidspress. Man måste själv bestämma hur man ska spela samtidigt som man ska försöka förstå hur den man spelar mot tänker.\n\n2. - Jag har ingen ambition att tävla på någon högre nivå, utan tänker fortsätta som jag gör nu. För mig är schack mest ett sätt att ha kul. Det är roligt att möta olika motståndare och utveckla sitt spel men jag tänker inte satsa mer än så.\n\n3. - Man vinner för att man har spelat bra eller för att motståndaren har gjort misstag, inte för att man har tur. Jag gillar att spelet kräver koncentration och skicklighet. Sen har schackklubben gett mig många vänner också.\n\n4. - Spela och analysera mycket. Använd schackböcker, men spela också mycket online. Det gäller att öva regelbundet. Det tog två år för mig att bli duktig.\n\n5. - Jag tränar ungefär två gånger i veckan. Men om jag har någon tävling framför mig tränar jag oftare. Den senaste tävlingen jag deltog i var klubbmästerskapet. Det gick bra, jag kom på tredje plats!\n\n6. - Det var redan på mellanstadiet. Jag fastnade direkt för sporten. Sedan blev det ännu mer intressant när jag började tävla."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. När började du spela schack?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vad är roligt med att spela schack?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Hur blir man bra på schack? / Hur tränar du?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad har du för framtidsplaner med schack?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Uppgift 2 - Spela mobilspel (Diskussion)
$secB = @'
{
  "section": "B",
  "icon": "📱",
  "title": "Uppgift 2: Spela mobilspel",
  "instructions": "Här får du läsa om vad några personer tycker om att spela mobilspel (www.spelamobilspel.univ.nu). Svara på frågorna.",
  "texts": [
    {
      "heading": "Robin (Idag: 14.35)",
      "body": "Jag tycker att det är skönt att hålla på med ett äventyrsspel på kvällarna tills jag blir riktigt trött. Det hjälper mig att varva ner och gör det lättare att somna. Jag skulle bli stressad om jag inte spelade en stund varje dag."
    },
    {
      "heading": "Alma (Idag: 15.07)",
      "body": "Jag förstår inte varför människor vill lägga tid och pengar på spelande. Personligen slösar jag inte bort min fritid vid en skärm. Jag gillar istället att ses på riktigt och umgås med mina vänner."
    },
    {
      "heading": "Jim (Idag: 16.49)",
      "body": "Det beror på vad det är för spel. Spel som är stressiga och kostar pengar undviker jag helt, men kreativa spel är intressanta. Men jag har lätt att sitta för länge. Jag ska försöka minska på spelandet."
    },
    {
      "heading": "Elmas (Idag: 19.27)",
      "body": "Jag spelar ett ordspel ibland och det är kul. Men annars ser jag mest på tv-serier, för det är skön vila efter jobbet. Mina tonåringar spelar mycket och det oroar mig. Jag hoppas att de får andra intressen i framtiden."
    },
    {
      "heading": "Yassin (Idag: 19.35)",
      "body": "Mobilspel är helt meningslösa tycker jag. Jag är däremot bra på att hålla kontakt med vänner med mobilen. Vissa kanske tror att jag spelar spel när jag i själva verket skickar sms."
    },
    {
      "heading": "Leila (Idag: 20.18)",
      "body": "Ganska kul! Jag använder själv några riktigt bra spelappar. Men jag har läst en del rapporter om spelande och tycker inte att det borde vara tillåtet för de yngsta. I förskoleåldern ska man leka och röra på sig istället!"
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "short",
      "prompt": "A. Vem vill förbjuda mobilspel för små barn? (Skriv ett namn)",
      "answer": "Leila",
      "acceptedAnswers": ["Leila", "leila"]
    },
    {
      "id": "B_Q2",
      "type": "short",
      "prompt": "B. Vem vill spela mindre på mobilen? (Skriv ett namn)",
      "answer": "Jim",
      "acceptedAnswers": ["Jim", "jim"]
    },
    {
      "id": "B_Q3",
      "type": "short",
      "prompt": "C. Vem brukar spela mobilspel för att koppla av? (Skriv ett namn)",
      "answer": "Robin",
      "acceptedAnswers": ["Robin", "robin"]
    },
    {
      "id": "B_Q4",
      "type": "short",
      "prompt": "D. Vilka tycker inte om att spela mobilspel? (Skriv två namn)",
      "answer": "Yassin och Alma",
      "acceptedAnswers": ["Yassin och Alma", "Alma och Yassin", "yassin och alma", "alma och yassin"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Uppgift 3 - Ett mejl (Sara till Anton om studentlivet i Tyskland)
$secC = @'
{
  "section": "C",
  "icon": "✉️",
  "title": "Uppgift 3: Ett mejl (Studentlivet i Tyskland)",
  "instructions": "Sara har flyttat till Tyskland och skriver ett mejl till sin vän Anton. Läs mejlet och svara på frågorna.",
  "texts": [
    {
      "heading": "Ämne: Studentlivet i Tyskland",
      "body": "Hej Anton!\n\nNu har jag fått fint i min lägenhet som ligger i ett äldre hus utanför Berlins centrum. Det är smidigt att ta bussen till universitetet härifrån. Universitetet är jättestort så jag har gått till fel sal flera gånger. Det är inte enkelt med nya miljöer för mig som du vet.\n\nDirekt de första dagarna var jag ute på stan för att titta på allt nytt. Det finns massor att se och uppleva här, så härligt! Jag trodde att jag skulle sakna min familj mycket i början, men det har gått bra. Jag skickar bilder till dem på mina nya vänner och allt jag upptäcker här i stan!\n\nDet är väldigt intressanta lektioner så jag kan inte klaga på undervisningen. Men kurslitteraturen är krånglig. Det är många sidor och ibland fattar jag inte vad det står. På torsdag ska vi ha en diskussion om en film. Jag har förberett mig noga så jag är inte alls nervös.\n\nIgår var jag ute på restaurang och åt med en kurskamrat. Vi firade att vi hade skrivit vårt första test. Det känns som att det gick bra men man kan ju aldrig vara säker. Det var en del svåra uppgifter. Jag är så nyfiken på hur det gick.\n\nHar du funderat mer på att ta tjänstledigt från ditt jobb, som du berättade sist? Vad kul det skulle vara om du också började plugga här! Då skulle vi kunna läsa tillsammans. Jag kan hjälpa dig att leta efter en bostad här i så fall.\n\nHör av dig!\nKram,\nSara"
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Vad berättar Sara om universitetet?",
      "options": [
        "Det är mycket gammalt.",
        "Det är svårt att hitta där.",
        "Det tar lång tid att åka dit."
      ],
      "answer": "Det är svårt att hitta där."
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Vad berättar Sara om den första veckan i Berlin?",
      "options": [
        "Det kändes stressigt.",
        "Hon kände sig ensam.",
        "Det kändes spännande."
      ],
      "answer": "Det kändes spännande."
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Sara är svårt med att studera?",
      "options": [
        "att läsa böckerna",
        "att förstå lärarna",
        "att prata tyska"
      ],
      "answer": "att läsa böckerna"
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Vad berättar Sara om det första provet?",
      "options": [
        "Hon blev godkänd.",
        "Hon blev inte godkänd.",
        "Hon väntar på resultatet."
      ],
      "answer": "Hon väntar på resultatet."
    },
    {
      "id": "C_Q5",
      "type": "mcq",
      "prompt": "E. Vad vill Sara att Anton ska göra? Hon vill ...",
      "options": [
        "att han ska söka nytt jobb.",
        "att han ska börja studera.",
        "att han ska bo i hennes lägenhet."
      ],
      "answer": "att han ska börja studera."
    }
  ]
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Uppgift 4 - Tips om mat
$secD = @'
{
  "section": "D",
  "icon": "🥗",
  "title": "Uppgift 4: Tips om mat",
  "instructions": "Läs texterna på webbsidan (www.mattips.univ.nu) och välj vilken rubrik som passar bäst till varje text.",
  "texts": [
    {
      "heading": "Text A",
      "body": "Undvik att köpa frukt och grönsaker som har fraktats över halva jordklotet innan de säljs i butiken. Att köpa lokalt producerade varor är ofta bättre så köp istället det som är i säsong där du bor. I december smakar jordgubbarna ändå inte lika mycket."
    },
    {
      "heading": "Text B",
      "body": "Matrester som har blivit kvar efter middagen värmer du i mikron dagen efter. Du kan också använda mat som blivit över till andra rätter. Köttfärsen kan bli en god gratäng. Grönsaker som börjar bli gamla kan du ha i en soppa. Så kasta inget utan använd din fantasi istället."
    },
    {
      "heading": "Text C",
      "body": "Mat som har stått framme på matbordet eller i grytan på spisen ska in i kylskåpet direkt så inte bakterier förstör maten. De flesta färskvaror håller bäst i kylen men exempelvis bananer och tomater trivs bäst i rumstemperatur."
    },
    {
      "heading": "Text D",
      "body": "Det är bra att spara kvitton och skriva upp vad maten kostar under en månad. Då är det lättare att planera din ekonomi och du ser hur mycket som blir över till annat. Det finns enkla program på internet att använda."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik passar bäst till text A?",
      "options": [
        "Ät vegetariskt",
        "Välj mat efter årstid",
        "Köp gärna ekologiskt"
      ],
      "answer": "Välj mat efter årstid"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik passar bäst till text B?",
      "options": [
        "Välj nyttig mat",
        "Släng inte maten",
        "Gör en veckomeny"
      ],
      "answer": "Släng inte maten"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik passar bäst till text C?",
      "options": [
        "Håll rent i köket",
        "Stek maten noga",
        "Förvara maten rätt"
      ],
      "answer": "Förvara maten rätt"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik passar bäst till text D?",
      "options": [
        "Gör en budget",
        "Handla på nätet",
        "Betala med kort"
      ],
      "answer": "Gör en budget"
    }
  ]
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: På mopeden upptäcker de nya platser (Damer på väg)
$secE = @'
{
  "section": "E",
  "icon": "🛵",
  "title": "På mopeden upptäcker de nya platser",
  "instructions": "Läs artikeln om Karin Jonsson och mopedklubben Damer på väg och svara på frågorna.",
  "texts": [
    {
      "heading": "På mopeden upptäcker de nya platser",
      "body": "Damer på väg är en klubb för kvinnor som älskar att köra gamla mopeder. Karin Jonsson och hennes vänner träffas varje måndag och åker ut på vägarna och upptäcker nya ställen i naturen.\n\nKarin Jonsson, som är medlem i klubben, berättar att allt började med att hon såg ett gammalt foto på sin mormor på en moped. Då bestämde Karin att hon också ville ha en moped.\n- Om mormor kunde köra moped så borde jag också kunna det. Min mormor åkte ofta moped när jag var liten. En gång åkte hon hela vägen från sitt hem i Småland till en vän i Skåne. Jag kommer ihåg när hon packade väskan och satte sig på mopeden och åkte iväg, berättar Karin.\n\nSedan när Karin fyllde 60 år fick hon en moped i present av sin man. Några av hennes vänner tyckte att det var roligt så de skaffade också mopeder. Den sommaren startade Karin och hennes vänner mopedklubben Damer på väg.\n\nDet spelar ingen roll om det regnar eller om solen skiner. Varje måndag på sommaren träffas de och åker ut med sina mopeder i området kring Broby i Västergötland, där de alla bor. Sommarens första tur går alltid till ett litet café, som ligger några mil från Broby. Men deras allra första tur dit, för nästan åtta år sedan, gick inte så bra.\n- Första gången som vi åkte till caféet hade jag en annan moped. Den stannade var tionde minut ungefär. Så jag ville mest vända och åka tillbaka hemåt. Men till slut kom vi fram ändå. Sen när vi körde hem fick en av oss punktering och en annan bensinstopp, berättar Karin och skrattar.\n\nTätt efter varandra rullar de fram på gamla mopeder. De kör inte snabbt, men det är så de vill ha det. Då hinner de uppleva allt vackert som de åker förbi och känna dofterna från skog och mark.\n\nDet är inte bara medlemmarna i Damer på väg som tycker om att köra moped. Att åka moped har blivit populärt bland många.\n- Jag tror att det har att göra med friheten. Man kommer in på småvägar och kan åka på ett helt annat sätt än om man kör bil, avslutar Karin Jonsson."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Hur fick Karin idén att börja köra moped? När hon ...",
      "options": [
        "åkte på en resa.",
        "tänkte på sin mormor.",
        "träffade sin man."
      ],
      "answer": "tänkte på sin mormor."
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Var brukar kvinnorna i Damer på väg åka med sina mopeder?",
      "options": [
        "i Småland",
        "i Västergötland",
        "i Skåne"
      ],
      "answer": "i Västergötland"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vad hände när de åkte till caféet första gången?",
      "options": [
        "De hittade inte vägen dit.",
        "De hade dåligt väder.",
        "De fick problem med mopederna."
      ],
      "answer": "De fick problem med mopederna."
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Varför kör de långsamt med sina mopeder?",
      "options": [
        "De åker ofta på dåliga vägar.",
        "De vill ha tid att njuta av naturen.",
        "De är rädda för att åka fort."
      ],
      "answer": "De vill ha tid att njuta av naturen."
    },
    {
      "id": "E_Q5",
      "type": "mcq",
      "prompt": "E. Varför tror Karin att det är populärt att köra moped?",
      "options": [
        "Det är bra för miljön.",
        "Det är billigt med moped.",
        "Det är lätt att köra överallt."
      ],
      "answer": "Det är lätt att köra överallt."
    }
  ]
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Uppgift 2 - Ett diagram (Resor till arbetet i Malmö)
$secF = @'
{
  "section": "F",
  "icon": "📊",
  "title": "Uppgift 2: Ett diagram (Resor till arbetet i Malmö)",
  "instructions": "Studera diagrammet som visar hur människor i Malmö reste till arbetet under några år på 2000-talet och svara på frågorna.",
  "texts": [
    {
      "heading": "Information om diagrammet",
      "body": "Diagrammet visar andelen resor till arbetet i Malmö åren 2003, 2008, 2013 och 2018 fördelat på resor med bil, cykelresor och promenader samt resor med buss och tåg.\nKälla: Malmö miljöbarometer."
    }
  ],
  "charts": [
    {
      "id": "chartMalmoCommute",
      "type": "bar",
      "title": "Resor till arbetet* i Malmö",
      "labels": ["2003", "2008", "2013", "2018"],
      "datasets": [
        {
          "label": "resor med bil",
          "data": [43, 32, 30, 14],
          "backgroundColor": "#3b5998"
        },
        {
          "label": "cykelresor och promenader",
          "data": [43, 54, 46, 32],
          "backgroundColor": "#334155"
        },
        {
          "label": "resor med buss och tåg",
          "data": [12, 13, 19, 43],
          "backgroundColor": "#cbd5e1"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "short",
      "prompt": "A. Ungefär hur många procent reste med buss och tåg till arbetet år 2013?",
      "answer": "19%",
      "acceptedAnswers": ["19%", "19", "ca 19%", "cirka 19%"]
    },
    {
      "id": "F_Q2",
      "type": "short",
      "prompt": "B. Vilket år var andelen resor med bil lika stor som andelen cykelresor och promenader?",
      "answer": "2003",
      "acceptedAnswers": ["2003", "år 2003"]
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vilka resor till arbetet var vanligast år 2008?",
      "options": [
        "resor med bil",
        "cykelresor och promenader",
        "resor med buss och tåg"
      ],
      "answer": "cykelresor och promenader"
    }
  ]
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Uppgift 4 - Åsikter på internet (Varför de gillar regn)
$secG = @'
{
  "section": "G",
  "icon": "🌧️",
  "title": "Uppgift 4: Åsikter på internet (Regn)",
  "instructions": "Några personer berättar på en webbsida om varför de gillar regn. Svara på frågorna genom att skriva personens namn.\n\nPersoner: Henry, Ayan, Judit, Magnus, Carl",
  "texts": [
    {
      "heading": "Henry",
      "body": "- Jag älskar regn! Då kan jag jag pyssla här hemma hela dagen. Jag tvättar, städar, betalar räkningar, bakar bröd och har radion på. När solen skiner känner jag ofta att jag borde gå ut."
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
      "id": "G_Q1",
      "type": "short",
      "prompt": "A. Vem gillar att springa i regn?",
      "answer": "Carl",
      "acceptedAnswers": ["Carl", "carl"]
    },
    {
      "id": "G_Q2",
      "type": "short",
      "prompt": "B. Vem blir lugn av att lyssna på regn?",
      "answer": "Judit",
      "acceptedAnswers": ["Judit", "judit"]
    },
    {
      "id": "G_Q3",
      "type": "short",
      "prompt": "C. Vem är gärna inomhus på regniga dagar?",
      "answer": "Henry",
      "acceptedAnswers": ["Henry", "henry"]
    },
    {
      "id": "G_Q4",
      "type": "short",
      "prompt": "D. Vem gillar regn bara när det är varmt ute?",
      "answer": "Ayan",
      "acceptedAnswers": ["Ayan", "ayan"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Uppgift 5 - Meddelanden (Sms till Erik)
$secH = @'
{
  "section": "H",
  "icon": "💬",
  "title": "Uppgift 5: Meddelanden",
  "instructions": "Erik har fått några sms. Läs meddelandena och svara på frågorna.",
  "texts": [
    {
      "heading": "Sms från Gustav",
      "body": "Hej Erik! Hoppas du läst klart boken som du hittade på loppisen förra lördagen? Den verkade så bra. Jag vill gärna läsa den efter dig om det går bra. 😊\n/Gustav"
    },
    {
      "heading": "Sms från Tina",
      "body": "Hej, jag och några klasskompisar ska gå ut och äta på lördag. Vi brukar ofta gå till Mat & Dryck men nu vill vi prova något nytt. Vet du något ställe som har bra italiensk mat?\nHälsningar Tina"
    },
    {
      "heading": "Sms från John",
      "body": "Hej! Jag fick precis veta att du har bokat en resa till Paris. Vad kul! Missa inte alla fina små caféer! Ha det så mysigt!\n/John"
    },
    {
      "heading": "Sms från Ali",
      "body": "Hej Erik! I helgen ska jag ha gäster. Då vill jag göra din goda vaniljglass, men jag har glömt vad du hade i den. Hade du citron i också? Ska snart åka och handla så svara gärna snabbt. 😊\nHälsningar Ali"
    },
    {
      "heading": "Sms från Sarah",
      "body": "Hej Erik! Om du vill kan jag komma till dig i morgon och sätta ihop den där hyllan som du fick av din syster när du fyllde år. Fixar du middag i så fall ...?\nKram Sarah"
    },
    {
      "heading": "Sms från Ken",
      "body": "Hej Erik! Nu har jag fått nycklarna till min nya lägenhet! Den här veckan ska jag måla alla rum och på lördag har jag hyrt en lastbil. Skulle du kunna hjälpa till att bära flyttlådor? Har du tid och möjlighet?\n/Ken"
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "A. Vad vill Gustav? Han vill ...",
      "options": [
        "låna en bok.",
        "ge tips om en bok.",
        "köpa en bok."
      ],
      "answer": "låna en bok."
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "B. Vad vill Tina? Hon vill ...",
      "options": [
        "bjuda på restaurang.",
        "få tips om en restaurang.",
        "berätta om en restaurang."
      ],
      "answer": "få tips om en restaurang."
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "C. Vad vill John? Han vill ...",
      "options": [
        "fråga om en resa.",
        "planera en resa.",
        "önska trevlig resa."
      ],
      "answer": "önska trevlig resa."
    },
    {
      "id": "H_Q4",
      "type": "mcq",
      "prompt": "D. Vad vill Ali? Han vill ...",
      "options": [
        "bjuda Erik på middag.",
        "träffa Erik och fika.",
        "få ett recept av Erik."
      ],
      "answer": "få ett recept av Erik."
    },
    {
      "id": "H_Q5",
      "type": "mcq",
      "prompt": "E. Vad vill Sarah? Hon vill ...",
      "options": [
        "hjälpa Erik.",
        "bjuda Erik på mat.",
        "ge Erik en present."
      ],
      "answer": "hjälpa Erik."
    },
    {
      "id": "H_Q6",
      "type": "mcq",
      "prompt": "F. Vad vill Ken? Han vill få hjälp med att ...",
      "options": [
        "måla väggarna.",
        "köra lastbilen.",
        "bära saker."
      ],
      "answer": "måla väggarna."
    }
  ]
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

Write-Host "=== Successfully populated 2022-1 Reading (Sections A-H)! ===" -ForegroundColor Cyan
