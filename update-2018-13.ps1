# update-2018-13.ps1 - Populates Reading (with collapsible Arabic notes) and Writing data for 2018-13

Write-Host "Populating Reading and Writing data for 2018-13..." -ForegroundColor Cyan

$examDir = "data/sfi/2018-13"
$readingDir = Join-Path $examDir "reading"
$writingDir = Join-Path $examDir "writing"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null

# ==========================================
# 1. READING CONFIG & SECTIONS (A - I)
# ==========================================

$configJson = @'
{
  "year": "2018-13",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt prov 13, 2018",
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

# Section A: Läsa A - Uppgift 1: Erika och Johan bor och arbetar på landet
$secA = @'
{
  "section": "A",
  "icon": "🐑",
  "title": "Läsa A – Uppgift 1: Erika och Johan bor och arbetar på landet",
  "instructions": "Läs artikeln om Erika och Johan i Laxviken och svara på frågorna.",
  "texts": [
    {
      "heading": "Erika och Johan bor och arbetar på landet",
      "body": "Erika och Johan Winterlia möttes tack vare Erikas mamma. Nu har de ett företag tillsammans i byn Laxviken. De trivs med sina liv och har många drömmar om framtiden.\n\nErika och Johan bor i den lilla byn Laxviken, som ligger i Jämtland i norra Sverige. Deras liv tillsammans började med hjälp av Erikas mamma, som bodde granne med Johan i Laxviken. Erika jobbade i Namibia i Afrika på den tiden. När hon kom tillbaka till Sverige, bjöd mamman hem både Erika och Johan på middag. Mötet ledde till kärlek och snart flyttade Erika in hos Johan i Laxviken.\n\nLaxviken ligger långt från närmaste större stad. Till en början reste både Erika och Johan tio mil till Östersund varje dag för att jobba.\n- Men vi längtade efter att leva på en gård med djur, nära naturen och inte behöva pendla till ett arbete, säger Erika.\n\nSå när de fick chans att köpa 160 får av en kvinna i byn, bestämde de sig direkt för att köpa fåren. Då visste de inte så mycket om hur får ska skötas. Dessutom skulle de snart få sitt första barn. Så det nya livet, med både barn och får att ta hand om, blev inte lätt.\n- I början undrade vi hur vi skulle klara av allt, säger Erika.\n\nNu har det gått några år och idag har de mer erfarenhet. Det är mycket arbete med gården, men Erika och Johan trivs ändå.\n- Vissa dagar är det tungt att vara fårbonde, andra dagar är det fantastiskt. Och det är alltid väldigt vackert, säger Johan.\n\nFåren ger familjen inkomster på flera sätt. De säljer fårkorv och köttprodukter. Och så fårskinn och saker som Erika tillverkar av ull från fåren. Erika och Johan har många idéer och drömmar, bland annat att odla alla grönsaker som familjen behöver. De måste också bygga ett nytt och modernt fårhus. Men båda två är överens om vad de vill göra först:\n- Vi hoppas att kunna starta en gårdsbutik med servering där folk som handlar kan fika!"
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Var träffade Erika sin man?",
      "options": [
        "På en restaurang.",
        "Under en resa.",
        "Hos sin mamma."
      ],
      "answer": "Hos sin mamma."
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Varför köpte Erika och Johan sina får?",
      "options": [
        "För att båda var arbetslösa.",
        "För att kunna jobba där de bor.",
        "För att fåren var billiga."
      ],
      "answer": "För att kunna jobba där de bor."
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Erika och Johan om sitt liv på gården?",
      "options": [
        "Att det alltid är lugnt och skönt.",
        "Att det oftast är svårt och kämpigt.",
        "Att det är bra men jobbigt ibland."
      ],
      "answer": "Att det är bra men jobbigt ibland."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vad säger de om framtiden?",
      "options": [
        "Att de vill ha en stor familj.",
        "Att de vill starta en gårdsbutik med servering / café.",
        "Att de vill köpa fler får."
      ],
      "answer": "Att de vill starta en gårdsbutik med servering / café."
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Vad handlar texten mest om?",
      "options": [
        "Att vara ute i naturen.",
        "Att tjäna mycket pengar.",
        "Att leva som man vill."
      ],
      "answer": "Att leva som man vill."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: إجابات حول حياة Erika و Johan في الريف.",
    "explanation": "النص يوضح انتقال العائلة إلى الريف، الصعوبات والفوائد، وكيف يعيشون ويعملون هناك.",
    "translation": "المقال يصف كيف يعيش Erika و Johan في الريف، ويعملان على مزرعتهما، ويخططان للمستقبل.",
    "vocabulary": [
      "landsbygd (ريف)",
      "familj (عائلة)",
      "framtid (مستقبل)",
      "självförsörjande (مكتفٍ ذاتيًا)"
    ],
    "examples": [
      "De bor på landsbygden. (إنهم يعيشون في الريف.)"
    ],
    "tip": "في مقالات الحياة اليومية، ركّز على الجمل التي تصف المكان وطريقة العيش."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A - Uppgift 2: Ett diagram (Antal djur i olika län i Sverige)
$secB = @'
{
  "section": "B",
  "icon": "📊",
  "title": "Läsa A – Uppgift 2: Ett diagram (Antal djur i olika län)",
  "instructions": "Studera diagrammet som visar hur många får, kor och hästar det finns i några län i Sverige år 2016 och svara på frågorna.",
  "texts": [
    {
      "heading": "Information om diagrammet",
      "body": "Diagrammet visar antal djur (får, kor och hästar) i länen Dalarna, Gotland, Jämtland, Skåne, Stockholm och Örebro år 2016.\nKälla: Jordbruksverket. Kor avser här kor för mjölkproduktion."
    }
  ],
  "charts": [
    {
      "id": "chartAnimals2016",
      "type": "bar",
      "title": "Antal djur i olika län i Sverige (2016)",
      "labels": ["Dalarna", "Gotland", "Jämtland", "Skåne", "Stockholm", "Örebro"],
      "datasets": [
        {
          "label": "får",
          "data": [7500, 26000, 4500, 18000, 7500, 8000],
          "backgroundColor": "#0284c7"
        },
        {
          "label": "kor",
          "data": [5500, 15000, 6000, 23000, 3000, 5000],
          "backgroundColor": "#f59e0b"
        },
        {
          "label": "hästar",
          "data": [2500, 2500, 1500, 6000, 6500, 1500],
          "backgroundColor": "#e2e8f0"
        }
      ]
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vilket av djuren är vanligast i Dalarna?",
      "options": ["får", "kor", "hästar"],
      "answer": "får"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. I vilket län finns det ungefär lika många får och hästar?",
      "options": ["Dalarna", "Gotland", "Jämtland", "Skåne", "Stockholm", "Örebro"],
      "answer": "Stockholm"
    },
    {
      "id": "B_Q3",
      "type": "short",
      "prompt": "C. Hur många kor finns det på Gotland?",
      "answer": "15000 kor",
      "acceptedAnswers": ["15000 kor", "15000", "15 000 kor", "15 000"]
    }
  ],
  "arabicNotes": {
    "summary": "الحل: أسئلة حول عدد الحيوانات في مناطق مختلفة من السويد (kor, får, hästar).",
    "explanation": "الرسم يوضح مقارنة بين الأقاليم (län) وعدد الحيوانات.",
    "translation": "مثلاً في Gotland يوجد عدد كبير من الأبقار والأغنام مقارنة بالخيول.",
    "vocabulary": [
      "djur (حيوان)",
      "kor (أبقار)",
      "får (أغنام)",
      "hästar (خيول)"
    ],
    "examples": [
      "Det finns många kor på Gotland. (هناك الكثير من الأبقار في غوتلاند.)"
    ],
    "tip": "عند قراءة الرسوم البيانية، ابحث عن القيم الأكبر والأصغر وقارن الأعمدة بدقة."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A - Uppgift 3: En intervju med snickare (Axel)
$secC = @'
{
  "section": "C",
  "icon": "🔨",
  "title": "Läsa A – Uppgift 3: En intervju med en snickare",
  "instructions": "Axel är snickare och har ett eget företag. Läs frågorna och välj bland svaren (1–6).",
  "texts": [
    {
      "heading": "Svar från intervjun (1–6)",
      "body": "1. Det är att kunna planera jobbet. Det kan bli stressigt om ett jobb tar längre tid än jag har tänkt och då blir det problem att bli klar i tid.\n\n2. Kontakta någon som jobbar med att bygga och be att få praktisera hos honom eller henne. Då kan du se om det är rätt jobb för dig.\n\n3. För att jag var trött på det jobbet som jag hade då och ville prova något annat. Jag hade hjälpt folk med att snickra och bygga tidigare, så jag visste att jag skulle klara det.\n\n4. Jag kanske inte har kvar min firma om tio år men jag kommer nog att snickra ibland ändå åt vänner och släktingar.\n\n5. En snickare bygger till exempel möbler, kök och väggar. Snickare kan också bygga hus.\n\n6. Att jag bestämmer själv vilka jobb jag ska göra, det är skönt. Och så att möta kunder som är nöjda och tycker att jag har gjort ett bra jobb."
    }
  ],
  "questions": [
    {
      "id": "C_Q0",
      "type": "mcq",
      "prompt": "Exempel: Vad gör en snickare?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "C_Q1",
      "type": "mcq",
      "prompt": "A. Varför startade du ditt företag?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    },
    {
      "id": "C_Q2",
      "type": "mcq",
      "prompt": "B. Vad är det bästa med ditt arbete?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "C_Q3",
      "type": "mcq",
      "prompt": "C. Vad är svårt i ditt arbete?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    },
    {
      "id": "C_Q4",
      "type": "mcq",
      "prompt": "D. Vilket råd vill du ge till en person som vill bli snickare?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: اختيار الجواب الصحيح حسب المقابلة مع النجار (snickare).",
    "explanation": "النجار يشرح لماذا بدأ شركته، ما هو الأفضل والأصعب في عمله، وما هي نصيحته.",
    "translation": "النص يوضح تفاصيل مهنة النجار وأعماله اليومية.",
    "vocabulary": [
      "snickare (نجار)",
      "möbler (أثاث)",
      "verktyg (أدوات)",
      "kunder (زبائن)"
    ],
    "examples": [
      "Jag bygger möbler. (أنا أبني أثاثًا.)",
      "Han är snickare. (هو نجار.)"
    ],
    "tip": "في المقابلات، اقرأ إجابات الشخص بعناية وابحث عن السبب أو الصعوبة أو النصيحة."
  }
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A - Uppgift 4: Tips på internet (Dela saker och tjänster)
$secD = @'
{
  "section": "D",
  "icon": "🤝",
  "title": "Läsa A – Uppgift 4: Tips på internet",
  "instructions": "Några personer berättar på en webbsida om hur man kan dela saker och tjänster med varandra i vardagen. Skriv personens namn.",
  "texts": [
    {
      "heading": "Petter",
      "body": "- Jag och min sambo har hittat en webbsida där man kan anmäla sig om man vill laga en middag för personer som man inte känner. Spännande att få träffa nya människor!"
    },
    {
      "heading": "Maja",
      "body": "- Jag tar bilen till jobbet i stan för bussen går så sällan här. Men vi är tre grannar som brukar göra sällskap dit och hem. En av oss kör och så delar vi på kostnaden för bensinen."
    },
    {
      "heading": "Georg",
      "body": "- När man ska ha en stor fest och det fattas stolar, glas och tallrikar kan man fråga sina grannar eller vänner om de har. Så kan man också göra med gräsklippare, symaskin och annat som man inte använder ofta."
    },
    {
      "heading": "Selma",
      "body": "- I vårt bostadshus har vi en lokal där vi kan reparera cyklar, möbler, barnvagnar och annat som har gått sönder. Där kan alla som bor i huset hjälpas åt med det."
    },
    {
      "heading": "Ali",
      "body": "- Vi har en stor trädgård och kan inte äta upp all frukt som vi får. Vi brukar ställa en korg full med äpplen bredvid brevlådan och skriva 'Varsågod!' så att folk som går förbi kan ta med lite frukt."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "short",
      "prompt": "A. Vem ger tips om att åka tillsammans?",
      "answer": "Maja",
      "acceptedAnswers": ["Maja", "maja"]
    },
    {
      "id": "D_Q2",
      "type": "short",
      "prompt": "B. Vem ger tips om att låna saker av varandra?",
      "answer": "Georg",
      "acceptedAnswers": ["Georg", "georg"]
    },
    {
      "id": "D_Q3",
      "type": "short",
      "prompt": "C. Vem ger tips om att bjuda hem någon på mat?",
      "answer": "Petter",
      "acceptedAnswers": ["Petter", "petter"]
    },
    {
      "id": "D_Q4",
      "type": "short",
      "prompt": "D. Vem ger tips om att fixa trasiga saker tillsammans?",
      "answer": "Selma",
      "acceptedAnswers": ["Selma", "selma"]
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة النصائح مع الأسماء (Maja, Georg, Petter, Selma, Ali).",
    "explanation": "كل شخص يعطي نصيحة عن المشاركة والتعاون بين الجيران أو الناس في الحياة اليومية.",
    "translation": "النصائح تدور حول مساعدة الآخرين، مشاركة الأشياء، والتعاون.",
    "vocabulary": [
      "tips (نصيحة)",
      "hjälpa (يساعد)",
      "låna (يستعير / يقرض)",
      "grannar (جيران)"
    ],
    "examples": [
      "Jag vill ge ett tips. (أريد أن أقدم نصيحة.)"
    ],
    "tip": "عند قراءة نصوص قصيرة، اربط كل جملة بالشخص المناسب."
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
  "instructions": "Läs vad personerna har skrivit och svara på frågorna genom att skriva personens namn (Talita, Gunnar, Ellen, Johan, Karin).",
  "texts": [
    {
      "heading": "Talita",
      "body": "- Ni som röker på balkongen, var snälla och sluta med det! Röken kommer in i andras lägenheter. Dessutom är det inte kul med fimparna på marken."
    },
    {
      "heading": "Gunnar",
      "body": "- Nu när det är vinter och mörkt ute, glöm inte att sätta på reflexer på er själva, era barn och husdjur. Det är den bästa och billigaste livförsäkringen."
    },
    {
      "heading": "Ellen",
      "body": "- Du som hjälpte mig till sjukhuset när jag ramlade vid stationen i Råstad den 27/8. Jag skadade mig i foten men mår bra nu. Tyvärr vet jag inte vad du heter men jag vill ge dig en stor kram. Utan dig vet jag inte hur det hade gått!"
    },
    {
      "heading": "Johan",
      "body": "- Du äldre kvinna eller man! Vår familj tycker om att lära känna nya människor. Våra barn vill ha en extra mormor eller morfar. Vill du komma och fika eller äta middag med oss ibland? Du är varmt välkommen! Tidningen har mitt telefonnummer."
    },
    {
      "heading": "Karin",
      "body": "- Jag bor ensam med min hund, Lajka. Nu har jag brutit benet och kan inte promenera. Tycker du om djur och har tid och lust att gå ut med min hund så är du välkommen att höra av dig till mig. Tidningen har mitt telefonnummer."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "short",
      "prompt": "A. Vem vill tacka för något?",
      "answer": "Ellen",
      "acceptedAnswers": ["Ellen", "ellen"]
    },
    {
      "id": "E_Q2",
      "type": "short",
      "prompt": "B. Vem vill be om hjälp?",
      "answer": "Karin",
      "acceptedAnswers": ["Karin", "karin"]
    },
    {
      "id": "E_Q3",
      "type": "short",
      "prompt": "C. Vem är arg på något?",
      "answer": "Talita",
      "acceptedAnswers": ["Talita", "talita"]
    },
    {
      "id": "E_Q4",
      "type": "short",
      "prompt": "D. Vem vill bjuda hem någon?",
      "answer": "Johan",
      "acceptedAnswers": ["Johan", "johan"]
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة الرسائل مع الأشخاص (Ellen, Karin, Talita, Johan).",
    "explanation": "الصفحة تعرض رسائل قصيرة من القراء، مثل الشكر، طلب المساعدة، الانزعاج، أو الدعوة.",
    "translation": "كل نص يعبر عن رأي أو طلب أو شكر من قارئ.",
    "vocabulary": [
      "tidning (جريدة)",
      "läsare (قارئ)",
      "tacka (يشكر)",
      "klaga (يشتكي)"
    ],
    "examples": [
      "Jag läser tidningen. (أنا أقرأ الجريدة.)"
    ],
    "tip": "اقرأ بعناية وابحث عن الكلمات المفتاحية مثل الشكر أو المساعدة أو الدعوة."
  }
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Läsa A - Uppgift 6: Personliga åsikter (Camilla, Joram, Ida, Toni)
$secF = @'
{
  "section": "F",
  "icon": "💭",
  "title": "Läsa A – Uppgift 6: Personliga åsikter",
  "instructions": "Läs texterna (A–D) och välj rätt alternativ (1–7).\n\nAlternativ:\n1. Att skratta\n2. Att vila\n3. Att sporta\n4. Att vara utomhus\n5. Att kramas\n6. Att äta gott\n7. Att hjälpa andra",
  "texts": [
    {
      "heading": "Text A (Camilla)",
      "body": "- Jag älskar att hitta på egna recept men också att smaka nya spännande rätter. Det är härligt att njuta av en måltid tillsammans med någon som man tycker om."
    },
    {
      "heading": "Text B (Joram)",
      "body": "- Att träna var viktigt för mig förut. Men nu har jag två små barn att ta hand om. För att orka det är det viktigt för mig att sova åtta timmar på natten och inte göra någonting alls ibland."
    },
    {
      "heading": "Text C (Ida)",
      "body": "- Vintern är här och det är kallt. Många av de som inte har något hem sover ute. Därför har jag börjat samla in kläder och skor som jag ska ge till dem. Det blir jag glad av."
    },
    {
      "heading": "Text D (Toni)",
      "body": "- Att sitta i soffan och mysa med min flickvän får mig att må bra. När hon är nära mig och vi håller om varandra känner jag mig lycklig. Jag har läst att kroppskontakt är bra mot stress."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Vilket alternativ passar bäst till text A?",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "6"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vilket alternativ passar bäst till text B?",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "2"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vilket alternativ passar bäst till text C?",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "7"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vilket alternativ passar bäst till text D?",
      "options": ["1", "2", "3", "4", "5", "6", "7"],
      "answer": "5"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة كل شخص بالنشاط المناسب (Att äta gott, Att vila, Att hjälpa andra, Att kramas).",
    "explanation": "النصوص تعبر عن أنشطة مختلفة تمنح الأشخاص الراحة أو السعادة مثل الأكل الطيب، الراحة، مساعدة الآخرين، والمعانقة.",
    "translation": "كل شخص يذكر نشاطًا يجعله مرتاحًا أو سعيدًا.",
    "vocabulary": [
      "skratta (يضحك)",
      "sporta (يمارس الرياضة)",
      "vila (يرتاح)",
      "krama (يعانق)"
    ],
    "examples": [
      "Jag vill vila. (أريد أن أرتاح.)"
    ],
    "tip": "في النصوص القصيرة، اربط النشاط المذكور بالكلمة الأساسية في الاختيارات."
  }
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Läsa A - Uppgift 7: Danskurs (Rashid och Kate)
$secG = @'
{
  "section": "G",
  "icon": "💃",
  "title": "Läsa A – Uppgift 7: Danskurs",
  "instructions": "Några personer berättar om varför de går på danskurs. Läs vad personerna säger och svara på frågorna.",
  "texts": [
    {
      "heading": "Rashid",
      "body": "- Jag jobbar mycket och blir ofta stressad. Men när jag dansar slappnar jag av och somnar lätt på kvällen sen när jag kommer hem från kursen."
    },
    {
      "heading": "Kate",
      "body": "- Jag hade aldrig dansat när jag träffade min man. Men eftersom han älskar det bestämde jag mig för att gå en kurs och se om jag också gillar det. Det är svårt men samtidigt bra för mig eftersom vi kan öva hemma."
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "A. Varför går Rashid på danskurs?",
      "options": [
        "För att bli glad.",
        "För att bli lugn.",
        "För att bli stark."
      ],
      "answer": "För att bli lugn."
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "B. Varför går Kate på danskurs?",
      "options": [
        "För att prova något nytt.",
        "För att lära sig svenska.",
        "För att hitta en partner."
      ],
      "answer": "För att prova något nytt."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: اختيار الإجابة الصحيحة لسبب المشاركة في دورة الرقص (danskurs).",
    "explanation": "بعضهم يذهب للاسترخاء وتخفيف التوتر، وآخرون لتجربة شيء جديد.",
    "translation": "الأسباب مختلفة لتجربة شيء جديد أو للاسترخاء.",
    "vocabulary": [
      "dans (رقص)",
      "kurs (دورة)",
      "prova (يجرب)",
      "partner (شريك)"
    ],
    "examples": [
      "Jag går på danskurs. (أشارك في دورة رقص.)"
    ],
    "tip": "اقرأ إجابات كل شخص وابحث عن السبب المباشر."
  }
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Läsa B - Melodifestivalen, Annonser & Loppis
$secH = @'
{
  "section": "H",
  "icon": "🛍️",
  "title": "Läsa B – Melodifestivalen, Annonser och Loppis",
  "instructions": "Läs texterna om Melodifestivalen, annonserna (1–5) och intervjuerna på loppisen och svara på frågorna.",
  "texts": [
    {
      "heading": "Melodifestivalen – Åsikter",
      "body": "• Anne: Roligt med ett program som nästan alla i landet tittar på. Då har man något att prata om på jobbet veckan efteråt!\n• Luiza: - Jag är helt ointresserad av Melodifestivalen. Jag tittar faktiskt aldrig. Det finns så mycket annat som är roligare att titta på.\n• Dawit: - Jag förstår inte varför en del människor är så negativa till Melodifestivalen. Bästa programmet på hela året, tycker jag.\n• Birgitta: Jag tittar tillsammans med barnen. Själv gillar jag inte musiken, den är lite tjatig. Men det är kul att se artisterna och de duktiga dansarna.\n• Benjamin: - Jag vet att många andra ser på Melodifestivalen. Men jag tycker att det är tråkigt. Man skulle kunna använda pengarna till intressanta naturprogram istället."
    },
    {
      "heading": "Annonser i lokaltidningen (1–5)",
      "body": "1. Café Funkis: Caféet riktar sig till dig som har någon funktionsvariation. Onsdagar kl. 18.30-20.30. Vi fikar, pratar, spelar spel och har kul ihop.\n\n2. Plötsligt händer det: Vet du vad du ska göra i en akut situation? På vår kurs får du veta hur man räddar liv och tar hand om en person som är sjuk eller skadad. Många praktiska övningar, vi tränar bland annat hjärt- och lungräddning.\n\n3. En bandmedlem sökes! Vill du vara med och starta ett band med oss? Vi har basist, trummis och gitarrist, men söker en duktig sångare. Vi gillar mest att spela rock och pop.\n\n4. Mötesplats Toppform: Cirkelgym för seniorer. Förbättra din styrka och kondition! Måndagar och torsdagar kl. 10.30-11.30.\n\n5. Fixarverkstaden: Digitala verkstaden – varje vecka på måndagar kl. 15-18 på biblioteket. Här får du hjälp med att använda dator, surfplatta och smarta telefoner för att fixa enkla saker i vardagen, till exempel bankärenden."
    },
    {
      "heading": "Intervjuer på en loppis",
      "body": "• Elida: Jag ska snart flytta och har upptäckt att jag har mer grejer än vad jag behöver. Jag står och säljer här för att få lite mer plats hemma i skåpen och förrådet.\n• Martin: Jag har alltid varit intresserad av äldre glas men även böcker och smycken. Här hittar jag alltid något som jag själv vill ha eller som jag kan ge bort i present.\n• Vera: Jag har inte så stor inkomst nu när jag pluggar. Så jag säljer på loppis ibland för att ha råd att resa någonstans i sommar."
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "Melodifestivalen A. Vad tycker Anne om programmet?",
      "options": ["bra", "dåligt", "både bra och dåligt"],
      "answer": "bra"
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "Melodifestivalen B. Vad tycker Luiza om programmet?",
      "options": ["bra", "både bra och dåligt", "dåligt"],
      "answer": "dåligt"
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "Melodifestivalen C. Vad tycker Dawit om programmet?",
      "options": ["bra", "dåligt", "både bra och dåligt"],
      "answer": "bra"
    },
    {
      "id": "H_Q4",
      "type": "mcq",
      "prompt": "Melodifestivalen D. Vad tycker Birgitta om programmet?",
      "options": ["bra", "dåligt", "både bra och dåligt"],
      "answer": "både bra och dåligt"
    },
    {
      "id": "H_Q5",
      "type": "mcq",
      "prompt": "Melodifestivalen E. Vad tycker Benjamin om programmet?",
      "options": ["bra", "dåligt", "både bra och dåligt"],
      "answer": "dåligt"
    },
    {
      "id": "H_Q6",
      "type": "mcq",
      "prompt": "Annonser A. Anna vill sjunga tillsammans med musiker. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "H_Q7",
      "type": "mcq",
      "prompt": "Annonser B. Olle vill bli starkare i sin rygg och vill träna på dagtid. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "H_Q8",
      "type": "mcq",
      "prompt": "Annonser C. Nadia vill lära sig att betala räkningar på internet. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "H_Q9",
      "type": "mcq",
      "prompt": "Annonser D. Enver vill lära sig hur man kan hjälpa en människa vid en olycka. Vilken annons passar bäst?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    },
    {
      "id": "H_Q10",
      "type": "mcq",
      "prompt": "Loppis A. Varför är Elida på loppisen?",
      "options": ["Hon tycker om gamla saker.", "Hon tänker på miljön.", "Hon har för många saker."],
      "answer": "Hon har för många saker."
    },
    {
      "id": "H_Q11",
      "type": "mcq",
      "prompt": "Loppis B. Varför är Martin på loppisen?",
      "options": ["Han behöver pengar.", "Han tycker om gamla saker.", "Han vill träffa människor."],
      "answer": "Han tycker om gamla saker."
    },
    {
      "id": "H_Q12",
      "type": "mcq",
      "prompt": "Loppis C. Varför är Vera på loppisen?",
      "options": ["Hon tänker på miljön.", "Hon vill träffa människor.", "Hon behöver pengar."],
      "answer": "Hon behöver pengar."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: آراء حول البرنامج الموسيقي، مطابقة الإعلانات (Anna → 3, Olle → 4, Nadia → 5, Enver → 2)، وأسباب وجود الأشخاص في سوق المستعمل (loppis).",
    "explanation": "تتضمن هذه المجموعة آراء حول برنامج موسيقي، إعلانات عن أنشطة وخدمات، ومقابلات في سوق المستعمل.",
    "translation": "النصوص تعبر عن آراء إيجابية وسلبية، خدمات مثل التدريب أو دفع الفواتير، وأسباب البيع والشراء في سوق المستعمل.",
    "vocabulary": [
      "tävling (مسابقة)",
      "musik (موسيقى)",
      "roligt (ممتع)",
      "dåligt (سيئ)",
      "annons (إعلان)",
      "träna (يتدرب)",
      "betala (يدفع)",
      "olycka (حادث)",
      "loppis (سوق مستعمل)",
      "gamla saker (أشياء قديمة)",
      "sälja (يبيع)",
      "köpa (يشتري)"
    ],
    "examples": [
      "Programmet är roligt. (البرنامج ممتع.)",
      "Jag tränar på gym. (أتدرب في النادي.)",
      "Jag säljer på loppis. (أبيع في سوق المستعمل.)"
    ],
    "tip": "ابحث عن الكلمات المفتاحية التي تتطابق مع طلب الشخص أو السبب المباشر في النص."
  }
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

# Section I: Läsa B - Nationalpark (Garphyttan), Mejl på arbetsplats & En blogg (Senait)
$secI = @'
{
  "section": "I",
  "icon": "🌲",
  "title": "Läsa B – Nationalpark, Mejl och Fotbollsblogg",
  "instructions": "Läs texterna om Garphyttans nationalpark, mejlen på arbetsplatsen och Senaits fotbollsblogg och svara på frågorna.",
  "texts": [
    {
      "heading": "Information om en nationalpark (Garphyttan)",
      "body": "• Text A: Garphyttan ligger cirka 25 kilometer från Örebro. Inga bussar stannar här, så bil är det bästa sättet att ta sig hit. Du kör väg E18 västerut från Örebro - lättast är att se karta på internet!\n• Text B: Ett bra sätt att se och uppleva naturen här är att gå den tre kilometer långa Bergstigen. Den går förbi ängar, genom skog och upp på ett berg där du kan titta på utsikten. I området finns också flera kortare gångvägar att välja mellan.\n• Text C: Du får gärna plocka bär och svamp i nationalparken. Men du får inte plocka blommor och stenar eller skada träd och buskar. Tänk på att du bara får elda på grillplatserna.\n• Text D: Nationalparken är gratis och vem som helst kan besöka parken. Rastplatsen, grillplatsen och de flesta små vägar fungerar bra även för dig som har barnvagn eller rullstol.\n\nRubriker (1–6): 1. En park för alla | 2. Kontakta oss | 3. Parkering | 4. Våra regler | 5. Promenader | 6. Hitta till oss"
    },
    {
      "heading": "Mejl på en arbetsplats",
      "body": "• Anders: Hallå alla kollegor! I går blev jag morfar! Kom och fira med mig i lunchrummet i eftermiddag klockan 15. Jag har bakat äppelkaka.\n• Soraya: Hej! Jag hittar inte den stora termosen till kaffet. Den står inte i skåpet där den brukar vara. Hör av dig till mig om du har sett den någonstans är du snäll!\n• Michael: Hej! Jag behöver ditt kontonummer så att jag kan sätta in din lön i slutet av månaden. Mejla det så snart som möjligt!\n• John: God morgon! Jag har fått en akut tid hos tandläkaren nu på morgonen så jag hinner inte vara med på vårt morgonmöte. Jag är på jobbet vid elva. Hoppas att det är okej!"
    },
    {
      "heading": "En blogg (Senait)",
      "body": "Vi har världens bästa tränare och jag är bra kompis med alla i mitt fotbollslag. Vi har jättekul ihop! Det är viktigare än att [A] alla matcher.\n\nIbland får jag träna i ett lag med äldre spelare. Det är inte lätt för mig för de äldre är jättebra. Men jag lär mig mycket när jag spelar med dem. Jag vill träna mycket så att jag blir lika [B] som dem.\n\nVarje sommarlov har klubben en fotbollsskola. Jag älskade fotbollsskolan när jag var liten. Och i år ska jag vara ledare där. Jag längtar till det. Det ska bli så [C]!\n\nI vårt fotbollslag finns det ungdomar från olika delar av världen. Några har kommit hit för bara några månader sen. Men vi kan spela tillsammans ändå för det är [D] regler i fotboll i alla länder."
    }
  ],
  "questions": [
    {
      "id": "I_Q1",
      "type": "mcq",
      "prompt": "Nationalpark A. Vilken rubrik passar bäst till text A?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "I_Q2",
      "type": "mcq",
      "prompt": "Nationalpark B. Vilken rubrik passar bäst till text B?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "I_Q3",
      "type": "mcq",
      "prompt": "Nationalpark C. Vilken rubrik passar bäst till text C?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "I_Q4",
      "type": "mcq",
      "prompt": "Nationalpark D. Vilken rubrik passar bäst till text D?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    },
    {
      "id": "I_Q5",
      "type": "mcq",
      "prompt": "Mejl A. Vad vill Anders?",
      "options": ["tacka för något", "bjuda på något", "be om hjälp"],
      "answer": "bjuda på något"
    },
    {
      "id": "I_Q6",
      "type": "mcq",
      "prompt": "Mejl B. Vad vill Soraya?",
      "options": ["bjuda på något", "fråga efter något", "tacka för något"],
      "answer": "fråga efter något"
    },
    {
      "id": "I_Q7",
      "type": "mcq",
      "prompt": "Mejl C. Vad vill Michael?",
      "options": ["bestämma en tid", "fråga efter något", "be om ursäkt"],
      "answer": "fråga efter något"
    },
    {
      "id": "I_Q8",
      "type": "mcq",
      "prompt": "Mejl D. Vad vill John?",
      "options": ["boka något", "meddela försening", "be om hjälp"],
      "answer": "meddela försening"
    },
    {
      "id": "I_Q9",
      "type": "mcq",
      "prompt": "Blogg A. Vilket ord passar i texten?",
      "options": ["kunna", "träffa", "vinna"],
      "answer": "vinna"
    },
    {
      "id": "I_Q10",
      "type": "mcq",
      "prompt": "Blogg B. Vilket ord passar i texten?",
      "options": ["gammal", "glad", "duktig"],
      "answer": "duktig"
    },
    {
      "id": "I_Q11",
      "type": "mcq",
      "prompt": "Blogg C. Vilket ord passar i texten?",
      "options": ["svårt", "roligt", "långt"],
      "answer": "roligt"
    },
    {
      "id": "I_Q12",
      "type": "mcq",
      "prompt": "Blogg D. Vilket ord passar i texten?",
      "options": ["lagom", "samma", "tyvärr"],
      "answer": "samma"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مطابقة نصوص الحديقة الوطنية مع العناوين، تحديد غرض رسائل العمل، واختيار الكلمات المناسبة في المدونة.",
    "explanation": "تقدم نصوص الحديقة الوطنية معلومات عن الوصول، المشي، القواعد، وإتاحة المكان للجميع؛ والرسائل توضح دعوة أو سؤالًا أو تأخيرًا؛ والمدونة تتحدث عن فريق كرة القدم.",
    "translation": "النصوص توضح كيفية الوصول إلى الحديقة، قواعدها، رسائل العمل، وأنشطة فريق كرة القدم.",
    "vocabulary": [
      "nationalpark (حديقة وطنية)",
      "regler (قواعد)",
      "promenad (تمشية)",
      "gratis (مجاني)",
      "mejl (بريد إلكتروني)",
      "fråga (يسأل)",
      "bjuda (يدعو)",
      "försening (تأخير)",
      "fotboll (كرة القدم)",
      "vinna (يفوز)",
      "träna (يتدرب)",
      "lag (فريق)"
    ],
    "examples": [
      "Nationalparken är gratis. (الحديقة الوطنية مجانية.)",
      "Jag skickar ett mejl. (أرسل بريدًا إلكترونيًا.)",
      "Vi vill vinna matchen. (نريد أن نفوز بالمباراة.)"
    ],
    "tip": "اقرأ العناوين بدقة، وركّز على الفعل الأساسي في الرسائل، واختر الكلمة التي تكمل المعنى في المدونة."
  }
}
'@
Set-Content -Path "$readingDir/I.json" -Value $secI -Encoding utf8

# ==========================================
# 2. WRITING PROMPT (prompt.json)
# ==========================================

$writingPrompt = @'
{
  "examId": "2018-13",
  "title": "Skriv ett mejl till en vän (Tacka nej till en fest)",
  "promptHtml": "<p><strong>Du har fått en inbjudan till en fest från en kompis men du kan inte gå på festen.</strong></p><p style='margin-top: 8px;'><strong>Skriv ett mejl till din vän och berätta att du inte kan komma.</strong></p><p style='margin-top: 12px;'><strong>Du ska skriva om de här punkterna:</strong></p><ul><li>tacka för inbjudan,</li><li>berätta att du inte kan komma,</li><li>förklara varför du inte kan komma,</li><li>ge förslag på en annan dag då ni kan träffas,</li><li>ge förslag på vad ni kan göra då.</li></ul><p style='margin-top: 8px; color: var(--text-muted); font-size: 0.9rem;'>Tänk på hur du börjar och avslutar mejlet.</p>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $writingPrompt -Encoding utf8

Write-Host "=== Successfully populated 2018-13 Reading (with Arabic notes) and Writing! ===" -ForegroundColor Cyan
