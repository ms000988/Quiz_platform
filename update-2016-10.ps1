# update-2016-10.ps1 - Populates Listening and Reading (with Arabic notes) for 2016-10

Write-Host "Populating Listening and Reading data for 2016-10..." -ForegroundColor Cyan

$examDir = "data/sfi/2016-10"
$listeningDir = Join-Path $examDir "listening"
$readingDir = Join-Path $examDir "reading"

New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $readingDir -Force | Out-Null

# ==========================================
# 1. LISTENING (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2016-10",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Några personer berättar (vad de är bra på och vad de vill bli bättre på)",
      "audio": "spar01.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Vad är Ali bra på?",
          "options": ["Sporta", "Fotografera", "Studera"],
          "answer": "Fotografera"
        },
        {
          "id": "L1_B",
          "prompt": "B. Vad vill Ali bli bättre på?",
          "options": ["Säga förlåt", "Spara pengar", "Komma i tid"],
          "answer": "Komma i tid"
        },
        {
          "id": "L1_C",
          "prompt": "C. Vad är Johanna bra på?",
          "options": ["Lyssna", "Vila", "Studera"],
          "answer": "Lyssna"
        },
        {
          "id": "L1_D",
          "prompt": "D. Vad vill Johanna bli bättre på?",
          "options": ["Laga mat", "Städa", "Vila"],
          "answer": "Vila"
        },
        {
          "id": "L1_E",
          "prompt": "E. Vad är Hamid bra på?",
          "options": ["Laga mat", "Komma i tid", "Köra bil"],
          "answer": "Laga mat"
        },
        {
          "id": "L1_F",
          "prompt": "F. Vad vill Hamid bli bättre på?",
          "options": ["Sporta", "Vila", "Sjunga"],
          "answer": "Sporta"
        },
        {
          "id": "L1_G",
          "prompt": "G. Vad är Emelie bra på?",
          "options": ["Läsa", "Sjunga", "Fotografera"],
          "answer": "Sjunga"
        },
        {
          "id": "L1_H",
          "prompt": "H. Vad vill Emelie bli bättre på?",
          "options": ["Vila", "Köra bil", "Studera"],
          "answer": "Köra bil"
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Ett samtal om trädgården",
      "audio": "spar02.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. Ska de odla morötter?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Ja"
        },
        {
          "id": "L2_B",
          "prompt": "B. Ska de åka och handla i morgon?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Ja"
        },
        {
          "id": "L2_C",
          "prompt": "C. Ska de plantera ett äppelträd nu?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Nej"
        }
      ]
    },
    {
      "id": 3,
      "title": "Uppgift 3: Fyra nyheter",
      "audio": "spar03.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A",
          "prompt": "A. Vad handlar nyheten om?",
          "options": ["Miljö", "Arbete", "Hälsa"],
          "answer": "Miljö"
        },
        {
          "id": "L3_B",
          "prompt": "B. Vad handlar nyheten om?",
          "options": ["Bostad", "Hälsa", "Arbete"],
          "answer": "Hälsa"
        },
        {
          "id": "L3_C",
          "prompt": "C. Vad handlar nyheten om?",
          "options": ["Miljö", "Fritid", "Vård"],
          "answer": "Fritid"
        },
        {
          "id": "L3_D",
          "prompt": "D. Vad handlar nyheten om?",
          "options": ["Fritid", "Sport", "Bostad"],
          "answer": "Bostad"
        }
      ]
    },
    {
      "id": "4",
      "title": "Uppgift 4: Meddelanden på kommunens telefonsvarare",
      "audio": "spar04.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A",
          "prompt": "A. Maria talar in ett meddelande. Vad vill Maria?",
          "options": ["Meddela ett fel.", "Boka en tid.", "Byta förskola."],
          "answer": "Boka en tid."
        },
        {
          "id": "L4_B",
          "prompt": "B. Frank talar in ett meddelande. Vad vill Frank?",
          "options": ["Klaga på något.", "Be om ursäkt.", "Be om hjälp."],
          "answer": "Klaga på något."
        },
        {
          "id": "L4_C",
          "prompt": "C. Simon talar in ett meddelande. Vad vill Simon?",
          "options": ["Bestämma en tid.", "Fråga om något.", "Be om ursäkt."],
          "answer": "Fråga om något."
        }
      ]
    },
    {
      "id": "5",
      "title": "Uppgift 5: Tre telefonsamtal",
      "audio": "spar05.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. Personen ringer till...",
          "options": ["en frisör", "en skola", "en vårdcentral"],
          "answer": "en vårdcentral"
        },
        {
          "id": "L5_B",
          "prompt": "B. Personen ringer till...",
          "options": ["en frisör", "en vårdcentral", "en möbelaffär"],
          "answer": "en frisör"
        },
        {
          "id": "L5_C",
          "prompt": "C. Personen ringer till...",
          "options": ["en skola", "en vårdcentral", "en möbelaffär"],
          "answer": "en skola"
        }
      ]
    },
    {
      "id": "6",
      "title": "Uppgift 6: Michael berättar om personliga assistenter",
      "audio": "spar06.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L6_A",
          "prompt": "A. När får Michael hjälp av en personlig assistent?",
          "options": ["Bara på dagen.", "Bara på natten.", "Både på dagen och på natten."],
          "answer": "Både på dagen och på natten."
        },
        {
          "id": "L6_B",
          "prompt": "B. Vad tycker Michael är bäst med att ha en personlig assistent? Att han...",
          "options": ["kan leva som han vill.", "aldrig är ensam.", "känner sig trygg hemma."],
          "answer": "kan leva som han vill."
        },
        {
          "id": "L6_C",
          "prompt": "C. Vad är viktigast när Michael väljer en assistent? Att assistenten...",
          "options": ["gillar sitt jobb.", "är stark.", "är bra på att lyssna."],
          "answer": "är bra på att lyssna."
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

# ==========================================
# 2. READING CONFIG & SECTIONS (A - E)
# ==========================================

$configJson = @'
{
  "year": "2016-10",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt slutprov 10, 2016, Kurs C",
  "passThreshold": 0.6,
  "sections": [
    "A.json",
    "B.json",
    "C.json",
    "D.json",
    "E.json"
  ]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Läsa A - Uppgift 1: Träning i parken (Sara Abosti)
$secA = @'
{
  "section": "A",
  "icon": "🧘",
  "title": "Läsa A – Uppgift 1: Träning i parken",
  "instructions": "Läs artikeln om yoga i Stadsparken med Sara Abosti och svara på frågorna.",
  "texts": [
    {
      "heading": "Träning i parken",
      "body": "I sommar kommer det att finnas möjlighet att träna yoga i Stadsparken. Sara Abosti ska vara ledare för träningen, som är gratis och öppen för alla.\n\n- För mig är det jätteviktigt att träna, säger Sara. Jag har en sjukdom som gör att jag nästan alltid har ont i kroppen, men när jag äter bra mat och tränar mår jag mycket bättre.\n\nSara har provat många olika aktiviteter. Men det hon tycker bäst om är yoga.\n- Alla är så stressade hela tiden. Men i yoga får man lära sig att andas på rätt sätt och då är det lättare för kroppen att slappna av. Man blir mindre stressad och lär sig att lyssna på sina känslor. Man gör också olika rörelser så att kroppen blir stark, berättar Sara.\n\nFör några år sedan åkte Sara till Indien och utbildade sig till yoga-lärare. I Indien har människor tränat yoga i över tusen år. Men de senaste åren har yoga blivit populärt även i Sverige. Och nu vill Sara att fler ska få möjlighet att träna yoga och känna hur bra man mår av det. Därför kommer Sara att ge yoga-lektioner i Stadsparken i sommar.\n\nSara tror att Stadsparken är en bra plats att träna på eftersom många människor brukar komma dit på sommarkvällarna. Hon kontaktade därför kommunen och frågade om hon fick ha lektioner i yoga i Stadsparken. I ett par månader fick hon vänta på svar men nu har kommunen äntligen sagt ja.\n\n- Det ska bli jättekul, säger Sara. Jag kommer att leda träningen två kvällar i veckan, på tisdagar och torsdagar.\n\nTräningen kostar ingenting och de som vill vara med kan bara komma till parken några minuter innan träningen börjar. Ung eller gammal, nybörjare eller inte – alla är välkomna.\n\n- Det finns många fördelar med att träna i en park, berättar Sara. Fler människor kan vara med, eftersom det finns gott om plats på den stora gräsmattan. Så jag hoppas att många kommer och tränar med mig!\n\nKom och träna yoga med Sara!\nNär? Alla tisdagar och torsdagar i juli kl. 18:00–19:30\nVar? I Stadsparken, norra delen"
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Varför började Sara att träna yoga?",
      "options": [
        "För att få nya kompisar.",
        "För att må bättre.",
        "För att det var roligt."
      ],
      "answer": "För att må bättre."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Varför ska Sara ha yoga-lektioner i parken?",
      "options": [
        "Hon vill ha ett sommarjobb.",
        "Hon vill bli bättre på yoga.",
        "Hon vill att andra ska få prova yoga."
      ],
      "answer": "Hon vill att andra ska få prova yoga."
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vilka får komma och träna yoga i parken?",
      "options": [
        "De som har bokat en plats.",
        "Bara de som har tränat tidigare.",
        "Alla som är intresserade."
      ],
      "answer": "Alla som är intresserade."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Hur länge kan man träna yoga i parken?",
      "options": [
        "En månad",
        "Två månader",
        "Tre månader"
      ],
      "answer": "En månad"
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Vad handlar artikeln mest om?",
      "options": [
        "Resa",
        "Ekonomi",
        "Hälsa"
      ],
      "answer": "Hälsa"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: بدأت Sara اليوغا لتشعر بتحسن، وتريد أن يجربها الآخرون، والدعوة مفتوحة لكل المهتمين، والمدة شهر واحد (في يوليو/juli)، والموضوع الرئيسي هو الصحة (Hälsa).",
    "explanation": "المقال يتحدث عن دروس اليوغا المجانية في الحديقة العامة خلال فصل الصيف وفوائدها الجسدية والنفسية.",
    "translation": "مقال عن تدريب اليوغا في الحديقة وكيف يساعد على الاسترخاء وتحسين الصحة.",
    "vocabulary": [
      "träning (تدريب / تمرين)",
      "hälsa (صحة)",
      "slappna av (يسترخي)",
      "gratis (مجاني)"
    ],
    "examples": [
      "Träningen i parken är gratis. (التمرين في الحديقة مجاني.)"
    ],
    "tip": "انتبه إلى كلمة 'i juli' في فقرة När? لأنها تدل على شهر واحد (En månad)."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A - Uppgift 2: Meddelanden (Sara & Robin)
$secB = @'
{
  "section": "B",
  "icon": "📱",
  "title": "Läsa A – Uppgift 2: Meddelanden",
  "instructions": "Läs Saras meddelande och Robins svar och svara på frågorna.",
  "texts": [
    {
      "heading": "Sara",
      "body": "Hej alla vänner! Välkomna att träna med mig i parken, på tisdag klockan 18:00! Kul om många av er kommer. / Sara"
    },
    {
      "heading": "Robin",
      "body": "Hej Sara! Din träning hjälper mig att komma i form. Jag mår mycket bättre nu. Du är fantastisk! / Robin"
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vad vill Sara?",
      "options": [
        "Tacka för något.",
        "Be om hjälp.",
        "Bjuda in."
      ],
      "answer": "Bjuda in."
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Vad vill Robin?",
      "options": [
        "Tacka för något.",
        "Be om hjälp.",
        "Bestämma träff."
      ],
      "answer": "Tacka för något."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Sara تريد أن تدعو أصدقاءها (Bjuda in)، وRobin يريد أن يشكرها على التدريب (Tacka för något).",
    "explanation": "الرسالة الأولى دعوة للتمرين في الحديقة، والرسالة الثانية شكر على تحسن اللياقة والصحة.",
    "translation": "رسالة دعوة للتدريب وردّ شكر من صديق.",
    "vocabulary": [
      "bjuda in (يدعو)",
      "tacka (يشكر)",
      "komma i form (يستعيد لياقته)",
      "meddelande (رسالة)"
    ],
    "examples": [
      "Tack för att du hjälper mig! (شكرًا لمساعدتك لي!)"
    ],
    "tip": "كلمات مثل 'Välkomna...' تدل على دعوة (Bjuda in)، وكلمات مثل 'Du är fantastisk!' و'hjälper mig' تدل على الشكر."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A - Uppgift 3: Varför går de på kurs? (placeholder/extension)
$secC = @'
{
  "section": "C",
  "icon": "📖",
  "title": "Läsa A – Uppgift 3",
  "instructions": "Sektion för Uppgift 3 i Läsa A (2016-10).",
  "texts": [
    {
      "heading": "Uppgift 3",
      "body": "Lägg in text och frågor för Uppgift 3 från 2016-10 om du har sidan sparad."
    }
  ],
  "questions": [],
  "arabicNotes": {
    "summary": "ملاحظة: إذا كانت لديك صفحة Uppgift 3 من امتحان 2016-10 يمكن إضافتها هنا بنفس التنسيق.",
    "explanation": "هذا القسم مخصص للسؤال الثالث في قراءة A لامتحان 2016-10.",
    "translation": "قسم إضافي للأسئلة المتبقية من 2016-10.",
    "vocabulary": [
      "kurs (دورة)",
      "fråga (سؤال)",
      "svar (إجابة)"
    ],
    "examples": [
      "Jag läser texten noggrant. (أقرأ النص بعناية.)"
    ],
    "tip": "ارفع صورة السؤال الثالث إذا أردت إضافته تلقائيًا."
  }
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A - Uppgift 4: Vad är viktigt för dig?
$secD = @'
{
  "section": "D",
  "icon": "✨",
  "title": "Läsa A – Uppgift 4: Vad är viktigt för dig?",
  "instructions": "Läs texterna om vad som är viktigt för Ludmila, Jonny, Amanda och Ryan och välj rätt alternativ.",
  "texts": [
    {
      "heading": "A. Ludmila",
      "body": "- Jag älskar att dansa och min dröm är att kunna försörja mig på det. Just nu jobbar jag på ett bageri och trivs väldigt bra. Men till hösten ska jag söka till Danshögskolan. Att komma in där är det viktigaste i livet för mig just nu."
    },
    {
      "heading": "B. Jonny",
      "body": "- För mig är det viktigt att ha människor omkring mig som jag kan lita på, både på jobbet och på fritiden. Personer som jag kan prata och skratta med när jag är glad. Men också gråta tillsammans med när livet känns svårt."
    },
    {
      "heading": "C. Amanda",
      "body": "- Jag funderar mycket på livet och vill gärna dela med mig av mina tankar. Jag har en blogg på nätet där jag lägger ut mina dikter och texter om hur jag känner mig. Det är roligt när andra vill veta hur jag tänker."
    },
    {
      "heading": "D. Ryan",
      "body": "- Det finns saker i samhället som inte fungerar, tycker jag. För mig är det viktigt att prata med andra om hur världen kan bli bättre. Man tycker inte alltid likadant men det är intressant att höra andras åsikter."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Ludmila – Vad är viktigast för henne nu?",
      "options": [
        "Att komma in på Danshögskolan",
        "Att ha vänner man kan lita på",
        "Att dela tankar på en blogg",
        "Att diskutera hur världen kan bli bättre"
      ],
      "answer": "Att komma in på Danshögskolan"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Jonny – Vad är viktigast för honom?",
      "options": [
        "Att komma in på Danshögskolan",
        "Att ha vänner man kan lita på",
        "Att dela tankar på en blogg",
        "Att diskutera hur världen kan bli bättre"
      ],
      "answer": "Att ha vänner man kan lita på"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Amanda – Vad är viktigast för henne?",
      "options": [
        "Att komma in på Danshögskolan",
        "Att ha vänner man kan lita på",
        "Att dela tankar på en blogg",
        "Att diskutera hur världen kan bli bättre"
      ],
      "answer": "Att dela tankar på en blogg"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Ryan – Vad är viktigast för honom?",
      "options": [
        "Att komma in på Danshögskolan",
        "Att ha vänner man kan lita på",
        "Att dela tankar på en blogg",
        "Att diskutera hur världen kan bli bättre"
      ],
      "answer": "Att diskutera hur världen kan bli bättre"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Ludmila تركز على دخول مدرسة الرقص العليا، Jonny يركز على وجود أصدقاء موثوقين، Amanda تركز على مشاركة أفكارها عبر المدونة، وRyan يركز على الحوار حول جعل العالم أفضل.",
    "explanation": "كل شخصية توضح ما تعتبره الأهم حاليًا في حياتها: الدراسة/الحلم، الصداقة والثقة، الكتابة والمدونة، أو النقاش المجتمعي.",
    "translation": "نصوص قصيرة حول أولويات وقيم أربعة أشخاص.",
    "vocabulary": [
      "viktigast (الأكثر أهمية)",
      "lita på (يثق بـ)",
      "tankar (أفكار)",
      "åsikter (آراء)"
    ],
    "examples": [
      "Det är viktigt att ha vänner man kan lita på. (من المهم أن يكون لديك أصدقاء تثق بهم.)"
    ],
    "tip": "ابحث عن العبارة التي تصف هدف أو قيمة كل شخص بوضوح."
  }
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsa A - Uppgift 5: En intervju med Nadia (polis)
$secE = @'
{
  "section": "E",
  "icon": "👮",
  "title": "Läsa A – Uppgift 5: En intervju med Nadia",
  "instructions": "Läs frågorna (A–D) och välj rätt svar bland textalternativen (1–5):\n1. Det är viktigt att vara ansvarsfull och noggrann. Man ska vara intresserad av människor och kunna lyssna, eftersom en polis oftast löser problem genom att prata. För att passa som polis behöver man använda både hjärta och hjärna.\n2. Man ska inte ge upp om man inte kommer in på utbildningen direkt. Det är positivt att ha erfarenhet av andra yrken och av livet, innan man utbildar sig. Det har man nytta av i jobbet sen.\n3. Jag jobbade som brevbärare tidigare och visste inte vad jag ville arbeta med i framtiden. Men så läste jag om en tjej som var polis och jag tyckte att det verkade vara ett roligt och omväxlande jobb.\n4. Alla möten med människor. Jag känner att jag gör något viktigt och att jag behövs. Jag kan inte lösa alla problem men jag kan hjälpa och stötta människor som är i svåra situationer.\n5. Om det har hänt något svårt eller tråkigt blir människor ibland arga på oss poliser. Det är okej för mig. De flesta är ändå positiva och glada över den hjälp de får.",
  "texts": [
    {
      "heading": "Intervju med polisen Nadia",
      "body": "Nadia arbetar som polis och berättar om sitt yrke, hur hon blev polis och hur det är att möta människor."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Varför blev du polis? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Hur ska en bra polis vara? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Hur brukar folk vara mot dig? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vad är det bästa med ditt jobb? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: سبب اختيار مهنة الشرطة → 3 (قراءة قصة عن شرطية ورؤيتها كعمل ممتع ومتنوع)، صفات الشرطي الجيد → 1 (مسؤول ودقيق ومستمع جيد)، تعامل الناس معها → 5 (أحيانًا غاضبون لكن معظمهم إيجابيون)، وأفضل شيء في العمل → 4 (لقاء الناس ومساعدتهم).",
    "explanation": "مقابلة مع الشرطية Nadia تشرح بدايتها المهنية، الصفات المطلوبة في الشرطي، ردود فعل الناس، وما تحبه أكثر في عملها.",
    "translation": "إجابات الشرطية Nadia حول مهنة الشرطة وتجربتها اليومية.",
    "vocabulary": [
      "polis (شرطي / شرطة)",
      "ansvarsfull (مسؤول)",
      "noggrann (دقيق)",
      "hjälpa (يساعد)"
    ],
    "examples": [
      "En polis behöver lyssna och hjälpa människor. (يحتاج الشرطي إلى الاستماع ومساعدة الناس.)"
    ],
    "tip": "طابق كل سؤال مع الفقرة التي تجيب عنه مباشرة: السبب (3)، الصفات (1)، رد فعل الناس (5)، والأفضل (4)."
  }
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

Write-Host "=== Successfully populated 2016-10 Listening and Reading (with Arabic notes)! ===" -ForegroundColor Cyan
