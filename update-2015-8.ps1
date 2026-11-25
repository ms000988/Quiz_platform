# update-2015-8.ps1 - Populates Listening and Reading (with Arabic notes) for 2015-8

Write-Host "Populating Listening and Reading data for 2015-8..." -ForegroundColor Cyan

$examDir = "data/sfi/2015-8"
$listeningDir = Join-Path $examDir "listening"
$readingDir = Join-Path $examDir "reading"

New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $readingDir -Force | Out-Null

# ==========================================
# 1. LISTENING (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2015-8",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Några personer berättar (hur ofta de tränar och vad de gör för att inte bli sjuka)",
      "audio": "spar01.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Hur ofta tränar Natalia?",
          "options": ["Aldrig", "En gång i veckan", "Några gånger i veckan", "Alla dagar i veckan"],
          "answer": "Aldrig"
        },
        {
          "id": "L1_B",
          "prompt": "B. Vad tycker Natalia är viktigt för att inte bli sjuk?",
          "options": ["Frisk luft", "Mat", "Kompisar", "Motion", "Sömn"],
          "answer": "Sömn"
        },
        {
          "id": "L1_C",
          "prompt": "C. Hur ofta tränar Marcus?",
          "options": ["Aldrig", "En gång i veckan", "Några gånger i veckan", "Alla dagar i veckan"],
          "answer": "En gång i veckan"
        },
        {
          "id": "L1_D",
          "prompt": "D. Vad tycker Marcus är viktigt för att inte bli sjuk?",
          "options": ["Frisk luft", "Mat", "Kompisar", "Motion", "Sömn"],
          "answer": "Mat"
        },
        {
          "id": "L1_E",
          "prompt": "E. Hur ofta tränar Frida?",
          "options": ["Aldrig", "En gång i veckan", "Några gånger i veckan", "Alla dagar i veckan"],
          "answer": "Några gånger i veckan"
        },
        {
          "id": "L1_F",
          "prompt": "F. Vad tycker Frida är viktigt för att inte bli sjuk?",
          "options": ["Frisk luft", "Mat", "Kompisar", "Motion", "Sömn"],
          "answer": "Motion"
        },
        {
          "id": "L1_G",
          "prompt": "G. Hur ofta tränar Emil?",
          "options": ["Aldrig", "En gång i veckan", "Några gånger i veckan", "Alla dagar i veckan"],
          "answer": "Några gånger i veckan"
        },
        {
          "id": "L1_H",
          "prompt": "H. Vad tycker Emil är viktigt för att inte bli sjuk?",
          "options": ["Frisk luft", "Mat", "Kompisar", "Motion", "Sömn"],
          "answer": "Frisk luft"
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Ett samtal (hälsa på en studiekamrat som är sjuk)",
      "audio": "spar02.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. Ska de ta med sig middag?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Nej"
        },
        {
          "id": "L2_B",
          "prompt": "B. Ska de köpa choklad?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Ja"
        },
        {
          "id": "L2_C",
          "prompt": "C. Ska de åka buss?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Nej"
        },
        {
          "id": "L2_D",
          "prompt": "D. Ska de hyra en film?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Kanske"
        }
      ]
    },
    {
      "id": 3,
      "title": "Uppgift 3: Telefonsvarare",
      "audio": "spar03.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A",
          "prompt": "A. Telefonsvarare på en frisörsalong: När stänger frisörsalongen på torsdagar?",
          "options": ["Klockan 16", "Klockan 17", "Klockan 18", "Klockan 21"],
          "answer": "Klockan 17"
        },
        {
          "id": "L3_B",
          "prompt": "B. Telefonsvarare på ett försäkringsbolag: Du har tappat din mobil. Vilken knapp ska du trycka på?",
          "options": ["1", "2", "3", "4"],
          "answer": "3"
        },
        {
          "id": "L3_C",
          "prompt": "C. Telefonsvarare på en vårdcentral: Du vill boka en tid. Vad ska du göra?",
          "options": ["Lämna ett meddelande.", "Ringa på telefontiden.", "Ringa sjuksköterska."],
          "answer": "Ringa på telefontiden."
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Fyra nyheter",
      "audio": "spar04.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A",
          "prompt": "A. Vad handlar nyheten om?",
          "options": ["Resor", "Väder", "Trafik"],
          "answer": "Väder"
        },
        {
          "id": "L4_B",
          "prompt": "B. Vad handlar nyheten om?",
          "options": ["Arbete", "Resor", "Utbildning"],
          "answer": "Arbete"
        },
        {
          "id": "L4_C",
          "prompt": "C. Vad handlar nyheten om?",
          "options": ["Arbete", "Fritid", "Utbildning"],
          "answer": "Utbildning"
        },
        {
          "id": "L4_D",
          "prompt": "D. Vad handlar nyheten om?",
          "options": ["Hälsa", "Trafik", "Väder"],
          "answer": "Trafik"
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Tre telefonsamtal",
      "audio": "spar05.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. Samtal 1 – Zack ringer till en bank. Vad vill Zack?",
          "options": ["Boka ett möte.", "Öppna ett konto.", "Beställa ett betalkort."],
          "answer": "Beställa ett betalkort."
        },
        {
          "id": "L5_B",
          "prompt": "B. Samtal 2 – Magda ringer till ett hotell. Vad vill Magda?",
          "options": ["Ändra en bokning.", "Klaga på hotellet.", "Betala för ett rum."],
          "answer": "Ändra en bokning."
        },
        {
          "id": "L5_C",
          "prompt": "C. Samtal 3 – Samuel ringer till en vårdcentral. Vad vill Samuel?",
          "options": ["Fråga om öppettider.", "Förnya ett recept.", "Be om råd."],
          "answer": "Förnya ett recept."
        }
      ]
    },
    {
      "id": 6,
      "title": "Uppgift 6: En läkare berättar (Klara)",
      "audio": "spar06.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L6_A",
          "prompt": "A. Varför ville Klara bli läkare?",
          "options": [
            "Hennes föräldrar var läkare.",
            "Hon gick en intressant kurs.",
            "Hon tyckte om att arbeta inom vården."
          ],
          "answer": "Hon tyckte om att arbeta inom vården."
        },
        {
          "id": "L6_B",
          "prompt": "B. Vad tyckte Klara var svårt under utbildningen?",
          "options": [
            "Att få vänner.",
            "Att bo utomlands.",
            "Att studera på ett annat språk."
          ],
          "answer": "Att studera på ett annat språk."
        },
        {
          "id": "L6_C",
          "prompt": "C. Vad tycker Klara är bäst med sitt arbete?",
          "options": [
            "Arbetskamraterna.",
            "Arbetstiderna.",
            "Arbetsuppgifterna."
          ],
          "answer": "Arbetsuppgifterna."
        },
        {
          "id": "L6_D",
          "prompt": "D. Vad säger Klara om sig själv som läkare?",
          "options": [
            "Hon är bra på att kommunicera.",
            "Hon tycker om att planera.",
            "Hon är snabb."
          ],
          "answer": "Hon är bra på att kommunicera."
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
  "year": "2015-8",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt slutprov 8, 2015, Kurs C",
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

# Section A: Läsa A - Uppgift 1: Joakim är lokförare
$secA = @'
{
  "section": "A",
  "icon": "🚆",
  "title": "Läsa A – Uppgift 1: Joakim är lokförare",
  "instructions": "Läs artikeln om lokföraren Joakim Malm och svara på frågorna.",
  "texts": [
    {
      "heading": "Joakim är lokförare",
      "body": "Joakim Malm har alltid varit intresserad av teknik. Hans första jobb var som maskinoperatör på en fabrik men efter ett tag ville han göra något annat.\n- Jag sökte och kom in på lokförarutbildningen. Sedan fick jag jobb direkt, berättar Joakim.\n\nNu kör han ofta tåg mellan Malmö och Stockholm. Tågen går snabbt, den högsta hastigheten är 200 kilometer i timmen.\n\nOm man funderar på att jobba som lokförare måste man tycka om att ta ansvar, berättar Joakim. Men det viktigaste är att man kan klara av stressiga situationer, även när det är mycket att göra.\n- Jag kan till exempel inte hålla på med mobilen eller göra något annat under tiden jag kör. Det är också jag som informerar passagerarna om nästa stopp, säger Joakim.\n\nDet som han gillar mest med yrket är att han har mycket ansvar.\n- Jag kör ibland med 400 passagerare i ett 165 meter långt tåg och måste ofta ta många beslut själv. Men det är roligt att ha det ansvaret. Som lokförare får man också bra betalt, tillägger Joakim.\n\nJoakim Malm är lokförare för persontåg. Däremot är han inte nöjd med att jobba så oregelbundet. Varannan helg och ungefär tre till fyra gånger i månaden måste han sova över i en annan stad. Det tycker han kan vara jobbigt. Joakim säger också att det kan vara svårt att planera in saker direkt efter arbetsdagen eftersom tågen ofta blir försenade.\n\nPå frågan om det blir någon tid över till andra intressen svarar Joakim med ett leende:\n- Jo, lite. Jag spelar elgitarr i ett rockband och det tycker jag är jättekul.\n\nKälla: www.arbetsförmedlingen.se (Texten är bearbetad)"
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Varför ville Joakim bli lokförare?",
      "options": [
        "Han ville jobba med människor.",
        "Han ville byta jobb.",
        "Han ville resa mer."
      ],
      "answer": "Han ville byta jobb."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Hur ska en bra lokförare vara, tycker Joakim?",
      "options": [
        "Lugn",
        "Snabb",
        "Trevlig"
      ],
      "answer": "Lugn"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Joakim är dåligt med att vara lokförare?",
      "options": [
        "Lönen",
        "Passagerarna",
        "Arbetstiderna"
      ],
      "answer": "Arbetstiderna"
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad handlar texten mest om?",
      "options": [
        "Joakims utbildning.",
        "Joakims jobb.",
        "Joakims fritid."
      ],
      "answer": "Joakims jobb."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: أراد تغيير عمله (Han ville byta jobb)، يجب أن يكون هادئًا ويتحمل المواقف المجهدة (Lugn)، وما يزعجه هو مواعيد العمل غير المنتظمة (Arbetstiderna)، والنص يتحدث بشكل رئيسي عن عمل Joakim (Joakims jobb).",
    "explanation": "المقال يحكي عن Joakim الذي يعمل سائق قطار، وكيف انتقل إلى هذه المهنة، وما يحبه فيها، وما يجده صعبًا بسبب ساعات العمل والتأخيرات.",
    "translation": "مقال عن مهنة سائق القطار Joakim ومميزاتها وصعوباتها.",
    "vocabulary": [
      "lokförare (سائق قطار)",
      "ansvar (مسؤولية)",
      "arbetstider (مواعيد العمل)",
      "yrke (مهنة)"
    ],
    "examples": [
      "Det är ett stort ansvar att köra tåg. (قيادة القطار مسؤولية كبيرة.)"
    ],
    "tip": "ابحث عن الفقرات التي تشرح سبب تغيير العمل، صفات السائق الجيد، والجانب السلبي في ساعات العمل."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A - Uppgift 2: Ett diagram (Hur kommer du till arbetet eller skolan?)
$secB = @'
{
  "section": "B",
  "icon": "📊",
  "title": "Läsa A – Uppgift 2: Ett diagram",
  "instructions": "Diagrammet visar hur invånare i en kommun kommer till arbetet eller skolan. Svara på frågorna.",
  "texts": [
    {
      "heading": "Diagram: Hur kommer du till arbetet eller skolan?",
      "body": "• 15–24 år: Promenerar 12%, Cyklar 38%, Åker bil 25%, Åker buss 25%\n• 25–44 år: Promenerar 5%, Cyklar 17%, Åker bil 75%, Åker buss 3%\n• 45–64 år: Promenerar 5%, Cyklar 26%, Åker bil 68%, Åker buss 1%\n\nKälla: Piteå kommun, 2015"
    }
  ],
  "charts": [
    {
      "id": "chartCommute201508",
      "type": "bar",
      "title": "Hur kommer du till arbetet eller skolan? (%)",
      "labels": ["15-24 år", "25-44 år", "45-64 år"],
      "datasets": [
        {
          "label": "Promenerar (%)",
          "data": [12, 5, 5],
          "backgroundColor": "#eab308"
        },
        {
          "label": "Cyklar (%)",
          "data": [38, 17, 26],
          "backgroundColor": "#93c5fd"
        },
        {
          "label": "Åker bil (%)",
          "data": [25, 75, 68],
          "backgroundColor": "#9a3412"
        },
        {
          "label": "Åker buss (%)",
          "data": [25, 3, 1],
          "backgroundColor": "#2563eb"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vilken åldersgrupp promenerar mest till arbetet eller skolan?",
      "options": ["15-24 år", "25-44 år", "45-64 år"],
      "answer": "15-24 år"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Hur kommer åldersgruppen 15-24 år oftast till arbetet eller skolan?",
      "options": ["Promenerar", "Cyklar", "Åker bil", "Åker buss"],
      "answer": "Cyklar"
    },
    {
      "id": "B_Q3",
      "type": "short",
      "prompt": "C. Hur många procent i åldersgruppen 25-44 år åker bil?",
      "answer": "75%",
      "acceptedAnswers": ["75%", "75", "75 procent"]
    },
    {
      "id": "B_Q4",
      "type": "short",
      "prompt": "D. Hur många procent i åldersgruppen 45-64 år cyklar?",
      "answer": "26%",
      "acceptedAnswers": ["26%", "26", "26 procent"]
    }
  ],
  "arabicNotes": {
    "summary": "الحل: الفئة العمرية الأكثر مشيًا هي 15–24 سنة (12%)، وفئة 15–24 سنة تذهب غالبًا بالدراجة (38%)، ونسبة من يذهبون بالسيارة في فئة 25–44 سنة هي 75%، ونسبة من يركبون الدراجة في فئة 45–64 سنة هي 26%.",
    "explanation": "الرسم البياني يقارن وسائل التنقل للعمل أو المدرسة عبر ثلاث فئات عمرية.",
    "translation": "إحصاءات وسائل التنقل حسب الفئة العمرية.",
    "vocabulary": [
      "åldersgrupp (فئة عمرية)",
      "promenerar (يمشي)",
      "cyklar (يركب الدراجة)",
      "åker bil (يذهب بالسيارة)"
    ],
    "examples": [
      "75 procent i åldersgruppen 25–44 år åker bil. (75% في الفئة العمرية 25–44 سنة يذهبون بالسيارة.)"
    ],
    "tip": "طابق الفئة العمرية أولًا ثم اقرأ العمود أو النسبة المئوية بدقة."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A - Uppgift 3: Annonser (Trafikskolor)
$secC = @'
{
  "section": "C",
  "icon": "🚗",
  "title": "Läsa A – Uppgift 3: Annonser",
  "instructions": "Läs annonserna (1–4) från fyra trafikskolor och välj rätt siffra:\n1. Björkö Trafikskola: Upp till 50% rabatt juni–augusti, pris per lektion med rabatt 430:-\n2. Jörgens Trafikskola: Körkort på bara 3 veckor, intensivkurser, 30 körlektioner + teori\n3. Öhmans Trafikskola: Paket 1 (5 000:-), Paket 2 (6 900:-), Endast körlektion 740:-, öppet mån–fre 9–16\n4. Abbes Trafikskola: Körkort B 700:-/lektion, taxikurser från 5 500:-, öppet vardagar 17–22 samt lördag och söndag 9–16",
  "texts": [
    {
      "heading": "Personer (A–D)",
      "body": "• A. Anja vill ta körkort på så kort tid som möjligt.\n• B. Robert har bara tid att övningsköra på kvällar och helger.\n• C. Mustafa vill gå en billig kurs på sommaren.\n• D. Dorota vill bli taxichaufför."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Anja vill ta körkort på så kort tid som möjligt. Vilken annons passar bäst? (1–4)",
      "options": ["1", "2", "3", "4"],
      "answer": "2"
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Robert har bara tid att övningsköra på kvällar och helger. Vilken annons passar bäst? (1–4)",
      "options": ["1", "2", "3", "4"],
      "answer": "4"
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Mustafa vill gå en billig kurs på sommaren. Vilken annons passar bäst? (1–4)",
      "options": ["1", "2", "3", "4"],
      "answer": "1"
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Dorota vill bli taxichaufför. Vilken annons passar bäst? (1–4)",
      "options": ["1", "2", "3", "4"],
      "answer": "4"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Anja (أسرع مدة / 3 أسابيع) → 2، Robert (مساءً وعطلة نهاية الأسبوع) → 4، Mustafa (عرض رخيص في الصيف) → 1، Dorota (دورات سائق تاكسي) → 4.",
    "explanation": "كل إعلان لمدرسة قيادة يقدم مدة، أسعارًا، ومواعيد عمل مختلفة تناسب احتياجات المتقدمين.",
    "translation": "مطابقة احتياجات المتعلمين مع إعلانات مدارس القيادة.",
    "vocabulary": [
      "körkort (رخصة قيادة)",
      "intensivkurs (دورة مكثفة)",
      "rabatt (خصم)",
      "taxikurs (دورة قيادة تاكسي)"
    ],
    "examples": [
      "Kursen ger rabatt under sommaren. (تقدم الدورة خصمًا خلال الصيف.)"
    ],
    "tip": "ابحث عن الكلمات المفتاحية مثل '3 veckor' أو 'juni–augusti' أو 'taxikurser' أو 'kvällar och helger'."
  }
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A - Uppgift 4: Information på flygplatsen
$secD = @'
{
  "section": "D",
  "icon": "✈️",
  "title": "Läsa A – Uppgift 4: Information på flygplatsen",
  "instructions": "Para ihop texterna (A–E) med rätt rubrik (1–6):\n1. Bagage | 2. Resa med barn | 3. Resa till och från flygplatsen | 4. Säkerhetskontroll | 5. Mat och service | 6. Särskilda behov",
  "texts": [
    {
      "heading": "Texter (A–E)",
      "body": "• A: Du får inte ha med dig saker som kan skada dig själv eller andra inne i flygplanet. Därför undersöker personalen på flygplatsen om du har några farliga föremål på dig.\n• B: På flygplatsen finns frisör, valutaväxling, banker, restauranger och hotell. Det finns en stor informationsdisk som ligger i terminal 4. Du kan också surfa fritt i tre timmar på flygplatsens wifi.\n• C: I närheten av flygterminalerna finns det både bussar, taxi och tåg. Det finns också en långtidsparkering om du kommer med egen bil samt en biluthyrning.\n• D: Du får bara ha en liten väska med dig inne i flygplanet. Stora väskor lämnar du vid incheckningsdisken. Musikinstrument, cyklar och andra stora föremål måste paketeras och lämnas vid en speciell disk.\n• E: Säg till när du bokar din flygbiljett om du behöver stöd eller hjälp under resan. Det kan till exempel vara att du använder rullstol eller har svårt att se eller höra och behöver extra hjälp."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Säkerhetskontroll / Farliga föremål – Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Restauranger, banker, wifi och service – Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Bussar, taxi, tåg och parkering – Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Väskor och incheckning – Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    },
    {
      "id": "D_Q5",
      "type": "mcq",
      "prompt": "E. Rullstol eller extra hjälp – Välj rätt rubrik (1–6):",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: A → 4 (التفتيش الأمني)، B → 5 (الطعام والخدمات)، C → 3 (السفر إلى ومن المطار)، D → 1 (الأمتعة)، E → 6 (الاحتياجات الخاصة).",
    "explanation": "كل فقرة تقدم إرشادات من موقع المطار حول موضوع محدد من مواضيع السفر.",
    "translation": "معلومات إرشادية للمسافرين في المطار.",
    "vocabulary": [
      "bagage (أمتعة)",
      "säkerhetskontroll (تفتيش أمني)",
      "service (خدمات)",
      "särskilda behov (احتياجات خاصة)"
    ],
    "examples": [
      "Stora väskor lämnar du vid incheckningsdisken. (تترك الحقائب الكبيرة عند مكتب تسجيل الوصول.)"
    ],
    "tip": "طابق الكلمات المفتاحية في النص مع العنوان الأنسب."
  }
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsa A - Uppgift 5: Tips i en tidning (Cykla till jobbet)
$secE = @'
{
  "section": "E",
  "icon": "🚲",
  "title": "Läsa A – Uppgift 5: Tips i en tidning",
  "instructions": "Alina vill börja cykla till jobbet och läser tips i en tidning. Svara på frågan.",
  "texts": [
    {
      "heading": "Tips för att cykla till jobbet",
      "body": "Ett bra tips är att kunna byta om på jobbet ifall du blir svettig när du cyklar. Det är också bra att alltid ha med sig en regnjacka och ett extra par skor."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vad handlar tipset om?",
      "options": [
        "Börja lugnt.",
        "Ha rätt kläder.",
        "Planera din väg.",
        "Ha en bra väska.",
        "Ät bra."
      ],
      "answer": "Ha rätt kläder."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: النص يتحدث عن ارتداء وإحضار الملابس والأحذية المناسبة (Ha rätt kläder) مثل معطف المطر وحذاء إضافي وتغيير الملابس.",
    "explanation": "النص يركز على الاستعداد بالملابس المناسبة للطقس والتعرق عند الذهاب للعمل بالدراجة.",
    "translation": "نصيحة حول الملابس والأحذية المناسبة لركوب الدراجة إلى العمل.",
    "vocabulary": [
      "regnjacka (معطف مطر)",
      "byta om (يغير ملابسه)",
      "kläder (ملابس)",
      "skor (أحذية)"
    ],
    "examples": [
      "Ha alltid med dig en regnjacka när du cyklar. (احمل معك دائمًا معطف مطر عندما تقود الدراجة.)"
    ],
    "tip": "كلمات مثل 'byta om' و'regnjacka' و'skor' تدل مباشرة على الملابس."
  }
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Läsa B - Uppgift 1: En intervju med Noura (florist)
$secF = @'
{
  "section": "F",
  "icon": "💐",
  "title": "Läsa B – Uppgift 1: En intervju med Noura",
  "instructions": "Noura är florist. Para ihop frågorna (A–D) med rätt svar (1–5):\n1. Det är att få arbeta med det jag alltid har drömt om. Jag älskar att arbeta med kunder, få vara kreativ och att skapa med händerna. Det är det roligaste jag vet.\n2. Gör det du vill göra. Gå utbildningar, ta praktikplatser och gå som lärling. Ge inte upp!\n3. Jag har alltid gillat att plocka blommor och göra buketter. Men det var först när jag skulle välja program till gymnasiet som det blev klart för mig att det var just det här jag ville jobba med.\n4. Jag har arbetat med det sedan jag utbildade mig och jag tror att jag kommer att hålla på tills jag går i pension.\n5. Man arbetar långa dagar och står upp varje dag. Det är ganska ansträngande och tungt.",
  "texts": [
    {
      "heading": "Intervju med floristen Noura",
      "body": "Noura säljer blommor i en blomsteraffär och berättar om sitt yrke."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. När bestämde du dig för att bli florist? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vad är det bästa med att jobba som florist? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vad är det jobbigaste med att jobba som florist? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vilka tips har du till andra som vill bli florist? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: متى قررت أن تصبحي بائعة زهور → 3 (عند اختيار برنامج المرحلة الثانوية)، أفضل شيء → 1 (العمل في حلمها والإبداع)، الأصعب → 5 (أيام طويلة والوقوف يوميًا)، النصائح → 2 (الدراسة والتدريب وعدم الاستسلام).",
    "explanation": "مقابلة مع بائعة الزهور Noura حول بدايتها، إيجابيات المهنة، صعوباتها، ونصائحها للآخرين.",
    "translation": "إجابات Noura حول عملها كبائعة زهور.",
    "vocabulary": [
      "florist (بائع/بائعة زهور)",
      "bukett (باقة زهور)",
      "praktikplats (مكان تدريب)",
      "jobbigaste (الأصعب / الأكثر إرهاقًا)"
    ],
    "examples": [
      "Det är det roligaste jag vet att skapa med händerna. (أكثر ما أحبه هو الابتكار والصناعة باليدين.)"
    ],
    "tip": "طابق كل سؤال مع الفقرة التي تجيب عن وقت القرار، الأفضل، الأصعب، أو النصيحة."
  }
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Läsa B - Uppgift 2: Vad tycker de? (Handla på internet)
$secG = @'
{
  "section": "G",
  "icon": "🛒",
  "title": "Läsa B – Uppgift 2: Vad tycker de?",
  "instructions": "Läs vad personerna tycker om att handla på internet och svara på frågorna.",
  "texts": [
    {
      "heading": "Natalia",
      "body": "- För mig är det praktiskt att handla på nätet eftersom man sparar tid och energi. Det kan också vara lite billigare och då sparar man även pengar."
    },
    {
      "heading": "David",
      "body": "- Jag tycker det är krångligt eftersom man ofta köper saker som man behöver byta. Det kan även vara svårt att få kontakt med kundservice och det irriterar mig."
    },
    {
      "heading": "Dorota",
      "body": "- Jag tycker att det är enkelt och smidigt att handla på nätet. Den största fördelen är att jag kan handla exakt när jag vill."
    },
    {
      "heading": "Eduardo",
      "body": "- Jag gillar att man kan sitta hemma och välja vad man vill ha i lugn och ro. Nackdelen är just kläder som inte passar eller att man får hem fel saker."
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "A. Vad tycker Natalia om att handla på internet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Bra"
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "B. Vad tycker David om att handla på internet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Dåligt"
    },
    {
      "id": "G_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Dorota om att handla på internet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Bra"
    },
    {
      "id": "G_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Eduardo om att handla på internet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Både bra och dåligt"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Natalia → Bra، David → Dåligt، Dorota → Bra، Eduardo → Både bra och dåligt.",
    "explanation": "الآراء تختلف حول التسوق عبر الإنترنت حسب تجربة كل شخص مع الوقت والتكلفة وخدمة العملاء أو المقاسات.",
    "translation": "آراء أربعة أشخاص حول التسوق عبر الإنترنت.",
    "vocabulary": [
      "praktiskt (عملي)",
      "krångligt (معقد / صعب)",
      "smidigt (سلس / سهل)",
      "nackdel (عيب / نقطة سلبية)"
    ],
    "examples": [
      "Det är smidigt att handla på nätet när man vill. (من السهل والمرن التسوق عبر الإنترنت متى شئت.)"
    ],
    "tip": "ابحث عن الكلمات التي توضح الإيجابية فقط، السلبية فقط، أو وجود ميزة وعيب معًا (nackdelen)."
  }
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Läsa B - Uppgift 3: En faktatext (Unga människors ekonomi)
$secH = @'
{
  "section": "H",
  "icon": "💰",
  "title": "Läsa B – Uppgift 3: En faktatext",
  "instructions": "Läs texten om unga människors ekonomi och svara på frågorna.",
  "texts": [
    {
      "heading": "Unga människors ekonomi",
      "body": "Konsumentverket har gjort en undersökning för att se vad unga människor använder sina pengar till. De har tittat på hur ungdomar mellan 15 och 17 år handlar under tre månader.\n\nDet finns några saker som i stort sett alla unga köper, till exempel mat och fika. När det gäller fritidsaktiviteter, nöjen och kläder ser det lite olika ut. I genomsnitt är det 48 procent av de unga som använder sina pengar till fritidsaktiviteter. Ungefär 65 procent använder sina pengar till nöjen och cirka 90 procent köper kläder.\n\nEn tredjedel av ungdomarna får fickpengar från sina föräldrar. Ungefär var fjärde person tjänar också egna pengar och får lön. Men de pengar som ungdomarna använder kommer framför allt från barnbidrag och studiebidrag.\n\nDe allra flesta unga sparar också en del av sina pengar. Undersökningen visar att killar sparar en större andel av sina pengar än tjejer. 86 procent av alla unga sparar på något sätt, men 14 procent sparar inte alls.\n\nKälla: Konsumentverket, 2011 (Texten är bearbetad)"
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "A. Vad använder ungdomarna i undersökningen mest pengar till?",
      "options": ["Fritidsaktiviteter", "Nöjen", "Kläder"],
      "answer": "Kläder"
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "B. Varifrån får de flesta unga i undersökningen sina pengar?",
      "options": ["Från föräldrar", "Från bidrag", "Från jobb"],
      "answer": "Från bidrag"
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "C. Vad säger undersökningen om de ungas sparande?",
      "options": [
        "Killar och tjejer sparar lika mycket.",
        "Tjejer sparar mest.",
        "Killar sparar mest."
      ],
      "answer": "Killar sparar mest."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: ينفقون أكثر على الملابس (Kläder - حوالي 90%)، ومصدر المال الأساسي هو الإعانات (Från bidrag)، والأولاد يدخرون نسبة أكبر من الفتيات (Killar sparar mest).",
    "explanation": "النص يعرض نتائج دراسة حول إنفاق الشباب ومصادر أموالهم وادخارهم.",
    "translation": "نص معلوماتي عن اقتصاد الشباب ومصروفاتهم وادخارهم.",
    "vocabulary": [
      "undersökning (دراسة / استطلاع)",
      "bidrag (إعانة / مخصص مالي)",
      "sparar (يدخر / يوفر)",
      "kläder (ملابس)"
    ],
    "examples": [
      "Cirka 90 procent av de unga köper kläder. (حوالي 90% من الشباب يشترون الملابس.)"
    ],
    "tip": "قارن النسب المئوية والكلمات الدالة مثل 'framför allt' و'större andel'."
  }
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

# Section I: Läsa B - Uppgift 4: Meddelanden
$secI = @'
{
  "section": "I",
  "icon": "✉️",
  "title": "Läsa B – Uppgift 4: Meddelanden",
  "instructions": "Läs meddelandena och svara på frågorna.",
  "texts": [
    {
      "heading": "Bettan",
      "body": "Ville bara säga att jag är ledsen! Det var inte meningen att det skulle bli så här... Kram, Bettan"
    },
    {
      "heading": "Sara i personalgruppen",
      "body": "Ämne: Nybakat. Jag har bakat, välkomna på fika i lunchrummet i eftermiddag! / Sara i personalgruppen"
    },
    {
      "heading": "Ali",
      "body": "Se hit! Har du ett köksbord som du inte behöver? Jag tar gärna hand om det. Jag betalar kontant och kan hämta det själv. Kontakta mig på 0709391410 / Ali"
    },
    {
      "heading": "Hasse, lokalansvarig",
      "body": "Var försiktig! Halt golv. Gå inte på golvet innan det torkat! / Hasse, lokalansvarig"
    }
  ],
  "questions": [
    {
      "id": "I_Q1",
      "type": "mcq",
      "prompt": "A. Vad vill Bettan?",
      "options": ["Be om information.", "Be om hjälp.", "Be om ursäkt."],
      "answer": "Be om ursäkt."
    },
    {
      "id": "I_Q2",
      "type": "mcq",
      "prompt": "B. Vad vill Sara?",
      "options": ["Bjuda på något.", "Bestämma en tid.", "Boka ett möte."],
      "answer": "Bjuda på något."
    },
    {
      "id": "I_Q3",
      "type": "mcq",
      "prompt": "C. Vad vill Ali?",
      "options": ["Låna något.", "Sälja något.", "Köpa något."],
      "answer": "Köpa något."
    },
    {
      "id": "I_Q4",
      "type": "mcq",
      "prompt": "D. Vad vill Hasse?",
      "options": ["Varna för något.", "Be om ursäkt.", "Klaga på något."],
      "answer": "Varna för något."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Bettan → Be om ursäkt (اعتذار)، Sara → Bjuda på något (دعوة/ضيافة)، Ali → Köpa något (رغبة في شراء طاولة)، Hasse → Varna för något (تحذير من أرضية زلقة).",
    "explanation": "كل رسالة قصيرة تعبر عن هدف تواصل واضح ومباشر.",
    "translation": "رسائل قصيرة تعبر عن اعتذار، ضيافة، شراء، وتحذير.",
    "vocabulary": [
      "be om ursäkt (يعتذر)",
      "bjuda på (يدعو / يضيف)",
      "köpa (يشتري)",
      "varna (يحذر)"
    ],
    "examples": [
      "Var försiktig! Halt golv. (احذر! الأرضية زلقة.)"
    ],
    "tip": "ركز على الفعل أو الغرض الأساسي في كل رسالة قصيرة."
  }
}
'@
Set-Content -Path "$readingDir/I.json" -Value $secI -Encoding utf8

# Section J: Läsa B - Uppgift 5: Insändare (Gör stadsparken fin!)
$secJ = @'
{
  "section": "J",
  "icon": "🌳",
  "title": "Läsa B – Uppgift 5: Insändare",
  "instructions": "Läs insändaren 'Gör stadsparken fin!' och välj vad de markerade orden (A–D) betyder.",
  "texts": [
    {
      "heading": "Gör stadsparken fin!",
      "body": "Vi vill ha en levande stad där människor trivs. Stadsparken var tidigare ett vackert naturområde dit många gick för att [vila].\n\nIdag finns tyvärr inte så mycket kvar av den vackra parken. Bänkarna är trasiga och det ligger en massa skräp [överallt].\n\nVi tycker att kommunen borde göra parken fin igen. Det behövs inte mycket och vi har några [förslag]. Plantera blommor, bygg fler parkbänkar och bord så att vi kan ha picknick.\n\nParken kan bli en trevlig [mötesplats] för många, både gamla och unga.\n\nAnette Sandberg och Simon Morley"
    }
  ],
  "questions": [
    {
      "id": "J_Q1",
      "type": "mcq",
      "prompt": "A. Vad betyder 'vila' i texten?",
      "options": ["springa", "ta det lugnt", "arbeta med något"],
      "answer": "ta det lugnt"
    },
    {
      "id": "J_Q2",
      "type": "mcq",
      "prompt": "B. Vad betyder 'överallt' i texten?",
      "options": ["på en plats", "på några ställen", "på hela området"],
      "answer": "på hela området"
    },
    {
      "id": "J_Q3",
      "type": "mcq",
      "prompt": "C. Vad betyder 'förslag' i texten?",
      "options": ["idéer", "problem", "meddelanden"],
      "answer": "idéer"
    },
    {
      "id": "J_Q4",
      "type": "mcq",
      "prompt": "D. Vad betyder 'mötesplats' i texten?",
      "options": ["plats där man kan leka", "plats där man kan träffas", "plats där man kan äta"],
      "answer": "plats där man kan träffas"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: vila → ta det lugnt، överallt → på hela området، förslag → idéer، mötesplats → plats där man kan träffas.",
    "explanation": "فهم معاني الكلمات في سياق رسالة رأي إلى الصحيفة تدعو لتحسين الحديقة العامة.",
    "translation": "معاني الكلمات في رسالة رأي حول جعل حديقة المدينة جميلة.",
    "vocabulary": [
      "vila (يستريح / يأخذ قسطًا من الراحة)",
      "överallt (في كل مكان)",
      "förslag (اقتراحات / أفكار)",
      "mötesplats (مكان لقاء)"
    ],
    "examples": [
      "Parken kan bli en trevlig mötesplats. (يمكن أن تصبح الحديقة مكان لقاء لطيفًا.)"
    ],
    "tip": "استعن بالجمل المجاورة للكلمة المحددة لتأكيد المعنى الصحيح."
  }
}
'@
Set-Content -Path "$readingDir/J.json" -Value $secJ -Encoding utf8

Write-Host "=== Successfully populated 2015-8 Listening and Reading (with Arabic notes)! ===" -ForegroundColor Cyan
