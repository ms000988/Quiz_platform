# update-2016-9.ps1 - Populates Reading (Läsa A & Läsa B with Arabic notes) for 2016-9

Write-Host "Populating Reading data for 2016-9..." -ForegroundColor Cyan

$examDir = "data/sfi/2016-9"
$readingDir = Join-Path $examDir "reading"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null

# ==========================================
# READING CONFIG & SECTIONS (A - H)
# ==========================================

$configJson = @'
{
  "year": "2016-9",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt slutprov 9, 2016, Kurs C",
  "passThreshold": 0.6,
  "sections": [
    "A.json",
    "B.json",
    "C.json",
    "D.json",
    "E.json",
    "F.json",
    "G.json",
    "H.json"
  ]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Läsa A - Kärlek på distans
$secA = @'
{
  "section": "A",
  "icon": "🌏",
  "title": "Läsa A – Kärlek på distans",
  "instructions": "Läs artikeln Kärlek på distans om Emma och Bao och svara på frågorna.",
  "texts": [
    {
      "heading": "Kärlek på distans",
      "body": "Emma flyttade till Kina efter studenten och där träffade hon Bao. De blev kära i varandra, men det tog lång tid innan de kunde leva ihop i samma land.\n\nEmma kommer från Örebro, där hon växte upp och gick på en skola för döva. När hon var nitton år, åkte hon till Peking i Kina för att studera konst i ett år. Hon fick snabbt nya vänner och efter bara en månad träffade hon Bao på en fest.\n- Jag brukade umgås med en tjej som hette Li Jing. Hon jobbade extra på ett café i närheten av min bostad. En kväll bjöd Li Jing hem mig, tillsammans med några av sina gamla kompisar, för att fira sin födelsedag. Det var där och då som jag och Bao såg varandra för första gången, berättar Emma.\n\nEmma och Bao hade samma intressen. De kände att de gillade varandra och började träffas ofta. Efter några veckor blev de ett par.\nEtt år senare, när Emma var klar med sina studier i Kina, flyttade hon tillbaka till Örebro för att gå på högskolan där. Bao stannade kvar i Kina eftersom han precis hade börjat på ett nytt jobb.\n- Vi visste från början att det skulle ta ett tag innan vi kunde bo i samma land, men det var inte ett problem eftersom vår kärlek var så stark, berättar Emma.\n\nSenare, efter nästan fyra år, bestämde de att det var dags att bo tillsammans. Det var jobbigt och dyrt med alla resor och de saknade varandra. De pratade mycket om vilket land de skulle bo i, vilka fördelar och nackdelar som fanns i de olika länderna. De pratade också om arbete, familj och ekonomi.\nMen det som fick dem att bestämma sig för Peking till slut, var att de fick en lägenhet där. Den låg på 22:a våningen och hade en fantastisk utsikt. Vi kände att det var rätt, berättar Emma.\n\nNu kunde de äntligen flytta ihop. Emma berättar att det var skönt att få bo tillsammans på riktigt efter så många år långt ifrån varandra. Men hon berättar att det var svårt också.\n- Vi var glada över att äntligen få bo tillsammans, men det var också lite kämpigt i början. Vi var båda vana vid att ha egna liv och göra som vi själva ville, berättar Emma.\nMen med tiden blev det enklare och de bor fortfarande kvar i Peking. Emma längtar till Sverige ibland men de har inga planer på att flytta just nu. På frågan om hon rekommenderar andra att flytta utomlands om de träffar kärleken svarar hon:\n- Ja absolut! Vi lever bara en gång, varför inte testa något nytt och spännande?"
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Var träffades Emma och Bao?",
      "options": [
        "På jobbet",
        "På universitetet",
        "Hos en vän"
      ],
      "answer": "Hos en vän"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Varför flyttade Emma hem till Sverige igen?",
      "options": [
        "För att jobba",
        "För att studera",
        "För att bo med familjen"
      ],
      "answer": "För att studera"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Varför bestämde sig Emma och Bao för att bo i Peking?",
      "options": [
        "De fick bostad där.",
        "De fick arbete där.",
        "De fick bättre ekonomi där."
      ],
      "answer": "De fick bostad där."
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Hur tyckte Emma det var att bo tillsammans i början?",
      "options": [
        "Bra",
        "Jobbigt",
        "Både bra och jobbigt"
      ],
      "answer": "Både bra och jobbigt"
    },
    {
      "id": "A_Q5",
      "type": "mcq",
      "prompt": "E. Vilket råd ger Emma till andra som träffar kärleken i ett annat land?",
      "options": [
        "Våga pröva!",
        "Lär er varandras språk!",
        "Res mycket tillsammans!"
      ],
      "answer": "Våga pröva!"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: التقيا عند صديقة (Hos en vän)، وعادت Emma إلى السويد للدراسة (För att studera)، وقررا السكن في بكين لأنهما حصلا على شقة هناك (De fick bostad där)، وفي البداية كان الأمر مختلطًا بين الفرح والصعوبة (Både bra och jobbigt)، ونصيحتها هي أن يجرّبوا بجرأة (Våga pröva!).",
    "explanation": "يتناول المقال قصة حب عن بعد بين Emma وBao منذ تعارفهما في بكين حتى انتقالهما للعيش معًا هناك.",
    "translation": "حب عن بعد: قصة انتقال وعيش مشترك بعد سنوات من البعد.",
    "vocabulary": [
      "distans (مسافة / عن بُعد)",
      "bostad (سكن / شقة)",
      "kämpigt (شاق / فيه صعوبة)",
      "våga pröva (يجرؤ على التجربة)"
    ],
    "examples": [
      "De bestämde sig för att bo i Peking eftersom de fick en lägenhet där. (قررا السكن في بكين لأنهما حصلا على شقة هناك.)"
    ],
    "tip": "انتبه للجمل التي تشرح السبب (eftersom / det som fick dem att bestämma sig) وللمشاعر المزدوجة في بداية السكن المشترك."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A - Uppgift 2: En intervju med Erik
$secB = @'
{
  "section": "B",
  "icon": "🏡",
  "title": "Läsa A – Uppgift 2: En intervju med Erik",
  "instructions": "Erik Berg har öppnat ett eget vandrarhem. Läs frågorna (A–D) och välj rätt svar (1–5):\n1. Jag hoppas att jag ska kunna bygga en stuga nere vid sjön. Jag vill också göra en badplats där, så att gästerna kan bada i sjön efter bastun.\n2. Tänk positivt, det mesta löser sig! Tänk på att det är mycket hårt arbete i början, men fortsätt jobba och kämpa på.\n3. Jag läste ekonomi på gymnasiet och det har jag haft användning av nu. Jag har egentligen inte någon annan utbildning, men hittills har det gått bra ändå.\n4. Det är svårt att vara ledig när man vill och det kan vara lite stressigt ibland.\n5. Att jag kan bestämma det mesta själv. Det är ett stort ansvar men det ger också en härlig frihet.",
  "texts": [
    {
      "heading": "Intervju med Erik Berg",
      "body": "Erik driver ett eget vandrarhem och svarar på frågor om jobbet, framtidsplaner och råd till andra."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Vad är det bästa med ditt jobb på vandrarhemmet? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Finns det något negativt med ditt jobb? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Vad har du för planer för framtiden? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "B_Q4",
      "type": "mcq",
      "prompt": "D. Vilka tips har du till andra som vill starta ett vandrarhem? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: أفضل ما في العمل → 5 (حرية اتخاذ القرار والاستقلالية)، الجانب السلبي → 4 (صعوبة أخذ إجازة والتوتر أحيانًا)، خطط المستقبل → 1 (بناء كوخ ومكان للسباحة قرب البحيرة)، النصائح → 2 (التفكير الإيجابي والاستمرار رغم صعوبة البداية).",
    "explanation": "مقابلة مع Erik صاحب نزل (vandrarhem) حول إيجابيات العمل، سلبياته، خططه المستقبلية، ونصائحه للراغبين في بدء مشروع مشابه.",
    "translation": "إجابات Erik حول إدارة نزل خاص.",
    "vocabulary": [
      "vandrarhem (نزل / فندق بسيط)",
      "frihet (حرية)",
      "planer för framtiden (خطط للمستقبل)",
      "tips (نصائح)"
    ],
    "examples": [
      "Det är ett stort ansvar men det ger också en härlig frihet. (إنها مسؤولية كبيرة ولكنها تمنح أيضًا حرية رائعة.)"
    ],
    "tip": "طابق كل سؤال مع الفقرة التي تحمل معناه المباشر (frihet، stressigt/ledig، hoppas/framtiden، tänk positivt)."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A - Uppgift 3: Två diagram
$secC = @'
{
  "section": "C",
  "icon": "📊",
  "title": "Läsa A – Uppgift 3: Två diagram",
  "instructions": "Svara kort på frågorna utifrån de två diagrammen om var man träffar sin partner.",
  "texts": [
    {
      "heading": "Diagramfrågor: Var man träffar sin partner",
      "body": "• A: Var träffade de flesta personer sin partner?\n• B: I vilket yrke är det vanligast att träffa sin partner på jobbet?\n• C: Hur många procent i yrkesgruppen poliser träffar sin partner på jobbet?"
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "short",
      "prompt": "A. Var träffade de flesta personer sin partner?",
      "answer": "Genom vänner",
      "acceptedAnswers": ["Genom vänner", "genom vänner", "Genom vänner (29%)", "29%"]
    },
    {
      "id": "C_Q2",
      "type": "short",
      "prompt": "B. I vilket yrke är det vanligast att träffa sin partner på jobbet?",
      "answer": "Läkare",
      "acceptedAnswers": ["Läkare", "läkare", "Läkare (25%)", "25%"]
    },
    {
      "id": "C_Q3",
      "type": "short",
      "prompt": "C. Hur många procent i yrkesgruppen poliser träffar sin partner på jobbet?",
      "answer": "15%",
      "acceptedAnswers": ["15%", "15", "15 procent"]
    }
  ],
  "arabicNotes": {
    "summary": "الحل: معظم الأشخاص التقوا بشريك حياتهم عن طريق الأصدقاء (Genom vänner)، وأكثر مهنة يلتقي فيها الأشخاص بشريكهم في العمل هي الأطباء (Läkare)، ونسبة رجال الشرطة هي 15%.",
    "explanation": "الأسئلة تعتمد على قراءة سريعة ودقيقة للبيانات الإحصائية في الرسمين البيانيين.",
    "translation": "أسئلة قصيرة حول إحصاءات أماكن تعارف الشركاء والمهن.",
    "vocabulary": [
      "partner (شريك الحياة)",
      "yrke (مهنة)",
      "genom vänner (عن طريق الأصدقاء)",
      "procent (نسبة مئوية)"
    ],
    "examples": [
      "De flesta träffade sin partner genom vänner. (معظم الأشخاص التقوا بشريكهم عن طريق الأصدقاء.)"
    ],
    "tip": "اكتب إجابة قصيرة ومباشرة كما هو مطلوب في السؤال."
  }
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A - Uppgift 4: Annonser på en anslagstavla
$secD = @'
{
  "section": "D",
  "icon": "📌",
  "title": "Läsa A – Uppgift 4: Annonser på en anslagstavla",
  "instructions": "Läs annonserna (1–5) och välj rätt siffra för varje person:\n1. HUNDKURS (Hundskolan, Lillgatan 22)\n2. Sökes! Medarbetare till ungdomshem (Brackegården, Bräcke)\n3. Dags att renovera bostaden? Fixarna (tapeter, golv, måla/fixa hemma)\n4. Ny i Sverige? Bibliotekets Språkcafé (fika och pratar i liten grupp, måndagar kl. 19.00–20.30)\n5. Familjedag lördag 19/8 på Bräcke Tivoli (barn går in gratis tillsammans med en betalande vuxen)",
  "texts": [
    {
      "heading": "Personer (A–D)",
      "body": "• A. Rita vill bli bättre på att tala svenska.\n• B. Ahmed vill göra något kul med sina små döttrar.\n• C. Amir behöver hjälp med att måla om i köket.\n• D. Ulla vill gärna jobba med unga människor."
    }
  ],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Rita vill bli bättre på att tala svenska. Vilken annons passar bäst? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Ahmed vill göra något kul med sina små döttrar. Vilken annons passar bäst? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Amir behöver hjälp med att måla om i köket. Vilken annons passar bäst? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Ulla vill gärna jobba med unga människor. Vilken annons passar bäst? (1–5)",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "2"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Rita (تحدث السويدية) → 4 (Språkcafé)، Ahmed (نشاط مع بناته الصغيرات) → 5 (Familjedag på Tivoli)، Amir (تجديد/إصلاح المنزل) → 3 (Fixarna / renovera bostaden)، Ulla (العمل مع الشباب) → 2 (ungdomshem).",
    "explanation": "كل شخص له حاجة أو رغبة محددة تتطابق مع إعلان واحد على لوحة الإعلانات.",
    "translation": "مطابقة الأشخاص مع الإعلانات المناسبة على لوحة الإعلانات.",
    "vocabulary": [
      "anslagstavla (لوحة إعلانات)",
      "språkcafé (مقهى لغوي)",
      "renovera (يجدد / يرمم)",
      "ungdomshem (دار رعاية للشباب)"
    ],
    "examples": [
      "På språkcafét får man öva på att prata svenska. (في مقهى اللغة يمكنك التدرب على التحدث بالسويدية.)"
    ],
    "tip": "ابحث عن الكلمات الدالة مثل prata svenska أو barn أو renovera أو ungdomshem."
  }
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsa B - Stadshotellet (Yasmin, Albin, Marjam, Marie, Goitom)
$secE = @'
{
  "section": "E",
  "icon": "🏨",
  "title": "Läsa B – Stadshotellet",
  "instructions": "Läs vad personerna säger om Stadshotellet och svara på frågan.",
  "texts": [
    {
      "heading": "Marie",
      "body": "Läget är fint och nära centrum. Det var rent i rummet men det fanns ingen sänglampa. Man blev också störd av prat och musik från rummen bredvid."
    },
    {
      "heading": "Goitom",
      "body": "Jag stannade en natt och tycker att stället passar perfekt om man vill ha en billig och lugn plats att sova på. Wifi fungerade utan problem."
    },
    {
      "heading": "Yasmin",
      "body": "Jag vill ha det svalt när jag sover men det gick inte att dra ner värmen på elementet. Badrummet var inte helt fräscht heller."
    },
    {
      "heading": "Albin",
      "body": "Prisvärt, centralt och mysigt! Fina rum med bekväma sängar. Men frukosten blev jag besviken på, den var inte alls så god som jag hade hoppats på."
    },
    {
      "heading": "Marjam",
      "body": "Ett enkelt hotell i ett lugnt område. Rent och snyggt, trots att det är gammalt. Rummet hade allt som vi behövde så vi var nöjda."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vad tycker Marie om hotellet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Både bra och dåligt"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vad tycker Goitom om hotellet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Bra"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Yasmin om hotellet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Dåligt"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Albin om hotellet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Både bra och dåligt"
    },
    {
      "id": "E_Q5",
      "type": "mcq",
      "prompt": "E. Vad tycker Marjam om hotellet?",
      "options": ["Bra", "Dåligt", "Både bra och dåligt"],
      "answer": "Bra"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Marie → Både bra och dåligt، Goitom → Bra، Yasmin → Dåligt، Albin → Både bra och dåligt، Marjam → Bra.",
    "explanation": "تقييمات نزلاء الفندق تختلف بين من يذكر نقاطًا إيجابية وسلبية معًا، ومن يبدي رضاه التام، ومن يذكر ملاحظات سلبية فقط.",
    "translation": "آراء خمسة أشخاص حول إقامتهم في الفندق.",
    "vocabulary": [
      "läge (موقع)",
      "besviken (خائب الأمل)",
      "nöjd (راضٍ)",
      "både bra och dåligt (جيد وسيئ معًا)"
    ],
    "examples": [
      "Rummet var fint men frukosten var inte så god. (الغرفة كانت جميلة ولكن الفطور لم يكن جيدًا جدًا.)"
    ],
    "tip": "إذا وُجد 'men' يربط بين ميزة وعيب، فالاختيار غالبًا Både bra och dåligt."
  }
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Läsa B - Uppgift 4: Mejl på en arbetsplats
$secF = @'
{
  "section": "F",
  "icon": "📧",
  "title": "Läsa B – Uppgift 4: Mejl på en arbetsplats",
  "instructions": "Läs mejlen på en arbetsplats och välj det alternativ som passar bäst för de markerade orden.",
  "texts": [
    {
      "heading": "Mejl A–E",
      "body": "• A (Assar): ... Gärna direkt om det går bra ...\n• B (Theo): ... Vi har även lite problem med kaffebryggaren ...\n• C (Farah): ... och titta igenom den tillsammans.\n• D (Fredrika): ... så snart som möjligt ...\n• E (Sture): ... om vi kan byta dag ..."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Vad betyder 'direkt' i Assars mejl?",
      "options": ["senare", "tidigare", "nu"],
      "answer": "nu"
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vad betyder 'även' i Theos mejl?",
      "options": ["förstås", "också", "egentligen"],
      "answer": "också"
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vad betyder 'titta igenom' i Farahs mejl?",
      "options": ["fråga om", "svara på", "berätta om"],
      "answer": "berätta om"
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vad betyder 'så snart som möjligt' i Fredrikas mejl?",
      "options": ["så fort du kan", "så mycket du kan", "så ofta du kan"],
      "answer": "så fort du kan"
    },
    {
      "id": "F_Q5",
      "type": "mcq",
      "prompt": "E. Vad betyder 'byta' i Stures mejl?",
      "options": ["hitta", "ändra", "bestämma"],
      "answer": "ändra"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: direkt → nu، även → också، titta igenom (في سياق مراجعة/عرض التقرير) → berätta om، så snart som möjligt → så fort du kan، byta → ändra.",
    "explanation": "فهم معاني الكلمات والتعابير الشائعة في رسائل البريد الإلكتروني في بيئة العمل.",
    "translation": "معاني الكلمات والتعابير في رسائل العمل.",
    "vocabulary": [
      "direkt (مباشرة / الآن)",
      "även (أيضًا)",
      "så snart som möjligt (في أقرب وقت ممكن)",
      "byta (يغيّر / يبدّل)"
    ],
    "examples": [
      "Kan du svara mig så snart som möjligt? (هل يمكنك الرد عليّ في أقرب وقت ممكن؟)"
    ],
    "tip": "اقرأ الجملة كاملة لفهم المعنى المقصود في السياق."
  }
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Läsa B - Uppgift 5: Läsarnas sida
$secG = @'
{
  "section": "G",
  "icon": "📰",
  "title": "Läsa B – Uppgift 5: Läsarnas sida",
  "instructions": "Läs vad personerna har skrivit på läsarnas sida och svara på frågorna.",
  "texts": [
    {
      "heading": "Bertil",
      "body": "En stor kram till er, ni unga män som hjälpte min väninna Ulla när hon ramlade utanför Folkets hus i tisdags förra veckan. Ni ringde snabbt 112 och väntade där tills ambulansen kom. Utan er hade det kanske inte gått så bra."
    },
    {
      "heading": "Elli",
      "body": "Hej! Jag vill gärna hjälpa flyktingar som kommer till vår kommun och jag undrar vart man kan vända sig för att göra det. Snälla ni som jobbar med sånt här eller ni som vet något om det, skriv gärna till Läsarnas sida och berätta!"
    },
    {
      "heading": "Bella",
      "body": "Har någon sett min tygkasse - röd med en stor rosa blomma på? Jag tror att jag tappade den i Sportaffären eller på torget utanför. Har du hittat den, kontakta mig snarast! Tidningen har mitt telefonnummer."
    },
    {
      "heading": "Petra",
      "body": "Jag blir så trött! Jag bor bredvid arenan här i stan och det är någon konsert eller show varje helg. Jag måste ofta lyssna till hög musik och skrik, även när jag har mina fönster stängda. Kommunen borde tänka lite mer på var det passar att ha en arena, innan man bygger en!"
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "A. Vad vill Bertil?",
      "options": ["Träffa någon.", "Tacka för något.", "Klaga på något."],
      "answer": "Tacka för något."
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "B. Vad vill Elli?",
      "options": ["Tacka för något.", "Sälja något.", "Fråga om något."],
      "answer": "Fråga om något."
    },
    {
      "id": "G_Q3",
      "type": "mcq",
      "prompt": "C. Vad vill Bella?",
      "options": ["Be om hjälp.", "Sälja något.", "Köpa något."],
      "answer": "Be om hjälp."
    },
    {
      "id": "G_Q4",
      "type": "mcq",
      "prompt": "D. Vad vill Petra?",
      "options": ["Fråga om något.", "Klaga på något.", "Be om ursäkt."],
      "answer": "Klaga på något."
    }
  ],
  "arabicNotes": {
    "summary": "الحل: Bertil → Tacka för något، Elli → Fråga om något، Bella → Be om hjälp، Petra → Klaga på något.",
    "explanation": "كل رسالة في صفحة القراء تعبر عن غرض محدد: شكر على مساعدة، سؤال عن مكان للتطوع، طلب مساعدة للعثور على حقيبة مفقودة، أو شكوى من الضوضاء.",
    "translation": "رسائل متنوعة في صفحة القراء حول مواقف حياتية.",
    "vocabulary": [
      "tacka (يشكر)",
      "fråga (يسأل)",
      "be om hjälp (يطلب مساعدة)",
      "klaga (يشتكي)"
    ],
    "examples": [
      "Petra klagar på hög musik vid arenan. (Petra تشتكي من الموسيقى العالية قرب الساحة.)"
    ],
    "tip": "حدد الهدف الرئيسي لكل كاتب: شكر، سؤال، طلب مساعدة، أو شكوى."
  }
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Läsa B - Information från en möbelbutik & Relationer på distans
$secH = @'
{
  "section": "H",
  "icon": "🛋️",
  "title": "Läsa B – Möbelbutik & Tips om distansrelationer",
  "instructions": "Läs texterna och välj rätt rubrik (1–6) för varje del:\nRubriker: 1. Handla på nätet | 2. Kontakta oss | 3. Öppet köp | 4. Jobba hos oss | 5. Transport | 6. Hitta hit",
  "texts": [
    {
      "heading": "Möbelbutikens information",
      "body": "• Chattr/telefon/mejl för frågor -> 2. Kontakta oss\n• Beställa möbler via dator/telefon -> 1. Handla på nätet\n• Köra hem varor -> 5. Transport\n• Adress och vägbeskrivning -> 6. Hitta hit\n• Lämna tillbaka vara inom 60 dagar -> 3. Öppet köp"
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "A. Vi hjälper dig gärna. Du når oss alltid snabbast via chatt eller telefon... (1–6)",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "B. Om du inte kan besöka vår butik, kan du beställa möbler och inredning via din dator eller telefon... (1–6)",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "C. Svårt att bära ett stort skåp eller en säng? Vi kör gärna dina varor hem till dig... (1–6)",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "5"
    },
    {
      "id": "H_Q4",
      "type": "mcq",
      "prompt": "D. Vår butik ligger på Lagervägen 1... (1–6)",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "H_Q5",
      "type": "mcq",
      "prompt": "E. Har du ångrat dig? Du kan lämna tillbaka din vara inom 60 dagar... (1–6)",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "3"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: التواصل/الأسئلة → 2 (Kontakta oss)، الطلب عبر الإنترنت → 1 (Handla på nätet)، التوصيل للمنزل → 5 (Transport)، الموقع والعنوان → 6 (Hitta hit)، الإرجاع خلال 60 يومًا → 3 (Öppet köp).",
    "explanation": "كل فقرة معلوماتية من موقع متجر الأثاث تناسب عنوانًا محددًا يصف الخدمة المقدمة.",
    "translation": "عناوين معلومات متجر الأثاث والخدمات للزبائن.",
    "vocabulary": [
      "beställa (يطلب شراء)",
      "transport (نقل / توصيل)",
      "öppet köp (حق الإرجاع المفتوح)",
      "lämna tillbaka (يُرجِع)"
    ],
    "examples": [
      "Du kan lämna tillbaka din vara inom 60 dagar. (يمكنك إرجاع سلعتك خلال 60 يومًا.)"
    ],
    "tip": "ابحث عن الكلمة المفتاحية مثل beställa أو kör hem أو ligger på أو lämna tillbaka."
  }
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

Write-Host "=== Successfully populated 2016-9 Reading (with Arabic notes)! ===" -ForegroundColor Cyan
