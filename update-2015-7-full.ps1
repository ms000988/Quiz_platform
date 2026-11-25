# update-2015-7-full.ps1 - Populates complete Listening and Reading (with Arabic notes) for 2015-7

Write-Host "Populating full Listening and Reading data for 2015-7..." -ForegroundColor Cyan

$examDir = "data/sfi/2015-7"
$listeningDir = Join-Path $examDir "listening"
$readingDir = Join-Path $examDir "reading"

New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $readingDir -Force | Out-Null

# ==========================================
# 1. LISTENING (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2015-7",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Åsikter om bussresor",
      "audio": "spar01.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Hur ofta åker Moa buss?",
          "options": ["Flera dagar i veckan", "En dag i veckan", "Några gånger i månaden"],
          "answer": "Några gånger i månaden"
        },
        {
          "id": "L1_B",
          "prompt": "B. Vad tycker Moa är bäst med att åka buss?",
          "options": ["Biljettpriserna", "Bussen kommer i tid", "Mycket plats på bussen", "Rent på bussen", "Trevlig personal"],
          "answer": "Rent på bussen"
        },
        {
          "id": "L1_C",
          "prompt": "C. Hur ofta åker Benjamin buss?",
          "options": ["Flera dagar i veckan", "En dag i veckan", "Några gånger i månaden"],
          "answer": "Flera dagar i veckan"
        },
        {
          "id": "L1_D",
          "prompt": "D. Vad tycker Benjamin är bäst med att åka buss?",
          "options": ["Biljettpriserna", "Bussen kommer i tid", "Mycket plats på bussen", "Rent på bussen", "Trevlig personal"],
          "answer": "Mycket plats på bussen"
        },
        {
          "id": "L1_E",
          "prompt": "E. Hur ofta åker Maj-Lis buss?",
          "options": ["Flera dagar i veckan", "En dag i veckan", "Några gånger i månaden"],
          "answer": "Flera dagar i veckan"
        },
        {
          "id": "L1_F",
          "prompt": "F. Vad tycker Maj-Lis är bäst med att åka buss?",
          "options": ["Biljettpriserna", "Bussen kommer i tid", "Mycket plats på bussen", "Rent på bussen", "Trevlig personal"],
          "answer": "Biljettpriserna"
        },
        {
          "id": "L1_G",
          "prompt": "G. Hur ofta åker Uno buss?",
          "options": ["Flera dagar i veckan", "En dag i veckan", "Några gånger i månaden"],
          "answer": "En dag i veckan"
        },
        {
          "id": "L1_H",
          "prompt": "H. Vad tycker Uno är bäst med att åka buss?",
          "options": ["Biljettpriserna", "Bussen kommer i tid", "Mycket plats på bussen", "Rent på bussen", "Trevlig personal"],
          "answer": "Trevlig personal"
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Ett samtal (Lars och Maria pratar om en resa)",
      "audio": "spar02.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. Ska de åka bil?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Ja"
        },
        {
          "id": "L2_B",
          "prompt": "B. Ska deras vänner följa med?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Kanske"
        },
        {
          "id": "L2_C",
          "prompt": "C. Ska de träffa Marias kusin?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Nej"
        },
        {
          "id": "L2_D",
          "prompt": "D. Ska de bo på hotell?",
          "options": ["Ja", "Nej", "Kanske"],
          "answer": "Kanske"
        }
      ]
    },
    {
      "id": "3",
      "title": "Uppgift 3: Telefonsvarare (passkontor)",
      "audio": "spar03.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A",
          "prompt": "A. När har passkontoret öppet på kvällen?",
          "options": ["måndagar", "tisdagar", "onsdagar", "torsdagar", "fredagar", "lördagar", "söndagar"],
          "answer": "onsdagar"
        },
        {
          "id": "L3_B",
          "prompt": "B. Du vill ändra en tid. Vilken siffra ska du trycka på?",
          "options": ["1", "2", "3", "4"],
          "answer": "2"
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Fyra korta nyheter",
      "audio": "spar04.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A",
          "prompt": "A. Vad handlar nyheten om?",
          "options": ["Väder", "Arbete", "Trafik"],
          "answer": "Trafik"
        },
        {
          "id": "L4_B",
          "prompt": "B. Vad handlar nyheten om?",
          "options": ["Utbildning", "Arbete", "Fritid"],
          "answer": "Arbete"
        },
        {
          "id": "L4_C",
          "prompt": "C. Vad handlar nyheten om?",
          "options": ["Ekonomi", "Trafik", "Utbildning"],
          "answer": "Ekonomi"
        },
        {
          "id": "L4_D",
          "prompt": "D. Vad handlar nyheten om?",
          "options": ["Arbete", "Fritid", "Sjukvård"],
          "answer": "Arbete"
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Ett telefonsamtal till simhallen",
      "audio": "spar05.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. Hur många gånger i veckan är intensivkursen?",
          "answer": "3",
          "acceptedAnswers": ["3", "3 gånger", "tre", "tre gånger"]
        },
        {
          "id": "L5_B",
          "prompt": "B. Hur mycket kostar intensivkursen?",
          "answer": "1250",
          "acceptedAnswers": ["1250", "1 250", "1250 kronor", "1 250 kronor"]
        },
        {
          "id": "L5_C",
          "prompt": "C. Hur bokar man?",
          "options": ["På telefon", "På internet", "I simhallen"],
          "answer": "På internet"
        }
      ]
    },
    {
      "id": 6,
      "title": "Uppgift 6: Tre korta telefonsamtal",
      "audio": "spar06.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L6_A",
          "prompt": "A. Samtal 1 – Petter ringer till ett båtbolag. Vad vill Petter?",
          "options": ["Boka en resa.", "Ändra sin bokning.", "Fråga om tider."],
          "answer": "Ändra sin bokning."
        },
        {
          "id": "L6_B",
          "prompt": "B. Samtal 2 – Angelica ringer till en restaurang. Vad vill Angelica?",
          "options": ["Boka ett bord.", "Klaga på något.", "Fråga om något."],
          "answer": "Fråga om något."
        },
        {
          "id": "L6_C",
          "prompt": "C. Samtal 3 – Denise ringer till bussbolagets kundtjänst. Vad vill Denise?",
          "options": ["Betala för något.", "Fråga om något.", "Klaga på något."],
          "answer": "Fråga om något."
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

# ==========================================
# 2. READING CONFIG & SECTIONS (A - B)
# ==========================================

$configJson = @'
{
  "year": "2015-7",
  "module": "reading",
  "title": "SFI Läsförståelse – Nationellt slutprov 7, 2015, Kurs C",
  "passThreshold": 0.6,
  "sections": [
    "A.json",
    "B.json"
  ]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

$secA = @'
{
  "section": "A",
  "icon": "📘",
  "title": "Läsa B – Information och tid (60 minuter)",
  "instructions": "Försättsblad för Läsa B i Nationellt slutprov 7, 2015, Kurs C.",
  "texts": [
    {
      "heading": "Utbildning i svenska för invandrare – Läsa B",
      "body": "Nationellt slutprov 7, 2015, Kurs C. Provtid för Läsa B är 60 minuter."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "Hur lång tid är provtiden för Läsa B i Nationellt slutprov 7, 2015?",
      "options": ["35 minuter", "45 minuter", "60 minuter"],
      "answer": "60 minuter"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "Vilken kurs gäller detta häfte för?",
      "options": ["Kurs B", "Kurs C", "Kurs D"],
      "answer": "Kurs C"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مدة قسم القراءة Läsa B هي 60 دقيقة (60 minuter)، وهذا الاختبار مخصص للمستوى Kurs C.",
    "explanation": "معلومات أساسية من صفحة غلاف قسم القراءة ب حول المدة الزمنية والمستوى الدراسي.",
    "translation": "غلاف قسم القراءة ب – المستوى ج – المدة 60 دقيقة.",
    "vocabulary": [
      "slutprov (امتحان نهائي)",
      "invandrare (مهاجرون)",
      "provtid (مدة الامتحان)"
    ],
    "examples": [
      "Du har 60 minuter på dig för Läsa B. (لديك 60 دقيقة لقسم القراءة ب.)"
    ],
    "tip": "انتبه دائمًا لاسم القسم والمدة الزمنية في أعلى الغلاف."
  }
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

$secB = @'
{
  "section": "B",
  "icon": "🎧",
  "title": "Hörförståelse – Sammanfattning av uppgifter (2015-7)",
  "instructions": "Repetitionsfrågor kopplade till de inlämnade hörövningarna i Nationellt slutprov 7, 2015.",
  "texts": [
    {
      "heading": "Återblick på hörförståelsen (2015-7)",
      "body": "• Uppgift 1: Moa, Benjamin, Maj-Lis och Uno berättar om bussresor.\n• Uppgift 2: Lars och Maria pratar om sin resa.\n• Uppgift 3: Telefonsvarare på ett passkontor (öppet på kvällen onsdagar, ändra tid = knapp 2).\n• Uppgift 4: Korta nyheter (trafik, arbete, ekonomi, arbete).\n• Uppgift 5: Telefonsamtal till simhallen om intensivkurs (3 gånger/vecka, 1250 kr, bokning på internet).\n• Uppgift 6: Tre telefonsamtal (ändra bokning, fråga om något, fråga om något)."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "Vilken kväll har passkontoret öppet i Uppgift 3?",
      "options": ["Tisdagar", "Onsdagar", "Torsdagar"],
      "answer": "Onsdagar"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "Hur bokar man intensivkursen i simhallen enligt Uppgift 5?",
      "options": ["På telefon", "På internet", "På plats"],
      "answer": "På internet"
    }
  ],
  "arabicNotes": {
    "summary": "الحل: مكتب الجوازات مفتوح مساءً أيام الأربعاء (Onsdagar)، والحجز لدورة السباحة المكثفة يتم عبر الإنترنت (På internet).",
    "explanation": "مراجعة سريعة لأبرز المعلومات الواردة في صفحات الاستماع المقدمة لامتحان 2015-7.",
    "translation": "مراجعة لأهم نقاط الاستماع في امتحان 2015-7.",
    "vocabulary": [
      "passkontor (مكتب جوازات السفر)",
      "intensivkurs (دورة مكثفة)",
      "boka (يحجز)"
    ],
    "examples": [
      "Man bokar kursen på internet. (يتم حجز الدورة عبر الإنترنت.)"
    ],
    "tip": "راجع الأرقام والأيام والكلمات المرتبطة بكل مكالمة أو رسالة صوتية."
  }
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

Write-Host "=== Successfully populated full 2015-7 Listening and Reading (with Arabic notes)! ===" -ForegroundColor Cyan
