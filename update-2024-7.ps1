# update-2024-7.ps1 - Populates Reading (A-H), Listening, and Writing for 2024-7 (plus 2025-8 Writing prompt)

Write-Host "Populating Reading, Listening, and Writing for 2024-7..." -ForegroundColor Cyan

$examDir = "data/sfi/2024-7"
$readingDir = Join-Path $examDir "reading"
$listeningDir = Join-Path $examDir "listening"
$writingDir = Join-Path $examDir "writing"

New-Item -ItemType Directory -Path $readingDir -Force | Out-Null
New-Item -ItemType Directory -Path $listeningDir -Force | Out-Null
New-Item -ItemType Directory -Path $writingDir -Force | Out-Null

# ==========================================
# 1. READING CONFIG & SECTIONS (A - H)
# ==========================================

$configJson = @'
{
  "year": "2024-7",
  "module": "reading",
  "title": "SFI Läsförståelse – Exam 2024-7",
  "passThreshold": 0.6,
  "sections": ["A.json", "B.json", "C.json", "D.json", "E.json", "F.json", "G.json", "H.json"]
}
'@
Set-Content -Path "$readingDir/config.json" -Value $configJson -Encoding utf8

# Section A: Läsa A Uppgift 1 – Intervju med Oskar
$secA = @'
{
  "section": "A",
  "icon": "🚆",
  "title": "En intervju med Oskar",
  "instructions": "Här får du läsa en intervju med Oskar som har varit på en tågresa. Välj det svar (1–5) som passar bäst till varje fråga.",
  "texts": [
    {
      "heading": "Svarsalternativ",
      "body": "1. Egentligen ville min kusin följa med, men han fick inte ledigt från jobbet. Men jag åkte ändå och ibland ringde jag videosamtal till honom så att han fick se olika platser från min telefon.\n\n2. Jag har alltid bott i Skåne och ville se mer av Sverige. Så i somras åkte jag på en lång resa genom norra Sverige på min semester. Istället för att flyga tog jag tåget, för jag tänker på miljön.\n\n3. Man kan spara mycket pengar om man bokar biljetter flera månader innan man ska åka. Då kostar biljetterna mindre. Annars kan tågresor vara ganska dyra.\n\n4. Min kollega har precis kommit hem från en tågresa i Tyskland. Jag är också sugen på att testa det. Så jag gör kanske en liknande resa dit i höst, om jag får ledigt då.\n\n5. Det är nog alla människor som jag träffade på vägen, både på tåget och på de olika platser som jag besökte. Det är alltid kul att lära känna nya personer."
    }
  ],
  "questions": [
    {
      "id": "A_Q1",
      "type": "mcq",
      "prompt": "A. Vad var det bästa med resan?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "5"
    },
    {
      "id": "A_Q2",
      "type": "mcq",
      "prompt": "B. Varför reste du ensam?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "1"
    },
    {
      "id": "A_Q3",
      "type": "mcq",
      "prompt": "C. Vilket tips ger du till någon som vill resa med tåg?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "id": "A_Q4",
      "type": "mcq",
      "prompt": "D. Vart vill du resa nästa gång?",
      "options": ["1", "2", "3", "4", "5"],
      "answer": "4"
    }
  ]
}
'@
Set-Content -Path "$readingDir/A.json" -Value $secA -Encoding utf8

# Section B: Läsa A Uppgift 2 – Med intresse för böcker
$secB = @'
{
  "section": "B",
  "icon": "📚",
  "title": "Med intresse för böcker",
  "instructions": "Läs tidningsartikeln om Sabina Lundmark och hennes bokcirkel och svara på frågorna.",
  "texts": [
    {
      "heading": "Med intresse för böcker",
      "body": "Sabina Lundmark är med i en bokcirkel tillsammans med två andra kvinnor. De ses en gång i månaden. En bokcirkel är en grupp människor som träffas ibland och pratar om böcker som de har läst.\n\nDet var Sabina som startade bokcirkeln för ett år sedan. Då flyttade hon till Västerköping och började arbeta som lärare i svenska och engelska där. Hon fick många kollegor men saknade någon att umgås med privat. Därför sökte hon på internet efter personer som ville prata om böcker tillsammans. Två kvinnor svarade och ville vara med.\n\nBokcirkeln träffas en torsdagskväll varje månad, alltid i någon av medlemmarnas kök eller vardagsrum. En viktig del av deras möten är fika. De har alltid en kopp te och något att äta när de diskuterar boken som de har läst. Först pratar de om personerna i boken och vad den handlar om. Sedan diskuterar de vad som är bra eller dåligt med boken.\n- Det bästa med vår bokcirkel är att få höra olika tankar. Och det finns ju ingen rätt eller fel åsikt, säger Sabina.\n\nÄven om de har olika intressen har de inga problem att välja vad de ska läsa. De har en sak gemensamt: de älskar att läsa om olika kulturer och hur folk har det i olika delar av världen.\n- Vi utvecklas och lär oss massor genom böckerna och diskussionerna. Och det mår vi bra av, säger Sabina.\n\nSabina tycker att fler borde läsa och prata om böcker tillsammans. Men om man ska starta en bokcirkel, finns det några saker att tänka på.\n- Det spelar ingen roll var man träffas. Men det är viktigt att man är överens om en ordning för mötena. Så bestäm vem i gruppen som ska hålla i mötet. Han eller hon ställer frågor till gruppen om texten och har koll på tiden. Annars kanske träffarna blir för långa och slutar sent på natten, skrattar Sabina.\n\nNästa månad är det ett år sedan de startade bokcirkeln. Det ska de fira med att gå på bio och titta på en komedi som har vunnit flera priser. Den är gjord efter den senaste boken som de har läst.\n- Vi hoppas att den är lika rolig som boken, avslutar Sabina."
    }
  ],
  "questions": [
    {
      "id": "B_Q1",
      "type": "mcq",
      "prompt": "A. Varför startade Sabina bokcirkeln? För att ...",
      "options": ["träna på språk", "få ett nytt jobb", "träffa nya vänner"],
      "answer": "träffa nya vänner"
    },
    {
      "id": "B_Q2",
      "type": "mcq",
      "prompt": "B. Var brukar de träffas?",
      "options": ["hemma hos varandra", "på ett bibliotek", "på ett café"],
      "answer": "hemma hos varandra"
    },
    {
      "id": "B_Q3",
      "type": "mcq",
      "prompt": "C. Vad gillar de att läsa i bokcirkeln? Böcker om ...",
      "options": ["en god hälsa", "livet i andra länder", "kärlek och relationer"],
      "answer": "livet i andra länder"
    },
    {
      "id": "B_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Sabina är viktigt när man har en bokcirkel?",
      "options": ["att alla får prata lika mycket", "att en person leder samtalet", "att alla har läst boken innan"],
      "answer": "att en person leder samtalet"
    },
    {
      "id": "B_Q5",
      "type": "mcq",
      "prompt": "E. Vad ska de göra när de träffas nästa gång?",
      "options": ["ha en tävling", "ordna en fest", "se en film"],
      "answer": "se en film"
    }
  ]
}
'@
Set-Content -Path "$readingDir/B.json" -Value $secB -Encoding utf8

# Section C: Läsa A Uppgift 3 – Annonser: Kurser i matlagning
$secC = @'
{
  "section": "C",
  "icon": "🍳",
  "title": "Annonser: Kurser i matlagning",
  "instructions": "Svara på frågorna med hjälp av informationen i annonserna.",
  "texts": [
    {
      "heading": "Kurs: Sött och gott",
      "body": "Tycker du om kakor och sötsaker? Eller vill du göra en egen tårta? Då är den här kursen perfekt för dig.\nTid och plats: fyra onsdagar i oktober kl. 18–21 i Folkets hus. Start 1/10.\nAvgift: 950 kr.\nAnmälan senast 15 september.\nMeddela oss om du har någon allergi!"
    },
    {
      "heading": "Kurs: Goda och enkla rätter",
      "body": "Kursen är för alla som är mellan 9 och 13 år, som vill kunna fixa god mat själva efter skolan. Kocken Miriam Hamdi lär oss att laga enkla och nyttiga maträtter.\nTid och plats: fem måndagar kl. 18–20 i Vibyskolans kök. Start måndag 30 september.\nKostnad: 500 kr.\nAnmälan senast 20 september."
    },
    {
      "heading": "Kurs: Mat över öppen eld",
      "body": "Prova på matlagning över öppen eld i naturen. Björn Frisk, kock med stort intresse för friluftsliv, visar hur man gör.\nTid och plats: måndag 23 september kl. 18–20 ute på gården vid Sjöstugan, Broby.\nPris: 250 kr.\nAlla är välkomna, ingen anmälan behövs."
    },
    {
      "heading": "Kurs: Laga mat tillsammans",
      "body": "Ta med hela familjen och laga mat ihop. Vi lagar flera olika maträtter som passar både stora och små.\nTid och plats: tre lördagar i november kl. 13–17 i Viby värdshus. Start 1 november.\nPris per familj: 1000 kr.\nAnmäl dig senast 20 oktober."
    },
    {
      "heading": "Kurs: Kocken tipsar",
      "body": "Ranja Karlsson ger tips om hur vi kan minska våra matkostnader – genom att ta hand om våra matrester och skapa nya rätter av det. Bra både för miljön och din ekonomi!\nTid och plats: torsdag 10 oktober kl. 17–19 på Restaurang Björk.\nIngen avgift.\nAnmälan senast 2 oktober."
    }
  ],
  "questions": [
    {
      "id": "C_Q1",
      "type": "short",
      "prompt": "A. Vad heter läraren på kursen där man lagar mat utomhus?",
      "answer": "Björn Frisk",
      "acceptedAnswers": ["Björn Frisk", "björn frisk", "Björn"]
    },
    {
      "id": "C_Q2",
      "type": "short",
      "prompt": "B. När är sista datumet för att anmäla sig till kursen i bakning?",
      "answer": "15 september",
      "acceptedAnswers": ["15 september", "15/9", "den 15 september"]
    },
    {
      "id": "C_Q3",
      "type": "short",
      "prompt": "C. Vad heter kursen som är gratis?",
      "answer": "Kocken tipsar",
      "acceptedAnswers": ["Kocken tipsar", "kocken tipsar"]
    },
    {
      "id": "C_Q4",
      "type": "short",
      "prompt": "D. Hur många gånger träffas man på kursen som är på helgen?",
      "answer": "3 gånger",
      "acceptedAnswers": ["3", "tre", "3 gånger", "tre gånger", "tre lördagar", "3 lördagar"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/C.json" -Value $secC -Encoding utf8

# Section D: Läsa A Uppgift 4 – En dagbok (Bussförare)
$secD = @'
{
  "section": "D",
  "icon": "🚌",
  "title": "En dagbok",
  "instructions": "Läs texterna ur en bussförares dagbok och välj det ord som passar bäst.",
  "texts": [
    {
      "heading": "måndag 25 april",
      "body": "Jag började tidigt, redan 06:30. Jag körde korta resor inne i stan. Mitt pass slutade 15:00. Inga förseningar och inget speciellt hände. Det var en lugn [arbetsdag]."
    },
    {
      "heading": "tisdag 26 april",
      "body": "Idag var en tjej otrevlig mot mig. Hon hade tagit fel buss och skrek på mig för att hon skulle komma sent till vårdcentralen. Men det var ju inte mitt [fel]."
    },
    {
      "heading": "onsdag 27 april",
      "body": "Kundservice kontaktade mig och sa att en pojke hade glömt sin mobil på bussen. Han hade tur, för jag [hittade] den när jag parkerade i garaget på kvällen."
    },
    {
      "heading": "torsdag 28 april",
      "body": "I morse var det en äldre man som gick på bussen. Han hade tappat sitt busskort. Men då var det en kvinna som [ville] köpa en biljett till honom. Han var så glad och tacksam för det."
    }
  ],
  "charts": [],
  "questions": [
    {
      "id": "D_Q1",
      "type": "mcq",
      "prompt": "A. Vilket ord passar bäst i måndagens text?",
      "options": ["kollega", "arbetsdag", "hållplats"],
      "answer": "arbetsdag"
    },
    {
      "id": "D_Q2",
      "type": "mcq",
      "prompt": "B. Vilket ord passar bäst i tisdagens text?",
      "options": ["jobb", "svar", "fel"],
      "answer": "fel"
    },
    {
      "id": "D_Q3",
      "type": "mcq",
      "prompt": "C. Vilket ord passar bäst i onsdagens text?",
      "options": ["hittade", "missade", "kastade"],
      "answer": "hittade"
    },
    {
      "id": "D_Q4",
      "type": "mcq",
      "prompt": "D. Vilket ord passar bäst i torsdagens text?",
      "options": ["slutade", "ville", "glömde"],
      "answer": "ville"
    }
  ]
}
'@
Set-Content -Path "$readingDir/D.json" -Value $secD -Encoding utf8

# Section E: Läsa A Uppgift 5 – Tabell och diagram (Simhallar)
$secE = @'
{
  "section": "E",
  "icon": "🏊",
  "title": "Tabell och diagram: Simhallar",
  "instructions": "Studera tabellen och diagrammet om simhallarna och svara på frågorna.",
  "texts": [
    {
      "heading": "Jämförelse av simhallar",
      "body": "• Blomdala simhall: Öppettider Vardagar 7.30–19.30, Helger 8.00–15.00. Pris 1 gång: Vuxen 110 kr, Pensionär 60 kr, Barn 30 kr. Årskort: Vuxen 2200 kr, Pensionär 1600 kr, Barn 900 kr. Temperatur: +30 °C. Aktiviteter: Babysim och simskola för små barn på tisdagar.\n\n• Lindby simhall: Öppettider Vardagar 6.30–20.00, Helger 10.00–16.00. Pris 1 gång: Vuxen 70 kr, Pensionär 50 kr, Barn 20 kr. Årskort: Vuxen 2000 kr, Pensionär 1000 kr, Barn 700 kr. Temperatur: +28 °C. Aktiviteter: Simskola på lördagar för dig med funktionshinder.\n\n• Granvik simhall: Öppettider Vardagar 7.00–21.30, Helger 9.00–16.00. Pris 1 gång: Vuxen 75 kr, Pensionär 55 kr, Barn 25 kr. Årskort: Vuxen 1800 kr, Pensionär 1100 kr, Barn 600 kr. Temperatur: 27 °C. Aktiviteter: Vattengympa och simskola för seniorer (65+) på onsdagar.\n\nBesökare på simhallarna i mars månad (totalt 13 500 besökare): Granvik simhall 53 %, Blomdala simhall 27 %, Lindby simhall 20 %."
    }
  ],
  "questions": [
    {
      "id": "E_Q1",
      "type": "mcq",
      "prompt": "A. Vilken simhall har varmast vatten i bassängen?",
      "options": ["Blomdala", "Lindby", "Granvik"],
      "answer": "Blomdala"
    },
    {
      "id": "E_Q2",
      "type": "mcq",
      "prompt": "B. Vilken simhall öppnar tidigast på måndagar?",
      "options": ["Blomdala", "Lindby", "Granvik"],
      "answer": "Lindby"
    },
    {
      "id": "E_Q3",
      "type": "mcq",
      "prompt": "C. Vilken simhall har simkurser som är bara för äldre personer?",
      "options": ["Blomdala", "Lindby", "Granvik"],
      "answer": "Granvik"
    },
    {
      "id": "E_Q4",
      "type": "mcq",
      "prompt": "D. Vilken simhall hade flest besökare i mars?",
      "options": ["Blomdala", "Lindby", "Granvik"],
      "answer": "Granvik"
    }
  ]
}
'@
Set-Content -Path "$readingDir/E.json" -Value $secE -Encoding utf8

# Section F: Läsa B Uppgift 1 – Att studera på distans
$secF = @'
{
  "section": "F",
  "icon": "💻",
  "title": "Att studera på distans",
  "instructions": "Några personer berättar vad de tycker om att studera på distans. Läs vad personerna säger och svara på frågorna.",
  "texts": [
    {
      "heading": "Nadal",
      "body": "Jag har ett stressigt liv privat så det är bekvämt för mig att läsa kurser på distans. Då kan jag göra mina uppgifter när jag har lite tid över."
    },
    {
      "heading": "Kajsa",
      "body": "Förra året testade jag att plugga på distans en termin. Jag trodde att det skulle fungera för mig men jag var faktiskt missnöjd. Jag behöver få träffa klasskompisar och diskutera med dem för att lära mig."
    },
    {
      "heading": "Pablo",
      "body": "Man sparar mycket tid om man studerar på distans och inte behöver åka till skolan så ofta. Men å andra sidan kan det vara problem att hitta en tid som funkar för alla när man ska ses och göra grupparbeten på kursen."
    },
    {
      "heading": "Vanessa",
      "body": "När jag var yngre fanns det inga kurser på distans. Och det var ju synd, för nu har jag provat att läsa spanska på distans och jag är riktigt nöjd med kursen."
    },
    {
      "heading": "Gina",
      "body": "Det jag gillar är att läraren lägger ut videolektioner på nätet. Då kan man titta flera gånger. Samtidigt är det ganska svårt att hitta motivation när man sitter hemma i soffan och studerar utan klasskamrater."
    }
  ],
  "questions": [
    {
      "id": "F_Q1",
      "type": "mcq",
      "prompt": "A. Vad tycker Nadal om att studera på distans? Det är ...",
      "options": ["bra.", "dåligt.", "både bra och dåligt."],
      "answer": "bra."
    },
    {
      "id": "F_Q2",
      "type": "mcq",
      "prompt": "B. Vad tycker Kajsa om att studera på distans? Det är ...",
      "options": ["bra.", "dåligt.", "både bra och dåligt."],
      "answer": "dåligt."
    },
    {
      "id": "F_Q3",
      "type": "mcq",
      "prompt": "C. Vad tycker Pablo om att studera på distans? Det är ...",
      "options": ["bra.", "dåligt.", "både bra och dåligt."],
      "answer": "både bra och dåligt."
    },
    {
      "id": "F_Q4",
      "type": "mcq",
      "prompt": "D. Vad tycker Vanessa om att studera på distans? Det är ...",
      "options": ["bra.", "dåligt.", "både bra och dåligt."],
      "answer": "bra."
    },
    {
      "id": "F_Q5",
      "type": "mcq",
      "prompt": "E. Vad tycker Gina om att studera på distans? Det är ...",
      "options": ["bra.", "dåligt.", "både bra och dåligt."],
      "answer": "både bra och dåligt."
    }
  ]
}
'@
Set-Content -Path "$readingDir/F.json" -Value $secF -Encoding utf8

# Section G: Läsa B Uppgift 2 – Ett mejl (Västerköping)
$secG = @'
{
  "section": "G",
  "icon": "✉️",
  "title": "Ett mejl: Västerköping",
  "instructions": "Läs Julians mejl till Farida och svara på frågorna.",
  "texts": [
    {
      "heading": "Till: Farida | Ämne: Västerköping",
      "body": "Hej Farida!\n\nJag tänkte berätta lite om resan med klassen till Västerköping. Vad synd att du inte kunde följa med! Resan var rolig även om vi hade lite problem när vi skulle ta tåget dit. Det var slutsålt så vi fick inte plats. Vi fick ta bussen i stället, så resan tog ganska lång tid. Vi borde ha planerat resan lite tidigare.\n\nVästerköping var jättemysigt. Man har nära till allt man vill göra och se, men staden är ändå inte för liten. Man kan cykla eller gå till affärer, till bad och vatten, och alla aktiviteter. Jag skulle gärna flytta dit, men då måste jag hitta en bostad först.\n\nEfter en lång promenad i stan blev vi hungriga och gick till en restaurang. När jag skulle betala funkade inte mitt bankkort. Så typiskt! Men som tur var hade jag kontanter. Och vet du vad, där i kassan jobbade en gammal kompis till mig. Kul!\n\nPå eftermiddagen skulle vi äta glass i en park. Men solen försvann och det var kallt, så vi gick till ett museum istället. Det var intressant men vi kunde vara där bara en kort stund. Sedan var vi tvungna att springa till stationen. Så trist att vi inte hann titta på allt!\n\nImorgon är det inga lektioner och jag är ledig från jobbet också, så jag skulle vilja hälsa på dig. Funkar det?\n\n/ Julian"
    }
  ],
  "questions": [
    {
      "id": "G_Q1",
      "type": "mcq",
      "prompt": "A. Varför åkte de buss?",
      "options": ["Tåget var fullbokat.", "Tåget var försenat.", "Tågbiljetten var för dyr."],
      "answer": "Tåget var fullbokat."
    },
    {
      "id": "G_Q2",
      "type": "mcq",
      "prompt": "B. Vad tyckte Julian bäst om med Västerköping?",
      "options": ["Det är vackra hus där.", "Det är fin natur där.", "Det är lagom stort där."],
      "answer": "Det är lagom stort där."
    },
    {
      "id": "G_Q3",
      "type": "mcq",
      "prompt": "C. Vad hände på restaurangen?",
      "options": ["Julian glömde sin plånbok.", "Julian träffade en vän.", "Julian fick gratis mat."],
      "answer": "Julian träffade en vän."
    },
    {
      "id": "G_Q4",
      "type": "mcq",
      "prompt": "D. Vad var tråkigt på eftermiddagen, tycker Julian?",
      "options": ["Det började regna.", "De hade för lite tid.", "De missade tåget."],
      "answer": "De hade för lite tid."
    },
    {
      "id": "G_Q5",
      "type": "mcq",
      "prompt": "E. Ska Julian och Farida träffas imorgon?",
      "options": ["nej", "ja", "kanske"],
      "answer": "kanske"
    }
  ]
}
'@
Set-Content -Path "$readingDir/G.json" -Value $secG -Encoding utf8

# Section H: Läsa B Uppgift 3 & 4 – Information till personalen & Relation med grannar
$secH = @'
{
  "section": "H",
  "icon": "🏘️",
  "title": "Information & Relation med grannar",
  "instructions": "Del 1 (A–D): Välj rätt rubrik (1–6) för informationen till personalen.\nRubriker: 1. Veckans möte | 2. Semester | 3. Nya datorer | 4. Ny personal | 5. Samtal om lön | 6. Utbildning\n\nDel 2 (E–H): Skriv namnet på rätt person utifrån diskussionen om grannar.",
  "texts": [
    {
      "heading": "Information till alla anställda",
      "body": "• Text A: Vår kassörska Maya kommer att vara föräldraledig i ett år. Därför har vi anställt en vikarie, Peter Danielsson, som börjar hos oss idag. Vi hälsar honom välkommen!\n\n• Text B: På fredag kl 15.00 träffas vi som vanligt i konferensrummet. Då ska vi prata om butikens ekonomi och försäljning i april. Vi får även besök av en fotograf som ska ta bilder till vår webbsida.\n\n• Text C: Vill du bli bättre på att hantera stress på jobbet? I augusti har vi en kurs där man kan få hjälp med det. Man får också tips på hur man bemöter kunder på ett bra sätt. Det är två videolektioner på internet. Anmälan senast 1 juni.\n\n• Text D: Det är dags att planera schemat för de kommande månaderna. Butiken kommer ju ha öppet som vanligt måndag–söndag hela sommaren, så alla kan inte vara borta samtidigt. Ansök innan 30/4 hos din närmaste chef."
    },
    {
      "heading": "Hur är din relation med grannarna?",
      "body": "• Maria: Alla måste få bestämma själva hur mycket kontakt man vill ha med sina grannar. Men man ska åtminstone bjuda på ett hej och ett leende när man möts, så gör vi i vårt hus. Det är viktigt för att alla ska trivas.\n\n• Fabian: Jag trivs bra med mina grannar där jag bor nu. Vi lämnar varandra ifred. Ingen kommer och ringer på dörren för att prata och fråga om en massa saker. Det passar mig perfekt, för jag vill ta hand om mig och mitt liv själv.\n\n• Hadi: Varje gång när jag ska använda tvättstugan, ligger det tvätt kvar i maskinen. Dessutom är det någon som lämnar sopor kvar i trappan. Jag funderar på att flytta härifrån för jag orkar snart inte längre.\n\n• Linda: Jag har faktiskt väldigt lite kontakt med grannarna för mitt hus ligger ute på landet. Det är ganska stora avstånd mellan husen här. Jag ser inte ens grannarnas hus från min tomt. Jag får nog bjuda in på en grillfest snart så jag kan lära känna dem bättre.\n\n• Musa: Jag vill ha en bra relation med mina grannar. Man måste inte umgås, men jag vill gärna kunna be en granne om att vattna blommor eller ta in posten när jag reser bort. På samma sätt kan de komma till mig när de behöver något."
    }
  ],
  "questions": [
    {
      "id": "H_Q1",
      "type": "mcq",
      "prompt": "A. Vilken rubrik passar till Text A (Peter Danielsson)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "4"
    },
    {
      "id": "H_Q2",
      "type": "mcq",
      "prompt": "B. Vilken rubrik passar till Text B (fredag kl 15.00)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "1"
    },
    {
      "id": "H_Q3",
      "type": "mcq",
      "prompt": "C. Vilken rubrik passar till Text C (hantera stress)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "id": "H_Q4",
      "type": "mcq",
      "prompt": "D. Vilken rubrik passar till Text D (schemat i sommar)?",
      "options": ["1", "2", "3", "4", "5", "6"],
      "answer": "2"
    },
    {
      "id": "H_Q5",
      "type": "short",
      "prompt": "E. Vem tycker att grannar ska hjälpa varandra?",
      "answer": "Musa",
      "acceptedAnswers": ["Musa", "musa"]
    },
    {
      "id": "H_Q6",
      "type": "short",
      "prompt": "F. Vem bor långt ifrån sina grannar?",
      "answer": "Linda",
      "acceptedAnswers": ["Linda", "linda"]
    },
    {
      "id": "H_Q7",
      "type": "short",
      "prompt": "G. Vem tycker att det är viktigt att grannarna hälsar?",
      "answer": "Maria",
      "acceptedAnswers": ["Maria", "maria"]
    },
    {
      "id": "H_Q8",
      "type": "short",
      "prompt": "H. Vem är arg på sina grannar?",
      "answer": "Hadi",
      "acceptedAnswers": ["Hadi", "hadi"]
    }
  ]
}
'@
Set-Content -Path "$readingDir/H.json" -Value $secH -Encoding utf8

# ==========================================
# 2. LISTENING (listening.json)
# ==========================================

$listeningJson = @'
{
  "examId": "2024-7",
  "parts": [
    {
      "id": 1,
      "title": "Uppgift 1: Ett samtal (Stefan och Jessika)",
      "audio": "audio1.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L1_A",
          "prompt": "A. Vart är Jessika på väg?",
          "options": ["till en läkare", "till ett apotek", "till sina föräldrar"],
          "answer": "till ett apotek"
        },
        {
          "id": "L1_B",
          "prompt": "B. När ska Jessika börja jobba igen?",
          "options": ["i höst", "i vinter", "i vår"],
          "answer": "i vår"
        },
        {
          "id": "L1_C",
          "prompt": "C. Vad ska Stefan göra ikväll?",
          "options": ["gå på fest", "gå till gymmet", "gå och handla"],
          "answer": "gå på fest"
        },
        {
          "id": "L1_D",
          "prompt": "D. Ska Jessika och Stefan ses på söndag?",
          "options": ["ja", "nej", "kanske"],
          "answer": "nej"
        }
      ]
    },
    {
      "id": 2,
      "title": "Uppgift 2: Några personer berättar",
      "audio": "audio2.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L2_A",
          "prompt": "A. Hur fick Anja sitt jobb? Genom ...",
          "options": ["en vän", "en annons", "sociala medier", "en utbildning"],
          "answer": "en vän"
        },
        {
          "id": "L2_B",
          "prompt": "B. Hur fick Leo sitt jobb? Genom ...",
          "options": ["en vän", "en annons", "sociala medier", "en utbildning"],
          "answer": "en utbildning"
        },
        {
          "id": "L2_C",
          "prompt": "C. Hur fick Nora sitt jobb? Genom ...",
          "options": ["en vän", "en annons", "sociala medier", "en utbildning"],
          "answer": "en annons"
        },
        {
          "id": "L2_D",
          "prompt": "D. Hur fick Niklas sitt jobb? Genom ...",
          "options": ["en vän", "en annons", "sociala medier", "en utbildning"],
          "answer": "en utbildning"
        },
        {
          "id": "L2_E",
          "prompt": "E. Hur fick Vera sitt jobb? Genom ...",
          "options": ["en vän", "en annons", "sociala medier", "en utbildning"],
          "answer": "sociala medier"
        }
      ]
    },
    {
      "id": 3,
      "title": "Uppgift 3: Nyheter från Solvik",
      "audio": "audio3.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L3_A",
          "prompt": "A. Vad säger nyheten om sjukhuset? Sjukhuset ...",
          "options": ["ska stänga.", "måste flytta.", "behöver mer personal."],
          "answer": "ska stänga."
        },
        {
          "id": "L3_B",
          "prompt": "B. Vad ska kommunen göra i centrum?",
          "options": ["förbjuda trafik", "plantera blommor", "städa bättre"],
          "answer": "städa bättre"
        },
        {
          "id": "L3_C",
          "prompt": "C. Varför är skolan stängd?",
          "options": ["Lärarna ska ha ett möte på skolan.", "Någon har tagit skolans datorer.", "Skolan har problem med el och internet."],
          "answer": "Någon har tagit skolans datorer."
        }
      ]
    },
    {
      "id": 4,
      "title": "Uppgift 4: Telefonsamtal",
      "audio": "audio4.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L4_A",
          "prompt": "A. Tobias ringer till en granne. Vad vill Tobias?",
          "options": ["be om hjälp", "lämna ett paket", "bjuda på middag"],
          "answer": "lämna ett paket"
        },
        {
          "id": "L4_B",
          "prompt": "B. Nadja ringer till en trafikskola. Vad vill Nadja?",
          "options": ["anmäla sig till en kurs", "tacka nej till en kurs", "veta vad en kurs kostar"],
          "answer": "tacka nej till en kurs"
        },
        {
          "id": "L4_C",
          "prompt": "C. Gudrun ringer till en butik på internet. Vad vill Gudrun?",
          "options": ["fråga om en betalning", "veta när ett paket kommer", "lämna tillbaka en vara"],
          "answer": "lämna tillbaka en vara"
        },
        {
          "id": "L4_D",
          "prompt": "D. Patricia ringer till en second hand-affär. Vad vill Patricia?",
          "options": ["lämna in kläder", "beställa hem kläder", "fråga om affärens öppettider"],
          "answer": "lämna in kläder"
        },
        {
          "id": "L4_E",
          "prompt": "E. Axel ringer till ett tågbolag. Vad vill Axel?",
          "options": ["köpa en biljett", "få pengar tillbaka", "avboka en resa"],
          "answer": "få pengar tillbaka"
        }
      ]
    },
    {
      "id": 5,
      "title": "Uppgift 5: Fredrik berättar",
      "audio": "audio5.mp3",
      "maxPlays": 2,
      "questions": [
        {
          "id": "L5_A",
          "prompt": "A. Var ligger Fredriks hus?",
          "options": ["nära hans föräldrar", "nära hans jobb", "nära hans vänner"],
          "answer": "nära hans föräldrar"
        },
        {
          "id": "L5_B",
          "prompt": "B. Vad tyckte Fredrik var jobbigast när han byggde huset?",
          "options": ["att det var dåligt väder", "att han hade så lite tid", "att han fick ont i ryggen"],
          "answer": "att han hade så lite tid"
        },
        {
          "id": "L5_C",
          "prompt": "C. Vad var roligt med att bygga huset?",
          "options": ["att han fick många nya grannar", "att hans vänner hjälpte till", "att han lärde sig mycket"],
          "answer": "att han lärde sig mycket"
        },
        {
          "id": "L5_D",
          "prompt": "D. Vilket tips ger Fredrik?",
          "options": ["spara pengar innan", "ta många pauser", "planera noga"],
          "answer": "planera noga"
        },
        {
          "id": "L5_E",
          "prompt": "E. Vad ska Fredrik och hans fru göra nästa sommar? De ska ...",
          "options": ["göra fint i trädgården.", "bygga ett extra rum.", "resa utomlands."],
          "answer": "resa utomlands."
        }
      ]
    }
  ]
}
'@
Set-Content -Path "$listeningDir/listening.json" -Value $listeningJson -Encoding utf8

# ==========================================
# 3. WRITING PROMPT (2024-7)
# ==========================================

$prompt2024_7 = @'
{
  "examId": "2024-7",
  "title": "Svara på ett mejl",
  "promptHtml": "<p><strong>Du har fått ett mejl från en vän. Läs mejlet och skriv ett svar.</strong></p><div style='background: var(--bg-page); padding: 16px; border-radius: 8px; border: 1px solid var(--border); margin: 12px 0;'><p><strong>Hej!</strong></p><p>Snart flyttar jag. Jag har några möbler som jag inte kan ta med då. Titta på bilderna i mejlet <em>(en säng, en röd soffa och en bokhylla)</em>. Vill du ha någon av möblerna?</p><p>Jag har också lite kläder som jag inte längre behöver. Har du något tips på vad jag kan göra med dem?</p><p>Jag vill gärna träffa dig innan jag flyttar. Skriv när det passar dig och ge förslag på något roligt vi kan göra då 😊.</p><p>Kram!</p></div><p style='margin-top: 16px;'><strong>Svara på mejlet. Du ska berätta:</strong></p><ul><li>om du vill ha någon av vännens möbler eller inte och berätta varför,</li><li>vad din vän kan göra med kläderna som vännen inte behöver,</li><li>när ni kan träffas och vad ni kan göra tillsammans då.</li></ul><p style='margin-top: 8px; color: var(--text-muted); font-size: 0.9rem;'>Tänk på hur du börjar och avslutar mejlet!</p>",
  "minWords": 80
}
'@
Set-Content -Path "$writingDir/prompt.json" -Value $prompt2024_7 -Encoding utf8

# ==========================================
# 4. BONUS: WRITING PROMPT (2025-8 from image)
# ==========================================

$writing2025_8Dir = "data/sfi/2025-8/writing"
if (Test-Path $writing2025_8Dir) {
    $prompt2025_8 = @'
{
  "examId": "2025-8",
  "title": "Svara på ett mejl",
  "promptHtml": "<p><strong>Du har fått ett mejl från en vän som har tagit körkort. Läs mejlet och skriv ett svar.</strong></p><div style='background: var(--bg-page); padding: 16px; border-radius: 8px; border: 1px solid var(--border); margin: 12px 0;'><p><strong>Hej!</strong></p><p>Jag har precis tagit körkort och köpt en bil! Nu vill jag göra en bilresa tillsammans med dig, gärna ett par dagar. När kan du åka? 😊</p><p>Skriv och berätta vart du vill åka och vad vi kan göra där.</p><p>Hör av dig!</p><p>Kram</p></div><p style='margin-top: 16px;'><strong>Svara på mejlet. Du ska:</strong></p><ul><li>berätta när du kan åka,</li><li>berätta vart du vill åka och varför,</li><li>berätta vad du och din vän kan göra där.</li></ul><p style='margin-top: 8px; color: var(--text-muted); font-size: 0.9rem;'>Tänk på hur du börjar och avslutar mejlet.</p>",
  "minWords": 80
}
'@
    Set-Content -Path "$writing2025_8Dir/prompt.json" -Value $prompt2025_8 -Encoding utf8
    Write-Host "  [Bonus] Also populated 2025-8 writing prompt!" -ForegroundColor Green
}

Write-Host "=== Done! Reading (A-H), Listening (Uppgift 1-5), and Writing populated for 2024-7! ===" -ForegroundColor Cyan
