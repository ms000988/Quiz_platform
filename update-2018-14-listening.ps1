# update-2018-14-listening.ps1 - Populates Listening data (Parts 1-6) for 2018-14

Write-Host "Populating Listening data for 2018-14..." -ForegroundColor Cyan

$listeningDir = "data/sfi/2018-14/listening"
if (!(Test-Path $listeningDir)) {
    New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
}

$listeningJson = @'
{
  "examId": "2018-14",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Några personer berättar (TV-vanor)",
      "audio": "audio1.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Hur ofta tittar Dorota på TV?",
          "options": ["en gång i veckan", "några gånger i veckan", "varje dag"],
          "answer": "varje dag"
        },
        {
          "id": "L1_B",
          "prompt": "B. Vilka program tycker Dorota om? Program om ...",
          "options": ["resor och resmål.", "poliser och brott.", "samhälle och politik."],
          "answer": "resor och resmål."
        },
        {
          "id": "L1_C",
          "prompt": "C. Hur ofta tittar Anne på TV?",
          "options": ["en gång i veckan", "några gånger i veckan", "varje dag"],
          "answer": "några gånger i veckan"
        },
        {
          "id": "L1_D",
          "prompt": "D. Vilka program tycker Anne om? Program om ...",
          "options": ["böcker och film.", "resor och resmål.", "kläder och mode."],
          "answer": "resor och resmål."
        },
        {
          "id": "L1_E",
          "prompt": "E. Hur ofta tittar Emil på TV?",
          "options": ["en gång i veckan", "några gånger i veckan", "varje dag"],
          "answer": "några gånger i veckan"
        },
        {
          "id": "L1_F",
          "prompt": "F. Vilka program tycker Emil om? Program om ...",
          "options": ["sport och hälsa.", "mat och dryck.", "böcker och film."],
          "answer": "mat och dryck."
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Samtal (Resa till Manuel)",
      "audio": "audio2.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. Hur ska de åka till Manuel?",
          "options": ["med buss", "med bil", "med tåg"],
          "answer": "med bil"
        },
        {
          "id": "L2_B",
          "prompt": "B. Vilken tid ska de åka?",
          "options": ["på morgonen", "vid lunch", "på eftermiddagen"],
          "answer": "på eftermiddagen"
        },
        {
          "id": "L2_C",
          "prompt": "C. Ska de ta med sig något att äta?",
          "options": ["ja", "nej", "kanske"],
          "answer": "ja"
        },
        {
          "id": "L2_D",
          "prompt": "D. Ska de boka hotell?",
          "options": ["ja", "nej", "kanske"],
          "answer": "kanske"
        }
      ]
    },
    {
      "id": 3,
      "title": "Uppgift 3: Telefonsvar",
      "audio": "audio3.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A",
          "prompt": "A. Hos Elbolaget – Ibrahim vill få information om sin elräkning. Vilken siffra ska han trycka på?",
          "options": ["1", "2", "3"],
          "answer": "2"
        },
        {
          "id": "L3_B",
          "prompt": "B. Hos Telefonbolaget – Någon har tagit Amikos telefon och hon vill spärra den. Vilken siffra ska hon trycka på?",
          "options": ["1", "2", "3", "4"],
          "answer": "4"
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Nyheter",
      "audio": "audio4.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A",
          "prompt": "A. Vad handlar nyheten om?",
          "options": ["arbete", "familj", "ekonomi"],
          "answer": "ekonomi"
        },
        {
          "id": "L4_B",
          "prompt": "B. Vad handlar nyheten om?",
          "options": ["miljö", "familj", "hälsa"],
          "answer": "miljö"
        },
        {
          "id": "L4_C",
          "prompt": "C. Vad handlar nyheten om?",
          "options": ["familj", "brott", "vård"],
          "answer": "vård"
        },
        {
          "id": "L4_D",
          "prompt": "D. Vad handlar nyheten om?",
          "options": ["miljö", "väder", "familj"],
          "answer": "familj"
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Telefonsamtal",
      "audio": "audio5.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. En man ringer till en elektronikaffär. Vad vill mannen? Han vill ...",
          "options": [
            "lämna tillbaka en dammsugare.",
            "få hjälp med sin dammsugare.",
            "beställa en ny dammsugare."
          ],
          "answer": "få hjälp med sin dammsugare."
        },
        {
          "id": "L5_B",
          "prompt": "B. En kvinna ringer till ett bageri. Vad vill kvinnan? Hon vill veta ...",
          "options": [
            "vad tårtan innehåller.",
            "hur stor tårtan är.",
            "när tårtan är klar."
          ],
          "answer": "vad tårtan innehåller."
        }
      ]
    },
    {
      "id": 6,
      "title": "Uppgift 6: Karin berättar om sin farfar",
      "audio": "audio6.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L6_A",
          "prompt": "A. Vad brukade Karin göra hos sin farfar?",
          "options": [
            "prata om framtiden",
            "läsa böcker med farfar",
            "skriva om farfars liv"
          ],
          "answer": "prata om framtiden"
        },
        {
          "id": "L6_B",
          "prompt": "B. Vad berättar Karin om sin farfars familj?",
          "options": [
            "Barnen fick många saker.",
            "De hade lite pengar.",
            "Familjen åt alltid god mat."
          ],
          "answer": "De hade lite pengar."
        },
        {
          "id": "L6_C",
          "prompt": "C. Vad berättar Karin om sin farfar och skolan?",
          "options": [
            "Han gillade att gå i skolan.",
            "Han trivdes inte i skolan.",
            "Han bodde nära skolan."
          ],
          "answer": "Han gillade att gå i skolan."
        },
        {
          "id": "L6_D",
          "prompt": "D. Var arbetade Karins farfar?",
          "options": [
            "hos en bonde",
            "i en affär",
            "på en fabrik"
          ],
          "answer": "på en fabrik"
        }
      ]
    }
  ]
}
'@

Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8
Write-Host "=== Successfully populated 2018-14 Listening module (Parts 1-6)! ===" -ForegroundColor Cyan
