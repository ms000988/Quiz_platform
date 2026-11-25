# update-2017-11.ps1 - Populates Listening, Reading (with Arabic notes), and Writing for 2017-11

Write-Host "Populating 2017-11 data (Listening, Reading, Writing)..." -ForegroundColor Cyan

$examDir = "data/sfi/2017-11"
$listeningDir = Join-Path $examDir "listening"
$readingDir = Join-Path $examDir "reading"
$writingDir = Join-Path $examDir "writing"

New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null

# ==========================================
# 1. LISTENING (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2017-11",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Några personer berättar (vad de ska göra idag / vad de gör för att må bra)",
      "audio": "spar01.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A1",
          "prompt": "A1. Vad ska Karima göra idag?",
          "options": ["Ringa till vårdcentralen.", "Köpa mat.", "Se en film."],
          "answer": "Ringa till vårdcentralen."
        },
        {
          "id": "L1_B1",
          "prompt": "B1. Vad ska Jesper göra idag?",
          "options": ["Hjälpa andra.", "Studera.", "Söka arbete."],
          "answer": "Studera."
        },
        {
          "id": "L1_C1",
          "prompt": "C1. Vad ska Lovisa göra idag?",
          "options": ["Köpa biljetter.", "Betala räkningar.", "Skriva ett mejl."],
          "answer": "Skriva ett mejl."
        },
        {
          "id": "L1_D1",
          "prompt": "D1. Vad ska Johannes göra idag?",
          "options": ["Träffa en vän.", "Köpa mat.", "Se en film."],
          "answer": "Träffa en vän."
        },
        {
          "id": "L1_E1",
          "prompt": "E1. Vad ska Susanna göra idag?",
          "options": ["Studera.", "Gå på möte.", "Söka arbete."],
          "answer": "Gå på möte."
        },
        {
          "id": "L1_F1",
          "prompt": "F1. Vad ska Nils göra idag?",
          "options": ["Gå på en kurs.", "Hjälpa andra.", "Gå till biblioteket."],
          "answer": "Hjälpa andra."
        },
        {
          "id": "L1_A2",
          "prompt": "A2. Vad gör Fadi för att må bra?",
          "options": ["tränar", "går en kurs", "träffar vänner"],
          "answer": "träffar vänner"
        },
        {
          "id": "L1_B2",
          "prompt": "B2. Vad gör Margareta för att må bra?",
          "options": ["handlar kläder", "äter godis", "träffar vänner"],
          "answer": "handlar kläder"
        },
        {
          "id": "L1_C2",
          "prompt": "C2. Vad gör Rasmus för att må bra?",
          "options": ["lyssnar på musik", "städar hemma", "pratar med folk"],
          "answer": "städar hemma"
        },
        {
          "id": "L1_D2",
          "prompt": "D2. Vad gör Jessica för att må bra?",
          "options": ["äter nyttigt", "går en kurs", "är ute i naturen"],
          "answer": "går en kurs"
        },
        {
          "id": "L1_E2",
          "prompt": "E2. Vad gör Bobby för att må bra?",
          "options": ["går en kurs", "läser en bok", "hjälper andra"],
          "answer": "läser en bok"
        },
        {
          "id": "L1_F2",
          "prompt": "F2. Vad gör Niki för att må bra?",
          "options": ["tittar på tv", "sover länge", "lyssnar på musik"],
          "answer": "sover länge"
        },
        {
          "id": "L1_G2",
          "prompt": "G2. Vad gör Adam för att må bra?",
          "options": ["är ute i naturen", "äter nyttigt", "surfar på internet"],
          "answer": "är ute i naturen"
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Telefonsvarare & Ett samtal på jobbet",
      "audio": "spar02.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A1",
          "prompt": "A1. Telefonsvarare på banken: Ellen har tappat sin plånbok med bankkort och legitimation. Vilken siffra ska hon trycka på?",
          "options": ["1", "2", "3"],
          "answer": "3"
        },
        {
          "id": "L2_B1",
          "prompt": "B1. Telefonsvarare på Vårdcentralen: Annas medicin har tagit slut och hon vill ha mer. Vilken siffra ska hon trycka på?",
          "options": ["1", "2", "3"],
          "answer": "2"
        },
        {
          "id": "L2_C1",
          "prompt": "C1. Telefonsvarare på Sfi-skolan: Stefano mår dåligt och kan inte gå till skolan idag. Vilken siffra ska han trycka på?",
          "options": ["1", "2", "3"],
          "answer": "2"
        },
        {
          "id": "L2_A2",
          "prompt": "A2. Varför är Sara glad?",
          "options": ["Hon ska flytta.", "Hon ska få högre lön.", "Hon ska ha semester."],
          "answer": "Hon ska få högre lön."
        },
        {
          "id": "L2_B2",
          "prompt": "B2. Vad ska Martin göra i helgen?",
          "options": ["se en film", "träffa sina föräldrar", "handla nya kläder"],
          "answer": "träffa sina föräldrar"
        },
        {
          "id": "L2_C2",
          "prompt": "C2. Vad säger Sara och Martin om sin nya chef?",
          "options": ["Han är tyst.", "Han är glad.", "Han är hjälpsam."],
          "answer": "Han är hjälpsam."
        },
        {
          "id": "L2_D2",
          "prompt": "D2. Varför kom Martin sent till jobbet?",
          "options": ["Han hade en läkartid.", "Han var på en kurs.", "Han fick problem med bilen."],
          "answer": "Han hade en läkartid."
        },
        {
          "id": "L2_E2",
          "prompt": "E2. Ska Martin och Sara äta lunch tillsammans?",
          "options": ["ja", "nej", "kanske"],
          "answer": "nej"
        }
      ]
    },
    {
      "id": 3,
      "title": "Uppgift 3: Nyheter & Ett samtal om en fest",
      "audio": "spar03.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A1",
          "prompt": "A1. Vad ska äldreboendet använda pengarna till?",
          "options": ["bättre mat", "fler aktiviteter", "mer personal"],
          "answer": "fler aktiviteter"
        },
        {
          "id": "L3_B1",
          "prompt": "B1. Vad säger nyheten om gymnasieskolan? Skolan ska...",
          "options": ["stänga.", "ordna en fest.", "flytta till större lokaler."],
          "answer": "ordna en fest."
        },
        {
          "id": "L3_C1",
          "prompt": "C1. Vad ska Granviks köpcentrum få?",
          "options": ["fler affärer", "längre öppettider", "gratis parkering"],
          "answer": "fler affärer"
        },
        {
          "id": "L3_D1",
          "prompt": "D1. Vad har tågstationen fått?",
          "options": ["en restaurang", "gratis toaletter", "ett större väntrum"],
          "answer": "gratis toaletter"
        },
        {
          "id": "L3_E1",
          "prompt": "E1. Vad har simhallen haft problem med?",
          "options": ["smutsigt vatten", "små omklädningsrum", "kalla duschar"],
          "answer": "smutsigt vatten"
        },
        {
          "id": "L3_A2",
          "prompt": "A2. Ska de åka tillsammans till festen på lördag?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Nej"
        },
        {
          "id": "L3_B2",
          "prompt": "B2. Vad ska de köpa för present?",
          "options": ["Choklad", "Bok", "Biobiljetter"],
          "answer": "Biobiljetter"
        },
        {
          "id": "L3_C2",
          "prompt": "C2. Vem ska köpa presenten?",
          "options": ["Kvinnan", "Mannen", "Båda två tillsammans"],
          "answer": "Båda två tillsammans"
        },
        {
          "id": "L3_D2",
          "prompt": "D2. Ska kvinnan ta med sig sin gitarr?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Kanske"
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Telefonsamtal & Nyheter",
      "audio": "spar04.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A1",
          "prompt": "A1. Gabriella ringer till sitt hyresbolag. Vad vill Gabriella?",
          "options": ["byta lägenhet", "anmäla ett fel", "betala en faktura"],
          "answer": "betala en faktura"
        },
        {
          "id": "L4_B1",
          "prompt": "B1. Senait ringer till ett bussbolag. Vad vill Senait?",
          "options": ["köpa en biljett", "fråga om en tid", "avboka en resa"],
          "answer": "fråga om en tid"
        },
        {
          "id": "L4_C1",
          "prompt": "C1. Olle ringer till sin vän Anna. Vad vill Olle?",
          "options": ["låna pengar", "ge bort en resa", "få hjälp med barnvakt"],
          "answer": "få hjälp med barnvakt"
        },
        {
          "id": "L4_A2",
          "prompt": "A2. Nyhet A: Vad handlar nyheten om?",
          "options": ["Ekonomi", "Väder", "Sport"],
          "answer": "Väder"
        },
        {
          "id": "L4_B2",
          "prompt": "B2. Nyhet B: Vad handlar nyheten om?",
          "options": ["Teknik", "Brott", "Fritid"],
          "answer": "Teknik"
        },
        {
          "id": "L4_C2",
          "prompt": "C2. Nyhet C: Vad handlar nyheten om?",
          "options": ["Resor", "Väder", "Hälsa"],
          "answer": "Hälsa"
        },
        {
          "id": "L4_D2",
          "prompt": "D2. Nyhet D: Vad handlar nyheten om?",
          "options": ["Fritid", "Ekonomi", "Teknik"],
          "answer": "Ekonomi"
        },
        {
          "id": "L4_E2",
          "prompt": "E2. Nyhet E: Vad handlar nyheten om?",
          "options": ["Arbete", "Bostad", "Hälsa"],
          "answer": "Arbete"
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Melissa berättar & Tre telefonsamtal",
      "audio": "spar05.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A1",
          "prompt": "A1. Varför ville Melissa byta yrke? Hon ville få...",
          "options": ["högre lön.", "mer tid med familjen.", "roligare arbetsuppgifter."],
          "answer": "roligare arbetsuppgifter."
        },
        {
          "id": "L5_B1",
          "prompt": "B1. Vad tycker Melissa var det bästa med utbildningen?",
          "options": ["praktiken", "lärarna", "klasskompisarna"],
          "answer": "lärarna"
        },
        {
          "id": "L5_C1",
          "prompt": "C1. Vad tycker Melissa var jobbigast med utbildningen?",
          "options": ["Kursen kostade mycket.", "Skolan var långt hemifrån.", "Det var mycket att läsa."],
          "answer": "Det var mycket att läsa."
        },
        {
          "id": "L5_D1",
          "prompt": "D1. Vad tycker Melissa bäst om med sitt jobb?",
          "options": ["Hon gör människor glada.", "Hon lär sig nya saker.", "Hon har trevliga kollegor."],
          "answer": "Hon gör människor glada."
        },
        {
          "id": "L5_E1",
          "prompt": "E1. Vad vill Melissa göra i framtiden?",
          "options": ["studera mer", "starta eget företag", "fortsätta på samma arbetsplats"],
          "answer": "fortsätta på samma arbetsplats"
        },
        {
          "id": "L5_A2",
          "prompt": "A2. Samtal 1: Vart ringer mannen?",
          "options": ["Till en förskola", "Till en vårdcentral", "Till en restaurang"],
          "answer": "Till en förskola"
        },
        {
          "id": "L5_B2",
          "prompt": "B2. Samtal 2: Vart ringer kvinnan?",
          "options": ["Till en bank", "Till ett bibliotek", "Till en affär"],
          "answer": "Till ett bibliotek"
        },
        {
          "id": "L5_C2",
          "prompt": "C2. Samtal 3: Vart ringer mannen?",
          "options": ["Till ett apotek", "Till en restaurang", "Till en tandläkare"],
          "answer": "Till en tandläkare"
        }
      ]
    },
    {
      "id": 6,
      "title": "Uppgift 6: Anja berättar om Eisenstadt",
      "audio": "spar06.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L6_A",
          "prompt": "A. Varför åkte Anja till Eisenstadt?",
          "options": ["För att studera.", "För att arbeta.", "För att ha semester."],
          "answer": "För att arbeta."
        },
        {
          "id": "L6_B",
          "prompt": "B. Hur bodde Anja i Eisenstadt?",
          "options": ["På ett hotell.", "I en lägenhet.", "Hos en familj."],
          "answer": "I en lägenhet."
        },
        {
          "id": "L6_C",
          "prompt": "C. Vad tyckte Anja var bäst med tiden i Eisenstadt?",
          "options": ["Att hon lärde sig tyska.", "Att staden var fin.", "Att hon fick en ny vän."],
          "answer": "Att hon lärde sig tyska."
        },
        {
          "id": "L6_D",
          "prompt": "D. Ska Anja åka tillbaka till Eisenstadt i sommar?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Kanske"
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

# ==========================================
# 2. READING CONFIG & SECTIONS (A - J)
# ==========================================

$configJson = @'
{
  "year": "2017-11",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt slutprov 11, 2017, Kurs C",
  "passThreshold": 0.6,
  "sections": [
    "A.json",
    "B.json",
    "C.json",
    "D.json",
    "E.json",
    "F.json",
    "G.json",
    "H.json",
    "I.json",
    "J.json"
  ]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Läsa A - Uppgift 1: Lilly är en pigg hundraåring
$secA = @'
{
  "section": "A",
  "icon": "🎂",
  "title": "Läsa A – Uppgift 1: Lilly är en pigg hundraåring",
  "instructions": "Läs artikeln om Lilly Karlsson och svara på frågorna.",
  "texts": [
    {
      "heading": "Lilly är en pigg hundraåring",
      "body": "Det är allt fler människor som lever länge. På fredag fyller Lilly Karlsson i Delsbo hundra år. Hon berättar om sitt långa liv och hur hon ska fira sin 100-årsdag.\n\nLilly växte upp i en by i norra Sverige i början av 1900-talet. Hon hade elva syskon så det fanns alltid någon att leka med.\n- Det var fattigt i alla gårdar, men vi hade ett par kor och några höns på gården så vi fick smör, mjölk och ägg från dem, berättar Lilly.\n\nLilly sitter vid köksbordet på sitt äldreboende. Hon tittar ut genom fönstret och säger:\n- Idag skulle det vara skönt att gå på promenad.\n\nLilly har alltid gillat att röra på sig. När hon var sjuttio år började hon att träna på ett gym.\n- Det blev jag stark av. Det blev lättare att gå i trappor och bära tunga matkassar. Och så var det kul att träffa folk där. Här på äldreboendet har vi gymnastik två gånger i veckan istället. Det är också bra. Jag har blivit för trött för att träna på gymmet, säger Lilly.\n\nLilly tror inte att det är träningen som har gjort att hon har fått leva så länge.\n- Jag har inte gjort något speciellt för att bli hundra år. Varför det blev så förstår jag inte, jag är själv förvånad. Men jag är tacksam över att känna mig pigg, säger Lilly.\n\nLilly berättar hur hon ska fira födelsedagen. I morgon ska hon få hjälp att gå till frisören och bli fin i håret. Och på fredag ska hon bjuda på tårta på äldreboendet. Då kommer hennes son, barnbarn och två yngre systrar och firar henne. Hon kommer också att få ett brev med gratulationer från kungen och drottningen, för det får alla hundraåringar i Sverige.\n\nLillys liv har varit svårt ibland, till exempel när hennes man dog, då kände hon sig ensam. Men hon känner sig ändå mest nöjd när hon tänker tillbaka på sitt långa liv. Hon har arbetat med många olika saker, till exempel som kock, affärsbiträde och städerska. Lilly har också haft tid att dansa och ha kul med sina vänner.\n- Jag var ung och vacker förut. Nu är jag bara vacker, säger Lilly och skrattar."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Vad berättar Lilly om sin familj?",
      "options": [
        "Familjen hade ingen mat.",
        "Familjen hade många barn.",
        "Familjen bodde i stan."
      ],
      "answer": "Familjen hade många barn."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Hur brukar Lilly träna nu när hon är 100 år?",
      "options": [
        "Hon gör gymnastik.",
        "Hon går till ett gym.",
        "Hon dansar."
      ],
      "answer": "Hon gör gymnastik."
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Varför tror Lilly att hon har blivit så gammal?",
      "options": [
        "Hon vet inte varför.",
        "Hon har tränat på gym hela livet.",
        "Hon är glad och positiv."
      ],
      "answer": "Hon vet inte varför."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad ska Lilly göra på sin födelsedag?",
      "options": [
        "Hon ska åka till sin son på fest.",
        "Hon ska träffa kungen och drottningen.",
        "Hon ska ha fest där hon bor."
      ],
      "answer": "Hon ska ha fest där hon bor."
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Vad berättar Lilly om sitt liv?",
      "options": [
        "Allt i hennes liv har varit bra.",
        "Livet har varit både roligt och jobbigt.",
        "Hon har jobbat för mycket."
      ],
      "answer": "Livet har varit både roligt och jobbigt."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: العائلة كان لديها أطفال كثيرون (11 إخوة)، والآن تمارس الجمباز (gymnastik)، ولا تعرف سبب بلوغها 100 عام، وستحتفل في دار المسنين حيث تعيش، وحياتها كانت ممتعة وصعبة أحيانًا.",
    "explanation": "المقال يتحدث عن Lilly التي ستبلغ مئة عام، وعن طفولتها، رياضتها الحالية، احتفالها بعيد ميلادها، وذكريات حياتها.",
    "translation": "قصة حية عن امرأة عمرها 100 عام تحكي عن عائلتها، حركتها، واحتفالها بعيد ميلادها.",
    "vocabulary": [
      "hundraåring (شخص عمره مئة عام)",
      "syskon (إخوة وأخوات)",
      "gymnastik (جمباز / تمارين خفيفة)",
      "födelsedag (عيد ميلad)"
    ],
    "examples": [
      "Hon fyller hundra år på fredag. (ستتم المئة عام يوم الجمعة.)"
    ],
    "tip": "ابحث عن الفروق الدقيقة مثل الفرق بين التدريب في النادي الرياضي قديمًا والجمباز في دار المسنين حاليًا."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A - Uppgift 2: En tabell och ett diagram (Varför tränar du? / Var tränar du?)
$secB = @'
{
  "section": "B",
  "icon": "📊",
  "title": "Läsa A – Uppgift 2: En tabell och ett diagram",
  "instructions": "Tabellen visar varför kvinnor och män i Sverige tränar. Diagrammet visar var de tränar. Svara på frågorna.",
  "texts": [
    {
      "heading": "Tabell: Varför tränar du?",
      "body": "• För att träffa andra: Kvinnor 17%, Män 23%\n• För att gå ner i vikt: Kvinnor 24%, Män 20%\n• För att få bra kondition: Kvinnor 67%, Män 64%\n• För att det är roligt: Kvinnor 53%, Män 53%\n• För att få tävla: Kvinnor 5%, Män 12%\n\nKälla: Svenskarnas idrottsvanor 2011. RF."
    },
    {
      "heading": "Diagram: Var tränar du? (ca %)",
      "body": "• Hemma: ca 45%\n• Utomhus: ca 67%\n• På gym: ca 43%\n• I sporthall: ca 17%\n\nKälla: Special Eurobarometer 412, mars 2014"
    }
  ],
  "charts": [
    {
      "id": "chartWhereTrain201711",
      "type": "bar",
      "title": "Var tränar du? (%)",
      "labels": ["Hemma", "Utomhus", "På gym", "I sporthall"],
      "datasets": [
        {
          "label": "Andel (%)",
          "data": [45, 67, 43, 17],
          "backgroundColor": "#2563eb"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vad är den vanligaste anledningen till att kvinnor och män tränar?",
      "options": [
        "För att träffa andra.",
        "För att gå ner i vikt.",
        "För att få bra kondition.",
        "För att det är roligt.",
        "För att få tävla."
      ],
      "answer": "För att få bra kondition."
    },
    {
      "id": "B_Q2",
      "type": "short",
      "prompt": "B. Hur många procent av männen tränar för att träffa andra?",
      "answer": "23%",
      "acceptedAnswers": ["23%", "23", "23 procent"]
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Var tränar de flesta?",
      "options": ["Hemma", "Utomhus", "På gym", "I sporthall"],
      "answer": "Utomhus"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: السبب الأكثر شيوعًا هو الحصول على لياقة بدنية جيدة (För att få bra kondition)، ونسبة الرجال الذين يتدربون لمقابلة الآخرين هي 23%، ومعظم الناس يتدربون في الخارج (Utomhus).",
    "explanation": "الجدول يقارن أسباب التمرين بين النساء والرجال، والرسم البياني يوضح أماكن التمرين.",
    "translation": "بيانات إحصائية عن أسباب ممارسة الرياضة وأماكنها.",
    "vocabulary": [
      "kondition (لياقة بدنية)",
      "utomhus (في الهواء الطلق / بالخارج)",
      "anledning (سبب)",
      "tävlingsinriktad / tävla (يتنافس)"
    ],
    "examples": [
      "De flesta tränar utomhus. (معظم الناس يتدربون في الخارج.)"
    ],
    "tip": "اقرأ عمود (Män) بدقة عند السؤال عن الرجال، وابحث عن أعلى عمود في الرسم البياني."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A - Uppgift 3: Varför går de på danskurs?
$secC = @'
{
  "section": "C",
  "icon": "💃",
  "title": "Läsa A – Uppgift 3: Varför går de på danskurs?",
  "instructions": "Några personer berättar om varför de går på danskurs. Läs vad personerna säger och svara på frågorna.",
  "texts": [
    {
      "heading": "Rashid",
      "body": "- Jag jobbar mycket och blir ofta stressad. Men när jag dansar slappnar jag av och somnar lätt på kvällen sen när jag kommer hem från kursen."
    },
    {
      "heading": "Kate",
      "body": "- Jag hade aldrig dansat när jag träffade min man. Men eftersom han älskar det bestämde jag mig för att gå en kurs och se om jag också gillar det. Det är svårt men samtidigt bra för mig eftersom vi kan öva hemma."
    },
    {
      "heading": "Mona",
      "body": "- Jag var så trött hela tiden. Då tyckte en kompis till mig att jag skulle följa med hennes danskurs. Jag har aldrig gillat att träna men hon hade rätt. Dansen gör mig både pigg och glad."
    },
    {
      "heading": "Mike",
      "body": "- När jag flyttade till Sverige började jag jobba direkt. Men på helgerna när jag var ledig kände jag mig ensam. Jag anmälde mig till en kurs och hoppades på att få lite nya kontakter. Det var ett bra beslut."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Varför går Rashid på danskurs?",
      "options": ["För att bli glad.", "För att bli lugn.", "För att bli stark."],
      "answer": "För att bli lugn."
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Varför går Kate på danskurs?",
      "options": ["För att prova något nytt.", "För att lära sig svenska.", "För att hitta en partner."],
      "answer": "För att prova något nytt."
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Varför går Mona på danskurs?",
      "options": ["För att träffa nya vänner.", "För att må bra.", "För att bli lugn."],
      "answer": "För att må bra."
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Varför går Mike på danskurs?",
      "options": ["För att lära sig svenska.", "För att träffa nya vänner.", "För att må bra."],
      "answer": "För att träffa nya vänner."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Rashid ليسترخي ويصبح هادئًا (För att bli lugn)، Kate لتجربة شيء جديد، Mona لتشعر بتحسن وصحة جيدة (För att må bra)، وMike للتعرف على أصدقاء/معارف جدد.",
    "explanation": "كل شخص يذكر سببًا مختلفًا للالتحاق بدورة الرقص: الاسترخاء، تجربة شيء جديد، تحسين المزاج، أو تكوين صداقات.",
    "translation": "أسباب مختلفة للذهاب إلى دورة رقص.",
    "vocabulary": [
      "danskurs (دورة رقص)",
      "slappna av (يسترخي)",
      "prova något nytt (يجرب شيئًا جديدًا)",
      "nya kontakter (معارف جدد)"
    ],
    "examples": [
      "Jag dansar för att slappna av. (أرقص لكي أسترخي.)"
    ],
    "tip": "اربط الجملة الأخيرة في كلام كل شخص بالاختيار الذي يعبر عن هدفه."
  }
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A - Uppgift 4: Vad är viktigt för att må bra?
$secD = @'
{
  "section": "D",
  "icon": "💛",
  "title": "Läsa A – Uppgift 4: Vad är viktigt för att må bra?",
  "instructions": "Läs texterna och välj rätt siffra bland alternativen:\n1. Att skratta | 2. Att vila | 3. Att sporta | 4. Att vara utomhus | 5. Att kramas | 6. Att äta gott | 7. Att hjälpa andra",
  "texts": [
    {
      "heading": "A. Camilla",
      "body": "- Jag älskar att hitta på egna recept men också att smaka nya spännande rätter. Det är härligt att njuta av en måltid tillsammans med någon som man tycker om."
    },
    {
      "heading": "B. Joram",
      "body": "- Att träna var viktigt för mig förut. Men nu har jag två små barn att ta hand om. För att orka det är det viktigt för mig att sova åtta timmar på natten och inte göra någonting alls ibland."
    },
    {
      "heading": "C. Ida",
      "body": "- Vintern är här och det är kallt. Många av de som inte har något hem sover ute. Därför har jag börjat samla in kläder och skor som jag ska ge till dem. Det blir jag glad av."
    },
    {
      "heading": "D. Toni",
      "body": "- Att sitta i soffan och mysa med min flickvän får mig att må bra. När hon är nära mig och vi håller om varandra känner jag mig lycklig. Jag har läst att kroppskontakt är bra mot stress."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Camilla – välj rätt alternativ (1–7):",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "6"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Joram – välj rätt alternativ (1–7):",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "2"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Ida – välj rätt alternativ (1–7):",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "7"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Toni – välj rätt alternativ (1–7):",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "5"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Camilla → 6 (الأكل الجيد/الوجبات)، Joram → 2 (الراحة والنوم)، Ida → 7 (مساعدة الآخرين)، Toni → 5 (العناق/القرب الجسدي).",
    "explanation": "كل شخص يوضح ما يجعله يشعر بالراحة والسعادة في حياته اليومية.",
    "translation": "نصوص قصيرة حول ما يساعد على الشعور بالرضا والسعادة.",
    "vocabulary": [
      "måltid (وجبة)",
      "vila (راحة)",
      "hjälpa andra (مساعدة الآخرين)",
      "kramas (يتعانق)"
    ],
    "examples": [
      "Det är viktigt att vila när man är trött. (من المهم أن ترتاح عندما تكون متعبًا.)"
    ],
    "tip": "ابحث عن الكلمات الدالة على النشاط الأساسي لكل شخصية."
  }
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsa A - Uppgift 5: Läsarnas sida
$secE = @'
{
  "section": "E",
  "icon": "📰",
  "title": "Läsa A – Uppgift 5: Läsarnas sida",
  "instructions": "Läs vad personerna har skrivit på läsarnas sida och svara på frågorna genom att välja rätt namn.",
  "texts": [
    {
      "heading": "Talita",
      "body": "Ni som röker på balkongen, var snälla och sluta med det! Röken kommer in i andras lägenheter. Dessutom är det inte kul med fimparna på marken."
    },
    {
      "heading": "Gunnar",
      "body": "Nu när det är vinter och mörkt ute, glöm inte att sätta på reflexer på er själva, era barn och husdjur. Det är den bästa och billigaste livförsäkringen."
    },
    {
      "heading": "Ellen",
      "body": "Du som hjälpte mig till sjukhuset när jag ramlade vid stationen i Råstad den 27/8. Jag skadade mig i foten men mår bra nu. Tyvärr vet jag inte vad du heter men jag vill ge dig en stor kram. Utan dig vet jag inte hur det hade gått!"
    },
    {
      "heading": "Johan",
      "body": "Du äldre kvinna eller man! Vår familj tycker om att lära känna nya människor. Våra barn vill ha en extra mormor eller morfar. Vill du komma och fika eller äta middag med oss ibland? Du är varmt välkommen! Tidningen har mitt telefonnummer."
    },
    {
      "heading": "Karin",
      "body": "Jag bor ensam med min hund, Lajka. Nu har jag brutit benet och kan inte promenera. Tycker du om djur och har tid och lust att gå ut med min hund så är du välkommen att höra av dig till mig. Tidningen har mitt telefonnummer."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vem vill tacka för något?",
      "options": ["Talita", "Gunnar", "Ellen", "Johan", "Karin"],
      "answer": "Ellen"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vem vill be om hjälp?",
      "options": ["Talita", "Gunnar", "Ellen", "Johan", "Karin"],
      "answer": "Karin"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vem är arg på något?",
      "options": ["Talita", "Gunnar", "Ellen", "Johan", "Karin"],
      "answer": "Talita"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vem vill bjuda hem någon?",
      "options": ["Talita", "Gunnar", "Ellen", "Johan", "Karin"],
      "answer": "Johan"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: يشكر على المساعدة → Ellen، يطلب مساعدة (تمشية الكلب بعد كسر الساق) → Karin، غاضب من التدخين والأعقاب → Talita، يدعو إلى المنزل/القهوة أو العشاء → Johan.",
    "explanation": "رسائل القرّاء تعبر عن مواقف مختلفة: شكر، طلب مساعدة، انزعاج/غضب، أو دعوة.",
    "translation": "رسائل متنوعة من قراء الصحيفة حول مواقف يومية.",
    "vocabulary": [
      "tacka (يشكر)",
      "be om hjälp (يطلب مساعدة)",
      "arg (غاضب / منزعج)",
      "bjuda hem (يدعو إلى المنزل)"
    ],
    "examples": [
      "Ellen vill tacka den som hjälpte henne. (Ellen تريد أن تشكر من ساعدها.)"
    ],
    "tip": "ابحث عن الشعور أو الطلب الأساسي في رسالة كل شخص."
  }
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Läsa B - Uppgift 1: Vad tycker de? (Smileys)
$secF = @'
{
  "section": "F",
  "icon": "😊",
  "title": "Läsa B – Uppgift 1: Vad tycker de? (Smileys)",
  "instructions": "Läs vad personerna tycker om att använda smileys när man skickar sms och mejl och svara på frågorna.",
  "texts": [
    {
      "heading": "Gunilla",
      "body": "- Med smileys går det lättare att skicka sms. Det finns ju så många olika nu. Det går snabbt att meddela saker. Ett sms ser lite tråkigt ut utan en smiley tycker jag."
    },
    {
      "heading": "Nevzat",
      "body": "- Jag tycker att det är barnsligt när vuxna människor har smileys i varenda mening. De behövs inte, tycker jag."
    },
    {
      "heading": "Rebecka",
      "body": "- Det beror på vem man skriver till. När man söker ett jobb eller mejlar till sin chef passar det inte. Men till min pojkvän skickar jag alltid en smiley eller ett hjärta, annars tror han att jag är sur."
    },
    {
      "heading": "Yosuf",
      "body": "- Det är lätt att missförstå varandra när man skickar sms. Man ser inte om en person är glad eller ledsen. Därför lägger jag gärna till en smiley när jag messar."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Vad tycker Gunilla om smileys?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Bra"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vad tycker Nevzat om smileys?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Dåligt"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Rebecka om smileys?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Både bra och dåligt"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Yosuf om smileys?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Bra"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Gunilla → Bra، Nevzat → Dåligt، Rebecka → Både bra och dåligt (حسب الشخص المرسل إليه)، Yosuf → Bra.",
    "explanation": "الآراء تختلف حول استخدام الرموز التعبيرية (smileys) في الرسائل بين مؤيد ومعارض ومحايد حسب الموقف.",
    "translation": "آراء أربعة أشخاص حول استخدام الـ smileys في الرسائل.",
    "vocabulary": [
      "missförstå (يسيء الفهم)",
      "barnsligt (طفولي)",
      "chef (مدير)",
      "skicka sms (يرسل رسالة نصية)"
    ],
    "examples": [
      "Det beror på vem man skriver till. (يعتمد ذلك على الشخص الذي تكتب إليه.)"
    ],
    "tip": "إذا ذكر الشخص حالتين مختلفتين (مناسب في حالة وغير مناسب في أخرى)، فالاختيار غالبًا Både bra och dåligt."
  }
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Läsa B - Uppgift 2: Ett protokoll (Klassråd)
$secG = @'
{
  "section": "G",
  "icon": "📝",
  "title": "Läsa B – Uppgift 2: Ett protokoll",
  "instructions": "Läs protokollet från klassrådet och välj rätt rubrik (1–6):\n1. Receptionen | 2. Lektionerna | 3. Elevköket | 4. Schemat | 5. Datorerna | 6. Toaletterna",
  "texts": [
    {
      "heading": "A",
      "body": "Det är ofta kladdigt i mikrougnen. Den klass som har städvecka måste bli bättre på att hålla rent och snyggt i lokalen. Glöm inte att torka borden och tömma diskmaskinen varje dag."
    },
    {
      "heading": "B",
      "body": "En del hörlurar är trasiga och ibland kan man inte logga in. Vi vill ha fler språkprogram installerade så vi kan öva på egen hand. Obs! Förbjudet att fika samtidigt!"
    },
    {
      "heading": "C",
      "body": "Vi får för mycket papperskopior. Det är bättre att ha en bok att läsa i. Vår lärare berättar att hon har beställt böcker. Vi vill diskutera mer i klassrummet och öva på att skriva oftare."
    },
    {
      "heading": "D",
      "body": "Vår lärare påminner om tiderna: 8.00–11.30 varje dag! Rasten är aldrig mer än 20 minuter. Försök att passa tiden! Många elever i gruppen tycker att det är för tidigt att börja klockan åtta. Det är lättare att komma i tid om vi börjar nio."
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "A. Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "B. Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "G_Q3",
      "type": "mcq",
      "prompt": "C. Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    },
    {
      "id": "G_Q4",
      "type": "mcq",
      "prompt": "D. Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: A → 3 (مطبخ الطلاب / Elevköket)، B → 5 (أجهزة الكمبيوتر / Datorerna)، C → 2 (الدروس / Lektionerna)، D → 4 (الجدول الزمني / Schemat).",
    "explanation": "محضر اجتماع الصف يناقش الميكروويف والنظافة، أجهزة الكمبيوتر والبرامج، الكتب والدروس، ومواعيد البداية والاستراحة.",
    "translation": "نقاط محضر اجتماع الصف حول مرافق المدرسة والدراسة والمواعيد.",
    "vocabulary": [
      "mikrougn (ميكروويف)",
      "hörlurar (سماعات رأس)",
      "lektioner (دروس)",
      "schema (جدول مواعيد)"
    ],
    "examples": [
      "Vi börjar lektionen klockan åtta. (نبدأ الدرس الساعة الثامنة.)"
    ],
    "tip": "اربط كل فقرة بالمحور الأساسي: المطبخ، الكمبيوتر، الدروس، أو المواعيد."
  }
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Läsa B - Uppgift 3: Annonser i lokaltidningen
$secH = @'
{
  "section": "H",
  "icon": "📣",
  "title": "Läsa B – Uppgift 3: Annonser i lokaltidningen",
  "instructions": "Läs annonserna (1–5) och välj rätt siffra för varje person:\n1. Problem hemma? Samtalsgrupp för dig som har en tonåring (Biblioteket måndagar kl. 19–20)\n2. Intressant kväll om kroppsspråk (Runbyskolans matsal, tisdag 4 oktober kl. 18.30)\n3. Sjung med oss! Vi sjunger och leker med våra barn och fikar (Musikhuset onsdagar kl. 10–11)\n4. Internationella vänner – ny vän och öva svenska (www.lv.univ.nu)\n5. Lär dig att kommunicera! Brev, mejl, chatt, blogg, PC och surfplatta (www.text.univ.nu)",
  "texts": [
    {
      "heading": "Personer (A–D)",
      "body": "• Irma: Irma vill bli bättre på att använda sin dator.\n• Abdul: Abdul är hemma med sin lilla dotter och vill träffa andra föräldrar.\n• Axel: Axel vill lära känna någon från ett annat land.\n• Hanna: Hanna bråkar mycket med sin 14-årige son."
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "A. Irma – Vilken annons passar bäst (1–5)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "B. Abdul – Vilken annons passar bäst (1–5)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "C. Axel – Vilken annons passar bäst (1–5)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "H_Q4",
      "type": "mcq",
      "prompt": "D. Hanna – Vilken annons passar bäst (1–5)?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Irma → 5 (الكمبيوتر والكتابة/التواصل)، Abdul → 3 (الغناء واللعب مع الأطفال والآباء)، Axel → 4 (أصدقاء دوليون وتدريب اللغة)، Hanna → 1 (مجموعة حوار لمن لديه مراهق).",
    "explanation": "كل شخص يبحث عن نشاط أو مساعدة محددة تناسب وضعه الأسري أو الاجتماعي أو التعليمي.",
    "translation": "مطابقة احتياجات الأشخاص مع الإعلانات المحلية.",
    "vocabulary": [
      "tonåring (مراهق)",
      "föräldrar (آباء وأمهات)",
      "kommunicera (يتواصل)",
      "vän (صديق)"
    ],
    "examples": [
      "Han vill träffa nya vänner från ett annat land. (يريد مقابلة أصدقاء جدد من بلد آخر.)"
    ],
    "tip": "طابق الكلمات المفتاحية مثل dator أو tonåring أو barn مع الإعلان المناسب."
  }
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

# Section I: Läsa B - Uppgift 4: En intervju med Fredrik
$secI = @'
{
  "section": "I",
  "icon": "🗺️",
  "title": "Läsa B – Uppgift 4: En intervju med Fredrik",
  "instructions": "Läs frågorna (A–D) och välj rätt svar bland alternativen (1–5):\n1. Min favoritplats i Stockholm är Gamla Stan...\n2. Det är när jag får bra kontakt med folk och ser att de gillar att lyssna på mig.\n3. Man måste veta hur man berättar om saker på ett spännande sätt så att folk blir intresserade. Det är också bra att kunna tala många språk.\n4. För att jag är intresserad av historia och gamla byggnader. När en vän tipsade mig om en guidekurs, anmälde jag mig direkt.\n5. Det brukar bli en helg varannan vecka eftersom jag studerar på vardagarna.",
  "texts": [
    {
      "heading": "Intervju med guiden Fredrik",
      "body": "Fredrik arbetar som guide och visar platser för turister."
    }
  ],
  "questions": [
    {
      "id": "I_Q1",
      "type": "mcq",
      "prompt": "A. Varför utbildade du dig till guide? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "I_Q2",
      "type": "mcq",
      "prompt": "B. Vad behöver man kunna när man är guide? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "I_Q3",
      "type": "mcq",
      "prompt": "C. Hur ofta jobbar du som guide? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "I_Q4",
      "type": "mcq",
      "prompt": "D. Vad är det bästa med att vara guide? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: A → 4 (الاهتمام بالتاريخ والمباني القديمة)، B → 3 (الحكي الشيق والتحدث بلغات)، C → 5 (عطلة نهاية أسبوع كل أسبوعين)، D → 2 (التواصل الجيد واستماع الناس).",
    "explanation": "مقابلة مع المرشد السياحي Fredrik حول سبب اختياره للمهنة، المهارات المطلوبة، مواعيد العمل، وأفضل ما فيها.",
    "translation": "إجابات المرشد السياحي Fredrik على أسئلة المقابلة.",
    "vocabulary": [
      "guide (مرشد سياحي)",
      "historia (تاريخ)",
      "språk (لغة)",
      "helg (عطلة نهاية الأسبوع)"
    ],
    "examples": [
      "Jag gillar historia och gamla byggnader. (أحب التاريخ والمباني القديمة.)"
    ],
    "tip": "ركّز على أداة الاستفهام (Varför, Vad behöver man kunna, Hur ofta, Vad är det bästa)."
  }
}
'@
Set-Content -Path "$readingDir/I.json" -Value $secI -Encoding utf8

# Section J: Läsa B - Uppgift 5: Meddelanden till vänner
$secJ = @'
{
  "section": "J",
  "icon": "✉️",
  "title": "Läsa B – Uppgift 5: Meddelanden till vänner",
  "instructions": "Anna skriver till sina vänner: \"Jag fyller år på lördag och det skulle vara kul att ses! Kom till Café Kakan kl. 16:00 så bjuder jag på fika.\" Läs svaren och svara på frågorna.",
  "texts": [
    {
      "heading": "Björn",
      "body": "- Åh, jag hade glömt att du fyller år! Jag och Stina har köpt biljetter till en konsert på lördag. Om vi kan byta dem så kommer vi. Jag hör av mig när jag vet!"
    },
    {
      "heading": "Iris",
      "body": "- Anna! Jag ser fram emot att få träffa dig på lördag! Önskar du dig något speciellt? Kram, Iris"
    },
    {
      "heading": "Tomas",
      "body": "- Hej Anna, vad trevligt det låter! Det skulle vara kul att ses men vi ska hälsa på min svärfar i helgen. Ni får ha det så bra! Vi hörs!"
    },
    {
      "heading": "Elsa",
      "body": "- Hej! Jag spelar en viktig match vid tvåtiden så jag blir lite sen. Hoppas att det inte gör något! Vi ses / Elsa"
    }
  ],
  "questions": [
    {
      "id": "J_Q1",
      "type": "mcq",
      "prompt": "A. Kan Björn komma?",
      "options": ["Ja", "Nej", "Kanske"],
      "answer": "Kanske"
    },
    {
      "id": "J_Q2",
      "type": "mcq",
      "prompt": "B. Kan Iris komma?",
      "options": ["Ja", "Nej", "Kanske"],
      "answer": "Ja"
    },
    {
      "id": "J_Q3",
      "type": "mcq",
      "prompt": "C. Kan Tomas komma?",
      "options": ["Ja", "Nej", "Kanske"],
      "answer": "Nej"
    },
    {
      "id": "J_Q4",
      "type": "mcq",
      "prompt": "D. Kan Elsa komma?",
      "options": ["Ja", "Nej", "Kanske"],
      "answer": "Ja"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Björn → Kanske (إذا استطاع تبديل التذاكر)، Iris → Ja، Tomas → Nej (سيزور حماه في عطلة نهاية الأسبوع)، Elsa → Ja (ستأتي متأخرة قليلًا بعد المباراة).",
    "explanation": "ردود الأصدقاء على دعوة عيد الميلاد توضح من سيحضر، من يعتذر، ومن يعتمد حضوره على ظرف آخر.",
    "translation": "ردود الأصدقاء على دعوة لقاء في المقهى بمناسبة عيد الميلاد.",
    "vocabulary": [
      "födelsedag (عيد ميلاد)",
      "fika (قهوة وكعك)",
      "konsert (حفل موسيقي)",
      "sen (متأخر)"
    ],
    "examples": [
      "Jag blir lite sen eftersom jag har en match. (سأتأخر قليلًا لأن لدي مباراة.)"
    ],
    "tip": "انتبه لكلمات مثل 'Om vi kan byta dem' (Kanske) أو 'men vi ska hälsa på...' (Nej)."
  }
}
'@
Set-Content -Path "$readingDir/J.json" -Value $secJ -Encoding utf8

# ==========================================
# 3. WRITING (writing.json)
# ==========================================

$writingJson = @'
{
  "examId": "2017-11",
  "title": "Skriva – Skriv ett mejl till din vän",
  "prompt": "Du har en vän som aldrig har varit hemma hos dig och nu ska komma hem till dig.\n\nSkriv ett mejl till din vän. Du ska skriva om några av de här sakerna:\n• berätta varför vännen ska komma\n• ge förslag på dag och tid\n• beskriv var du bor\n• berätta vad du ska bjuda på\n• ge förslag på något som ni kan göra hos dig\n\nTänk på hur du börjar och avslutar brevet!",
  "modelResponse": "Hej vännen!\n\nJag hoppas att du mår bra! Det var så länge sedan vi sågs, och eftersom du aldrig har varit hemma hos mig skulle jag bli jätteglad om du ville komma på besök.\n\nJag bor i en fin lägenhet nära centrum, bara fem minuter med buss från stationen. Skulle det passa att komma nu på lördag klockan 15.00? Jag tänkte bjuda på nybryggt kaffe, te och hembakad kaka.\n\nEfter fikat kan vi lyssna på musik, prata ikapp och kanske spela ett sällskapsspel eller ta en promenad i parken i närheten.\n\nHör av dig och säg om dagen och tiden passar dig!\n\nVänliga hälsningar,\n[Ditt namn]",
  "arabicNotes": {
    "summary": "المطلوب: كتابة بريد إلكتروني لصديق لم يزر منزلك من قبل، مع ذكر سبب الدعوة، اقتراح اليوم والوقت، وصف مكان السكن، ما ستقدمه من ضيافة، ونشاط يمكن القيام به.",
    "explanation": "احرص على استخدام تحية مناسبة في البداية (Hej...) وخاتمة مناسبة (Vänliga hälsningar...)، وربط الجمل بوضوح لمستوى SFI Kurs C.",
    "translation": "رسالة دعوة صديق لزيارة المنزل لأول مرة.",
    "vocabulary": [
      "bjuda på (يدعو إلى / يضيف)",
      "förslag (اقتراح)",
      "beskriv (يصف)",
      "hälsningar (تحيات)"
    ],
    "examples": [
      "Jag bor nära centrum och bjuder på fika. (أسكن بالقرب من المركز وأدعوك إلى فيكا.)"
    ],
    "tip": "تأكد من تغطية معظم النقاط المطلوبة في المهمة وكتابة فقرات مترابطة."
  }
}
'@
Set-Content -Path "$writingDir/writing.json" -Value $writingJson -Encoding utf8

Write-Host "=== Successfully populated 2017-11 Listening, Reading, and Writing! ===" -ForegroundColor Cyan
