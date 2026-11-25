# update-2017-12.ps1 - Populates Listening and Reading (with collapsible Arabic notes) for 2017-12

Write-Host "Populating Listening and Reading data for 2017-12..." -ForegroundColor Cyan

$examDir = "data/sfi/2017-12"
$listeningDir = Join-Path $examDir "listening"
$readingDir = Join-Path $examDir "reading"

New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $readingDir -Force | Out-Null

# ==========================================
# 1. LISTENING (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2017-12",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Några personer berättar (Johanna)",
      "audio": "spar01.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Vilken arbetsplats berättar Johanna om?",
          "options": ["en restaurang", "en frisörsalong", "en möbelaffär"],
          "answer": "en frisörsalong"
        },
        {
          "id": "L1_B",
          "prompt": "B. Vad tänker Johanna göra i framtiden?",
          "options": ["anställa ny personal", "arbeta mer", "sälja företaget"],
          "answer": "anställa ny personal"
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Samtal mellan grannar",
      "audio": "spar04.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A",
          "prompt": "A. En kvinna ringer på en grannes dörr. Vad vill kvinnan?",
          "options": ["Be om hjälp", "Bjuda på något", "Tacka för något"],
          "answer": "Bjuda på något"
        },
        {
          "id": "L4_B",
          "prompt": "B. En kvinna möter en man i trappan. Vad vill kvinnan?",
          "options": ["Informera om något", "Presentera sig", "Hälsa till någon"],
          "answer": "Informera om något"
        },
        {
          "id": "L4_C",
          "prompt": "C. En man och en kvinna pratar med varandra i tvättstugan. Vad vill mannen?",
          "options": ["Tacka för något", "Be om hjälp", "Byta en tid"],
          "answer": "Be om hjälp"
        },
        {
          "id": "L4_D",
          "prompt": "D. En man och en kvinna pratar med varandra på gården. Vad vill mannen?",
          "options": ["Informera om något", "Bjuda på något", "Hälsa till någon"],
          "answer": "Hälsa till någon"
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Nyheter",
      "audio": "spar05.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. Vad handlar nyheten om? (Bostäder i Mölndal renoveras och hyran höjs med 50%)",
          "options": ["Familj", "Ekonomi", "Arbete"],
          "answer": "Ekonomi"
        },
        {
          "id": "L5_B",
          "prompt": "B. Vad handlar nyheten om? (Varning från Vägverket på väg 57 mellan Mölndal och Gnesta)",
          "options": ["Väder", "Fritid", "Trafik"],
          "answer": "Trafik"
        },
        {
          "id": "L5_C",
          "prompt": "C. Vad handlar nyheten om? (Studie om gifta par och vem som tar hand om hemmet)",
          "options": ["Familj", "Hälsa", "Utbildning"],
          "answer": "Familj"
        }
      ]
    },
    {
      "id": 6,
      "title": "Uppgift 6: Miranda berättar om när hon tog körkort",
      "audio": "spar06.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L6_A",
          "prompt": "A. Hur lärde sig Miranda att köra bil?",
          "options": ["Med sina föräldrar", "På en trafikskola", "Med några vänner"],
          "answer": "På en trafikskola"
        },
        {
          "id": "L6_B",
          "prompt": "B. Vad gjorde Miranda när hon hade fått sitt körkort?",
          "options": ["Hon körde till sin bästa vän.", "Hon ordnade en fest.", "Hon gick på restaurang."],
          "answer": "Hon ordnade en fest."
        },
        {
          "id": "L6_C",
          "prompt": "C. Vad lärde sig Miranda av att ta körkort?",
          "options": ["Att alltid fortsätta kämpa.", "Att alltid ta det lugnt.", "Att alltid lyssna på råd."],
          "answer": "Att alltid fortsätta kämpa."
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

# ==========================================
# 2. READING CONFIG & SECTIONS (A - I)
# ==========================================

$configJson = @'
{
  "year": "2017-12",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt slutprov 12, 2017",
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
    "I.json"
  ]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Läsa A - Uppgift 1: Oscar dricker inte alkohol
$secA = @'
{
  "section": "A",
  "icon": "🥤",
  "title": "Läsa A – Uppgift 1: Oscar dricker inte alkohol",
  "instructions": "Läs artikeln om Oscar Lundberg och svara på frågorna.",
  "texts": [
    {
      "heading": "Oscar dricker inte alkohol",
      "body": "Allt fler unga väljer att inte dricka alkohol. Oscar Lundberg är en av dem. Han vill stötta andra ungdomar så att de vågar säga nej till alkohol.\n\nNär Oscar var sexton år började flera av hans skolkompisar att pröva alkohol. Men Oscar var inte intresserad av det. I stället försökte han få andra kontakter. Han följde med en tjej till en förening för ungdomar som inte dricker alkohol. Där trodde han att han kunde få kompisar som han skulle trivas med.\n\nNu är Oscar tjugoett år och jobbar i föreningen på heltid. Hans uppgift är att åka ut till skolor och prata med elever om alkohol. Det är vanligt att ungdomar i åldern 16-19 år prövar alkohol för att kompisar gör det. Det vill Oscar ändra på. Ingen ska känna att man måste tacka ja till ett glas öl eller vin.\n\nFöreningen ordnar en resa varje år. Då åker ungdomarna iväg en vecka och har roligt tillsammans. I föreningen får de också lära sig hur man kan hjälpa kompisar som dricker mycket alkohol.\n\nDen senaste tiden har äldre människor börjat dricka mer alkohol men unga dricker mindre.\n- Ungdomar vill inte göra likadant som sina föräldrar, tror Oscar. Och de tänker nog mer på vad som är nyttigt när de väljer vad de ska äta och dricka. Många tycker att man mår bättre utan alkohol, särskilt om man tränar.\n\nOscars föräldrar tror att Oscar kommer att börja dricka alkohol när han blir äldre. Men Oscar är nöjd med sitt beslut och säger att han inte kommer att ändra sig.\n\nSamma kväll som vi träffar Oscar ordnar han en träff i föreningens lokal. Han ska informera om resan och efter det ska de göra pizza. Strax innan träffen ska börja är Oscar på plats i lokalen. Han hälsar på alla ungdomar med en kram. Ungdomarna berättar att de ofta ses i lokalen på vardagskvällarna men på helgerna går de gärna ut och dansar."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Varför gick Oscar med i föreningen?",
      "options": [
        "För att träffa en flickvän.",
        "För att åka på en resa.",
        "För att hitta nya vänner."
      ],
      "answer": "För att hitta nya vänner."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Vad gör Oscar på dagarna?",
      "options": [
        "Han studerar.",
        "Han söker jobb.",
        "Han arbetar."
      ],
      "answer": "Han arbetar."
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vad ska Oscar göra i kväll?",
      "options": [
        "Hålla i ett möte.",
        "Äta på restaurang.",
        "Gå ut och dansa."
      ],
      "answer": "Hålla i ett möte."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Varför tror Oscar att ungdomar dricker mindre alkohol nu?",
      "options": [
        "För att de vill ha bra hälsa.",
        "För att det är svårt att köpa.",
        "För att det kostar mycket."
      ],
      "answer": "För att de vill ha bra hälsa."
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Tror Oscar att han kommer att dricka alkohol i framtiden?",
      "options": ["Ja", "Nej", "Kanske"],
      "answer": "Nej"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: الإجابات الصحيحة حسب النص (سبب الانضمام للجمعية، عمله، أنشطته، رأيه في الشباب، ومستقبله).",
    "explanation": "المقال يوضح لماذا لا يشرب Oscar الكحول، وكيف يعمل في جمعية تدعم الشباب.",
    "translation": "النص يتحدث عن حياة Oscar وقراره بعدم شرب الكحول.",
    "vocabulary": [
      "alkohol (كحول)",
      "förening (جمعية)",
      "ungdomar (شباب)",
      "hälsa (صحة)"
    ],
    "examples": [
      "Jag dricker inte alkohol. (أنا لا أشرب الكحول.)"
    ],
    "tip": "ابحث عن الكلمات المفتاحية في النص مثل الشباب والصحة والجمعية."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A - Uppgift 2: Ett diagram (Detta gör ungdomar på fritiden)
$secB = @'
{
  "section": "B",
  "icon": "📈",
  "title": "Läsa A – Uppgift 2: Ett diagram (Detta gör ungdomar på fritiden)",
  "instructions": "Studera diagrammet som visar vad ungdomar gör på fritiden (tjejer och killar i procent) och svara på frågorna.",
  "texts": [
    {
      "heading": "Detta gör ungdomar på fritiden (Procent)",
      "body": "• Går på teater, konsert eller museum: tjejer 70%, killar 63%\n• Läser böcker: tjejer 31%, killar 20%\n• Är med i en förening: tjejer 56%, killar 59%\n• Motionerar eller idrottar: tjejer 73%, killar 68%\n\nKälla: www.ungidag.se"
    }
  ],
  "charts": [
    {
      "id": "chartYouthLeisure2017",
      "type": "bar",
      "title": "Detta gör ungdomar på fritiden (%)",
      "labels": [
        "Går på teater, konsert eller museum",
        "Läser böcker",
        "Är med i en förening",
        "Motionerar eller idrottar"
      ],
      "datasets": [
        {
          "label": "tjejer",
          "data": [70, 31, 56, 73],
          "backgroundColor": "#1d4ed8"
        },
        {
          "label": "killar",
          "data": [63, 20, 59, 68],
          "backgroundColor": "#93c5fd"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vad är vanligast att ungdomar gör på fritiden?",
      "options": [
        "Går på teater, konsert eller museum",
        "Läser böcker",
        "Är med i en förening",
        "Motionerar eller idrottar"
      ],
      "answer": "Motionerar eller idrottar"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Vad är minst vanligt att ungdomar gör på fritiden?",
      "options": [
        "Går på teater, konsert eller museum",
        "Läser böcker",
        "Är med i en förening",
        "Motionerar eller idrottar"
      ],
      "answer": "Läser böcker"
    },
    {
      "id": "B_Q3",
      "type": "short",
      "prompt": "C. Hur många procent av killarna är med i en förening?",
      "answer": "59%",
      "acceptedAnswers": ["59%", "59", "ca 60%", "60%"]
    }
  ],
  "arabicNotes": {
    "summary": "الحل: أكثر نشاط هو ممارسة الرياضة (Motionerar/idrottar)، والأقل هو قراءة الكتب (Läser böcker)، ونسبة الأولاد في الجمعية هي 59% (حوالي 60%).",
    "explanation": "الرسم يوضح كيف يقضي الشباب وقت الفراغ بين الرياضة، القراءة، الثقافة، والجمعيات.",
    "translation": "المخطط يوضح الأنشطة الأكثر والأقل شيوعًا لدى الشباب.",
    "vocabulary": [
      "fritid (وقت فراغ)",
      "böcker (كتب)",
      "motionera (يمارس الرياضة)",
      "förening (جمعية)"
    ],
    "examples": [
      "Jag läser böcker på fritiden. (أقرأ الكتب في وقت الفراغ.)"
    ],
    "tip": "في الرسوم البيانية، قارن بين القيم الأعلى والأقل وابحث عن الفروق بين البنات والأولاد."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A - Uppgift 3: Sofia berättar om sitt jobb på ett äldreboende
$secC = @'
{
  "section": "C",
  "icon": "👵",
  "title": "Läsa A – Uppgift 3: Sofia berättar om sitt jobb",
  "instructions": "Sofia jobbar extra på ett äldreboende när hon är ledig från skolan. Välj den mening (1–5) som bäst beskriver varje text (A–D).\n\nMeningar:\n1. Jag gör olika saker.\n2. Jag får gå på kurs.\n3. Jag tjänar pengar.\n4. Jag får veta hur det var förr.\n5. Jag har bra arbetstider.",
  "texts": [
    {
      "heading": "Text A",
      "body": "- Jag är glad att jag har hittat ett helgjobb för det är svårt att klara sig på studiebidraget när man pluggar. Lönen är inte så hög men jag är ändå nöjd."
    },
    {
      "heading": "Text B",
      "body": "- Det är skönt att vi inte behöver börja före elva. Ibland jobbar jag både lördag och söndag men bara fyra timmar per dag så jag hinner vara ledig också."
    },
    {
      "heading": "Text C",
      "body": "- Vi sjunger, fikar och spelar spel med de äldre. Om det är fint väder går vi ut på promenad. Det är ett omväxlande jobb så det blir aldrig tråkigt."
    },
    {
      "heading": "Text D",
      "body": "- De äldre blir glada när jag kommer. De berättar om sina liv och hur det var för länge sen, när de var unga. Det är spännande att höra deras historier."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Vilken mening (1–5) passar bäst till text A?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Vilken mening (1–5) passar bäst till text B?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Vilken mening (1–5) passar bäst till text C?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Vilken mening (1–5) passar bäst till text D?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة العبارات مع النصوص (A → 3 كسب المال، B → 5 أوقات عمل جيدة، C → 1 أنشطة متنوعة، D → 4 معرفة كيف كان الماضي).",
    "explanation": "Sofia تتحدث عن عملها مع كبار السن والأنشطة والمزايا المختلفة في هذا العمل.",
    "translation": "النصوص قصيرة وتصف العمل اليومي والخبرات مع كبار السن.",
    "vocabulary": [
      "äldre (كبار السن)",
      "promenad (تمشية)",
      "historier (قصص)",
      "arbeta (يعمل)"
    ],
    "examples": [
      "Jag arbetar med äldre. (أعمل مع كبار السن.)"
    ],
    "tip": "اقرأ كل نص وابحث عن النشاط الأساسي أو الفكرة المركزية."
  }
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A - Uppgift 4: Meddelanden (Edvin, Mari, Lukas, Tindra)
$secD = @'
{
  "section": "D",
  "icon": "💬",
  "title": "Läsa A – Uppgift 4: Meddelanden",
  "instructions": "Edvin skriver ett sms till sina kompisar om filmkväll kl. 19. Läs kompisarnas svar och svara på frågorna.",
  "texts": [
    {
      "heading": "Edvins sms",
      "body": "Hej allihopa! Ska vi ses hemma hos mig i kväll och se på film? Kom kl. 19! / Edvin"
    },
    {
      "heading": "Mari",
      "body": "Hej Edvin! Jag vill komma, men min kusin är här och hälsar på hos mig den här veckan. Är det okej att hon följer med hem till dig? Kram, Mari"
    },
    {
      "heading": "Lukas",
      "body": "Ledsen Edvin, men jag måste plugga i kväll! Har ett prov i morgon. Ni får försöka ha roligt utan mig ;-) Vi hörs! Lukas"
    },
    {
      "heading": "Tindra",
      "body": "Filmkväll, toppen! Men jag måste fixa en sak åt min mormor först. Jag skyndar mig så jag är nog hos dig cirka kvart över. Tindra"
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Vad vill Mari?",
      "options": ["Bjuda på något", "Tacka nej", "Fråga om något"],
      "answer": "Fråga om något"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Vad vill Lukas?",
      "options": ["Tacka nej", "Komma senare", "Be om hjälp"],
      "answer": "Tacka nej"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Vad vill Tindra?",
      "options": ["Be om hjälp", "Tacka nej", "Komma senare"],
      "answer": "Komma senare"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Mari تسأل عن شيء، Lukas يرفض الدعوة (Tacka nej)، وTindra ستأتي متأخرة (Komma senare).",
    "explanation": "الرسائل القصيرة بين الأصدقاء توضح الغرض: سؤال، اعتذار/رفض، أو تأخير.",
    "translation": "كل رسالة قصيرة لها هدف محدد مثل السؤال أو الرفض أو الحضور لاحقًا.",
    "vocabulary": [
      "meddelande (رسالة قصيرة)",
      "tacka nej (يرفض)",
      "fråga (يسأل)",
      "komma senare (يأتي متأخرًا)"
    ],
    "examples": [
      "Jag skickar ett meddelande. (أرسل رسالة قصيرة.)"
    ],
    "tip": "اقرأ الرسالة كاملةً وركّز على السبب أو الطلب لتحديد الهدف بدقة."
  }
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsa A - Uppgift 5: En blogg (Att vara döv)
$secE = @'
{
  "section": "E",
  "icon": "🤟",
  "title": "Läsa A – Uppgift 5: En blogg",
  "instructions": "Läs bloggen om hur det är att vara döv och kryssa för rätt ord som passar i texten.",
  "texts": [
    {
      "heading": "Jag är döv",
      "body": "Att vara döv betyder att man inte kan höra. Jag har varit döv hela livet. Det är svårt för mig att prata så att alla förstår. Jag pratar med mina händer. Mitt språk [heter] teckenspråk."
    },
    {
      "heading": "Min familj kan höra",
      "body": "Mina föräldrar och syskon är inte döva. De har lärt sig teckenspråk så att de kan tala med mig. Men min mormor är gammal och hon kan inte det. Därför känner jag inte min mormor så bra och det är [A] tycker jag."
    },
    {
      "heading": "Jag gör praktik",
      "body": "Just nu gör jag praktik på en restaurang, det är jättekul! Jag brukar lägga en lapp på gästernas bord. På lappen står det: \"Jag är döv. Visa på menyn vad ni vill äta.\" En del gäster blir förvånade men ingen verkar tycka att det är [B]."
    },
    {
      "heading": "Jag lever ett vanligt liv",
      "body": "Det finns bra teknik som hjälper oss som är döva. På mobilen ringer jag videosamtal till mina kompisar. Om det ringer på dörren hemma blinkar en lampa. När den lyser ser jag att jag ska [C]."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vilket ord passar i texten?",
      "options": ["roligt", "intressant", "tråkigt"],
      "answer": "tråkigt"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vilket ord passar i texten?",
      "options": ["konstigt", "rätt", "dyrt"],
      "answer": "konstigt"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vilket ord passar i texten?",
      "options": ["fråga", "öppna", "lämna"],
      "answer": "öppna"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: اختيار الكلمات المناسبة في المدونة (A: محزن/مزعج، B: غريب، C: يفتح).",
    "explanation": "المدونة تشرح حياة شخص أصم وكيف يتواصل بلغة الإشارة ويستخدم التقنيات في حياته اليومية.",
    "translation": "النص يوضح كيف يتواصل الصم مع الآخرين ويعيشون حياة طبيعية.",
    "vocabulary": [
      "döv (أصم)",
      "teckenspråk (لغة الإشارة)",
      "öppna (يفتح)",
      "roligt (ممتع)"
    ],
    "examples": [
      "Jag använder teckenspråk. (أستخدم لغة الإشارة.)"
    ],
    "tip": "في نصوص المدونات، ابحث عن الفعل أو الصفة التي تناسب سياق الجملة."
  }
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Läsa B - Uppgift 1 & 2: Biblioteket & Intervju med sjuksköterska
$secF = @'
{
  "section": "F",
  "icon": "📚",
  "title": "Läsa B – Biblioteket och Intervju med sjuksköterska",
  "instructions": "Läs texterna om personer på biblioteket och intervjun med sjuksköterskan Stefan och svara på frågorna.",
  "texts": [
    {
      "heading": "Uppgift 1: Varför är personerna på biblioteket? (1–5)",
      "body": "• Stig: - Jag jobbar i en sportaffär och blir ofta trött i benen. På min lunchrast brukar jag gå hit till biblioteket för att koppla av en stund. Jag sitter ofta och lyssnar på ett radioprogram i mina hörlurar. Det är skönt att bara ta det lugnt en stund.\n• Stina: - Jag håller på att utbilda mig till bibliotekarie så jag är här i åtta veckor nu och lär mig hur jobbet fungerar. Det är bra att få erfarenhet av jobbet på riktigt och se hur man trivs med det.\n• Mikael: - I dag är jag här med mina två söner. Eftersom det är fredag ska vi titta på film hemma i kväll. Barnen ska få välja en kul dvd här. Man får ha filmen hemma i två veckor, helt gratis. Det är väldigt bra.\n• Junko: - Jag delar lägenhet med en tjej som ofta lyssnar på musik eller pratar i sin mobiltelefon. Här är det lugnt och tyst så att jag kan koncentrera mig när jag gör läxor eller pluggar till ett viktigt prov.\n\nAlternativ: 1. För att studera | 2. För att lämna något | 3. För att låna något | 4. För att vila | 5. För att göra praktik"
    },
    {
      "heading": "Uppgift 2: Intervju med sjuksköterskan Stefan (1–5)",
      "body": "1. - Alla arbetspass är olika men jag ser alltid till att patienterna får god vård. Jag tar ofta prover på patienterna, ger medicin och kontrollerar blodtryck.\n2. - Vi har ett väldigt stort ansvar för patienterna. Om man tänker på det tycker jag att min lön är för låg. Man blir också trött av att arbeta på nätter och helger.\n3. - För att jag alltid har drömt om att arbeta inom vården. Jag kommer ihåg att jag och min bror brukade leka sjukhus hemma när vi var små.\n4. - Det är att få hjälpa andra människor. Jag mår bra av det och jag trivs i den här miljön.\n5. - Då försöker jag göra personen lugn. Jag pratar med honom eller henne och berättar precis vad jag ska göra."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "Bibliotek A. Stig (1–5):",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "Bibliotek B. Stina (1–5):",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "Bibliotek C. Mikael (1–5):",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "Bibliotek D. Junko (1–5):",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "F_Q5",
      "type": "mcq",
      "prompt": "Sjuksköterska A. Varför utbildade du dig till sjuksköterska? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "F_Q6",
      "type": "mcq",
      "prompt": "Sjuksköterska B. Vad gör du på jobbet? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "F_Q7",
      "type": "mcq",
      "prompt": "Sjuksköterska C. Vad gör du om en patient känner sig orolig? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "F_Q8",
      "type": "mcq",
      "prompt": "Sjuksköterska D. Vad är det bästa med ditt jobb? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: أسباب الذهاب للمكتبة (Stig → 4 للراحة، Stina → 5 للتدريب العملي، Mikael → 3 للاستعارة، Junko → 1 للدراسة) وإجابات مقابلة الممرض (A → 3، B → 1، C → 5، D → 4).",
    "explanation": "الجزء الأول يوضح تنوّع استخدام المكتبة، والجزء الثاني يوضح مهنة الممرض (sjuksköterska) وأعماله اليومية.",
    "translation": "النصوص تصف استخدامات المكتبة وتفاصيل عمل الممرض مع المرضى.",
    "vocabulary": [
      "bibliotek (مكتبة)",
      "vila (راحة)",
      "låna (يستعير)",
      "praktik (تدريب عملي)",
      "sjuksköterska (ممرض / ممرضة)",
      "patient (مريض)",
      "vård (رعاية صحية)",
      "ansvar (مسؤولية)"
    ],
    "examples": [
      "Jag går till biblioteket för att låna böcker. (أذهب إلى المكتبة لأستعير كتبًا.)",
      "Sjuksköterskan hjälper patienten. (الممرض يساعد المريض.)"
    ],
    "tip": "ركّز على الكلمات المفتاحية في المكتبة، وابحث عن الإجابة المباشرة في مقابلة العمل."
  }
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Läsa B - Uppgift 3 & 4: Annonser & Intervjuer i en galleria
$secG = @'
{
  "section": "G",
  "icon": "🏬",
  "title": "Läsa B – Annonser och Intervjuer i en galleria",
  "instructions": "Läs annonserna och intervjuerna i gallerian och svara på frågorna.",
  "texts": [
    {
      "heading": "Uppgift 3: Annonser (1–5)",
      "body": "1. Solängens gatuloppis! Söndag 28 maj från morgon till kväll, Solgatan 2–24.\n2. Snart är det sommar! Anmälan till årets simundervisning i juli vid Lillsjön.\n3. Välkommen till Kafé Silver! Mötesplatsen för alla seniorer (65 år eller äldre), öppet varje dag kl. 14–17.\n4. Välkommen till Nyckelpigan på Öppet Hus! Förskola för barn i åldern 1–6 år, Skogsvägen 13.\n5. Kom och sjung med oss! Körsång på måndagar kl. 19.00 på Musikhuset – ett roligt sätt att öva svenska."
    },
    {
      "heading": "Uppgift 4: Intervjuer i en galleria",
      "body": "• Marc: - Jag ska på fest i morgon kväll så jag ska leta efter något snyggt att ha på mig. Sen sätter jag mig kanske och tar en kopp kaffe någonstans.\n• Alice: - En kompis och jag har startat ett företag tillsammans och nu ska vi träffa en kund. Efter det ska vi ha ett möte och planera lite.\n• Carlos: - I dag har jag varit gift med min fru i ett år. Vi ska fira i kväll och då vill jag ge henne en present. Hon jobbar på restaurang så jag tror att hon skulle bli glad över ett par sköna skor.\n• Julia: - Jag köpte en jacka på internet för en vecka sedan och har hämtat paketet i mataffären nu. En gammal jobbarkompis ville bjuda mig på fika här i dag så det passade bra."
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "Annons A. Khadir ska välja förskola till sin dotter. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "Annons B. Ruth är pensionär och vill träffa andra pensionärer. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "G_Q3",
      "type": "mcq",
      "prompt": "Annons C. Adam vill sälja/fynda på loppis. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "G_Q4",
      "type": "mcq",
      "prompt": "Annons D. Tricia vill träna svenska genom körsång. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "G_Q5",
      "type": "mcq",
      "prompt": "Galleria A. Vad ska Marc göra i gallerian?",
      "options": ["Handla något", "Träffa en vän", "Söka jobb"],
      "answer": "Handla något"
    },
    {
      "id": "G_Q6",
      "type": "mcq",
      "prompt": "Galleria B. Vad ska Alice göra i gallerian?",
      "options": ["Söka jobb", "Arbeta", "Äta lunch"],
      "answer": "Arbeta"
    },
    {
      "id": "G_Q7",
      "type": "mcq",
      "prompt": "Galleria C. Vad ska Carlos göra i gallerian?",
      "options": ["Handla något", "Arbeta", "Äta lunch"],
      "answer": "Handla något"
    },
    {
      "id": "G_Q8",
      "type": "mcq",
      "prompt": "Galleria D. Vad ska Julia göra i gallerian?",
      "options": ["Handla något", "Arbeta", "Träffa en vän"],
      "answer": "Träffa en vän"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة الإعلانات (4 روضة أطفال، 3 مقهى لكبار السن، 1 سوق مستعمل، 5 غناء/تدريب لغة) وأنشطة الأشخاص في المول.",
    "explanation": "الإعلانات تقدم أنشطة وخدمات مختلفة، ومقابلات المول توضح ما يفعله كل شخص هناك.",
    "translation": "النصوص توضح الأنشطة الاجتماعية والتسوق والعمل في الحياة اليومية.",
    "vocabulary": [
      "annons (إعلان)",
      "loppis (سوق مستعمل)",
      "café (مقهى)",
      "sjunga (يغني)",
      "galleria (مول / مركز تجاري)",
      "handla (يتسوق)",
      "äta lunch (يتناول الغداء)",
      "söka jobb (يبحث عن عمل)"
    ],
    "examples": [
      "Jag handlar kläder i gallerian. (أتسوق ملابس في المول.)",
      "Jag läser en annons i tidningen. (أقرأ إعلانًا في الجريدة.)"
    ],
    "tip": "في الإعلانات انتبه للوقت والمكان والفئة المستهدفة، وفي المقابلات ابحث عن الفعل الأساسي."
  }
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Läsa B - Uppgift 5: Information om studier (Komvux)
$secH = @'
{
  "section": "H",
  "icon": "🎓",
  "title": "Läsa B – Information om studier (Komvux)",
  "instructions": "Läs informationen om studier på Komvux webbsida och välj rätt rubrik till varje text.",
  "texts": [
    {
      "heading": "Text A",
      "body": "Det finns många olika utbildningar hos oss. Just nu saknas det undersköterskor och kockar på arbetsmarknaden. Därför är det bra yrken att utbilda sig till om man vill vara säker på att få jobb i framtiden."
    },
    {
      "heading": "Text B",
      "body": "För att du ska få plats på den utbildning som du vill gå är det viktigt att du skickar alla dina papper i god tid. På kommunens webbsida finns information om startdatum samt sista anmälningsdatum för alla kurser."
    },
    {
      "heading": "Text C",
      "body": "Studiemedel består av bidrag och lån. Du väljer själv om du vill låna eller inte. Lånet måste du sedan betala tillbaka. När du studerar på Komvux har du rätt att få hjälp max två år."
    },
    {
      "heading": "Text D",
      "body": "Om du stannar hemma från skolan är det viktigt att du kontaktar din lärare och försäkringskassan redan första dagen. Är du borta mer än sju dagar måste du även lämna ett läkarintyg."
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik passar till text A?",
      "options": ["Utbildningar / Yrken", "Ansökan", "Ekonomi / Studiemedel", "Sjukdom / Sjukanmälan"],
      "answer": "Utbildningar / Yrken"
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik passar till text B?",
      "options": ["Utbildningar / Yrken", "Ansökan", "Ekonomi / Studiemedel", "Sjukdom / Sjukanmälan"],
      "answer": "Ansökan"
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik passar till text C?",
      "options": ["Utbildningar / Yrken", "Ansökan", "Ekonomi / Studiemedel", "Sjukdom / Sjukanmälan"],
      "answer": "Ekonomi / Studiemedel"
    },
    {
      "id": "H_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik passar till text D?",
      "options": ["Utbildningar / Yrken", "Ansökan", "Ekonomi / Studiemedel", "Sjukdom / Sjukanmälan"],
      "answer": "Sjukdom / Sjukanmälan"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة النصوص مع العناوين (A التخصصات/المهن، B التقديم/المواعيد، C الدعم المالي/القرض الدراسي، D التبليغ عن المرض).",
    "explanation": "النصوص تشرح معلومات مهمة حول الدراسة في Komvux من حيث التخصصات، التقديم، الدعم المالي، والغياب المرضي.",
    "translation": "كل نص يقدم معلومة أساسية عن الدراسة في الكومفوكس.",
    "vocabulary": [
      "utbildning (تعليم / تخصص)",
      "kurs (دورة)",
      "studietid (وقت الدراسة)",
      "sjukanmälan (تبليغ المرض)"
    ],
    "examples": [
      "Jag går en kurs på Komvux. (أشارك في دورة في الكومفوكس.)"
    ],
    "tip": "ركّز على العناوين والكلمات المفتاحية للوصول إلى الجواب الصحيح بسرعة."
  }
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

# Section I: Läsa C - Konsumenträttigheter, En miljon, Meddelanden & Hushållsutgifter
$secI = @'
{
  "section": "I",
  "icon": "🧾",
  "title": "Läsa C – Konsumenträtt, En miljon, Meddelanden och Hushållsutgifter",
  "instructions": "Läs texterna i Läsa C (konsumentservice, intervjuer om en miljon, sms-meddelanden och hushållsutgifter) och svara på frågorna.",
  "texts": [
    {
      "heading": "Konsumentservice och -rättigheter (A–D)",
      "body": "• A (Reklamation): Fel på köpt produkt – rätt att reklamera i upp till tre år (lättast första sex månaderna).\n• B (Öppet köp och bytesrätt): Frivilligt i butiker om det erbjuds, ofta på kvittot, oanvänd vara och kvitto krävs.\n• C (Ångerrätt): Distansavtal (internet/telefon/utanför butik) – rätt att ångra inom 14 dagar (gäller dock inte resor).\n• D (Garanti): Tillverkarens ansvar att en produkt fungerar under viss tid, t.ex. ett år, vid normalt bruk."
    },
    {
      "heading": "Om jag vann en miljon ...",
      "body": "• Marko (51): köpa husvagn/ny bil och ge en del till barnen som pluggar.\n• Jamal (22): hitta egen bostad (lya) och spara lite inför framtiden.\n• Olga (34): gå ner i arbetstid/halvtid, åka på drömsemester med familjen och byta ut möbler.\n• Bengt (63): sätta in pengar på banken inför pensionen och skänka en slant till välgörenhet.\n• Mimmi (19): resa jorden runt ett år och studera utan att ta lån."
    },
    {
      "heading": "Meddelanden & Hushållsutgifter",
      "body": "• Firas till Tove: Kan du köpa mjölk och bröd på hemvägen? -> Be om något.\n• Firas om kaffe: Har vi kaffe hemma? -> Fråga något.\n• Gabriel till Adam: Vill du hänga med och ta en öl i morgon efter tentan? -> Fråga något / bjuda in.\n• Adam till Gabriel: Kan vi ta krogen nästa vecka i stället? -> Föreslå en annan tid.\n• Linnea till Mamma: Byxorna kändes trånga, jag lämnar tillbaka dem. -> Ha pengarna tillbaka / lämna tillbaka.\n• Mamma till Linnea: Glöm inte att ta med kvittot! -> Påminna om något.\n• Hushållsutgifter (SCB 2017): Störst utgift är Boende (22,6%)."
    }
  ],
  "questions": [
    {
      "id": "I_Q1",
      "type": "mcq",
      "prompt": "Konsumenttext A handlar om:",
      "options": ["Garanti", "Reklamation", "Öppet köp och bytesrätt", "Ångerrätt"],
      "answer": "Reklamation"
    },
    {
      "id": "I_Q2",
      "type": "mcq",
      "prompt": "Konsumenttext B handlar om:",
      "options": ["Garanti", "Reklamation", "Öppet köp och bytesrätt", "Ångerrätt"],
      "answer": "Öppet köp och bytesrätt"
    },
    {
      "id": "I_Q3",
      "type": "mcq",
      "prompt": "Konsumenttext C handlar om:",
      "options": ["Garanti", "Reklamation", "Öppet köp och bytesrätt", "Ångerrätt"],
      "answer": "Ångerrätt"
    },
    {
      "id": "I_Q4",
      "type": "mcq",
      "prompt": "Konsumenttext D handlar om:",
      "options": ["Garanti", "Reklamation", "Öppet köp och bytesrätt", "Ångerrätt"],
      "answer": "Garanti"
    },
    {
      "id": "I_Q5",
      "type": "mcq",
      "prompt": "Meddelande A (mjölk och bröd): Vad vill personen?",
      "options": ["Köpa något.", "Äta frukost.", "Be om något."],
      "answer": "Be om något."
    },
    {
      "id": "I_Q6",
      "type": "mcq",
      "prompt": "Meddelande B (har vi kaffe hemma?): Vad vill personen?",
      "options": ["Dricka något.", "Fråga något.", "Sälja något."],
      "answer": "Fråga något."
    },
    {
      "id": "I_Q7",
      "type": "mcq",
      "prompt": "Meddelande D (ta krogen nästa vecka i stället): Vad vill personen?",
      "options": ["Handla mat.", "Låna pengar.", "Föreslå en annan tid."],
      "answer": "Föreslå en annan tid."
    },
    {
      "id": "I_Q8",
      "type": "mcq",
      "prompt": "Meddelande F (Glöm inte att ta med kvittot!): Vad vill personen?",
      "options": ["Handla kläder.", "Påminna om något.", "Bestämma en tid."],
      "answer": "Påminna om något."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: حقوق المستهلك (A شكوى على عيب/Reklamation، B إرجاع/استبدال في المتجر، C حق التراجع خلال 14 يومًا عن بُعد، D ضمان الشركة المصنّعة)، وأهداف الرسائل والنفقات.",
    "explanation": "تتناول هذه الصفحات حقوق المستهلك، ماذا سيفعل الأشخاص لو ربحوا مليونًا، الرسائل القصيرة، ونفقات الأسرة.",
    "translation": "نصوص متقدمة عن حقوق الشراء والإرجاع، الخطط المستقبلية، الرسائل اليومية، وميزانية الأسرة.",
    "vocabulary": [
      "kvitto (إيصال / فاتورة)",
      "reklamation (شكوى على عيب منتج)",
      "garanti (ضمان)",
      "ångerrätt (حق التراجع عن الشراء)"
    ],
    "examples": [
      "Glöm inte att ta med kvittot. (لا تنسَ أخذ الإيصال معك.)"
    ],
    "tip": "فرّق بين الشراء من المتجر (Öppet köp) والشراء عن بُعد عبر الإنترنت (Ångerrätt) والعيوب (Reklamation) والضمان (Garanti)."
  }
}
'@
Set-Content -Path "$readingDir/I.json" -Value $secI -Encoding utf8

Write-Host "=== Successfully populated 2017-12 Listening and Reading (with Arabic notes)! ===" -ForegroundColor Cyan
