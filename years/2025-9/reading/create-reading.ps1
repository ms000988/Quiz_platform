# ================================
#  SFI C – 2025 Reading Generator
#  Creates Section A–H JSON files
# ================================

Write-Host "Generating SFI C 2025 Reading files..." -ForegroundColor Cyan

# ---- Section A ----
$sectionA = @{
    section   = "A"
    title     = "Åsikter om en affär"
    texts     = @(
        @{ name = "Ingrid"; text = "Det här är första gången jag besöker butiken. Jag såg direkt att de har en stor hylla med speciella varor från olika delar av världen. Det gör att jag gärna kommer tillbaka hit." },
        @{ name = "Katinka"; text = "Personalen här är väldigt trevlig, och jag pratar gärna med dem när jag handlar. Men det blir ofta problem när man ska betala med kort. Kortläsaren verkar krångla ganska ofta." },
        @{ name = "Roberto"; text = "Butiken borde ha fler kassor öppna, särskilt på kvällar och helger. Det blir långa köer då. Jag tycker också att personalen borde börja hälsa på kunderna." },
        @{ name = "Jesper"; text = "Det finns mycket frukt och grönt att välja på och priserna är okej. Men det är synd att man inte kan köpa nybakat bröd och bullar här. Ett litet bageri i butiken hade varit perfekt." }
    )
    questions = @(
        @{ id = "A1"; question = "Vad tycker Ingrid om affären?"; options = @("bra", "dålig", "både bra och dålig"); answer = 0 },
        @{ id = "A2"; question = "Vad tycker Katinka om affären?"; options = @("bra", "dålig", "både bra och dålig"); answer = 2 },
        @{ id = "A3"; question = "Vad tycker Roberto om affären?"; options = @("bra", "dålig", "både bra och dålig"); answer = 1 },
        @{ id = "A4"; question = "Vad tycker Jesper om affären?"; options = @("bra", "dålig", "både bra och dålig"); answer = 2 }
    )
}

$sectionA | ConvertTo-Json -Depth 10 | Out-File "A.json" -Encoding UTF8


# ---- Section B ----
$sectionB = @{
    section   = "B"
    title     = "En dagbok"
    texts     = @(
        @{ date = "Tisdag 1 april"; text = "Jag skulle egentligen vara ledig i dag, men min kollega Lena blev förkyld, så jag fick ta hennes arbetspass. Jag hoppas att hon blir frisk snart." },
        @{ date = "Onsdag 2 april"; text = "Jag jobbade kväll och kom hem sent. Jag var hungrig, men kylskåpet var tomt och alla affärer hade stängt. Till slut hittade jag lite kycklinggryta i frysen." },
        @{ date = "Torsdag 3 april"; text = "En barnfamilj reste med oss i dag. Ett av barnen var rädd för att flyga, så jag pratade och skojade med henne. Då blev hon lugnare." },
        @{ date = "Fredag 4 april"; text = "Min kompis Anastasia ringde och ville springa i parken. Men jag hade en läkartid, så jag kunde inte träna i dag." },
        @{ date = "Lördag 5 april"; text = "I dag fyller jag år! Jag har bjudit mina föräldrar och några kusiner. Det är alltid roligt att träffa släkten." }
    )
    questions = @(
        @{ id = "B1"; question = "Vilket ord passar bäst i texten? (A)"; options = @("klar", "frisk", "ledig"); answer = 1 },
        @{ id = "B2"; question = "Vilket ord passar bäst i texten? (B)"; options = @("hittade", "sparade", "kastade"); answer = 0 },
        @{ id = "B3"; question = "Vilket ord passar bäst i texten? (C)"; options = @("lugn", "sjuk", "ensam"); answer = 0 },
        @{ id = "B4"; question = "Vilket ord passar bäst i texten? (D)"; options = @("måste", "kunde", "behövde"); answer = 1 },
        @{ id = "B5"; question = "Vilket ord passar bäst i texten? (E)"; options = @("hjälpa", "gratulera", "träffa"); answer = 2 }
    )
}

$sectionB | ConvertTo-Json -Depth 10 | Out-File "B.json" -Encoding UTF8


# ---- Section C ----
$sectionC = @{
    section   = "C"
    title     = "Syskonrelationer"
    texts     = @(
        @{ name = "Ella"; text = "Mina bröder är mycket äldre än jag. De ger mig bra råd och hjälper mig med praktiska saker. Ibland önskar jag att jag hade en syster också." },
        @{ name = "Martin"; text = "Jag har två äldre systrar. Förr hade vi en bra relation, men nu kritiserar de allt jag gör. Ibland skriker vi åt varandra." },
        @{ name = "Dante"; text = "Jag bor med min mamma och storebror. Det fungerar bra, men jag vill prova att bo själv när jag slutar gymnasiet." },
        @{ name = "Kifle"; text = "Jag bor i Skåne, men mina syskon bor i andra delar av landet. Jag saknar dem och hoppas att vi kan ses oftare." },
        @{ name = "Rakel"; text = "Jag är enda barnet. Mina vänner tycker synd om mig, men jag trivs med att vara ensam." }
    )
    questions = @(
        @{ id = "C1"; question = "Vem vill träffa sina syskon mer?"; answer = "Kifle" },
        @{ id = "C2"; question = "Vem får mycket hjälp av sina syskon?"; answer = "Ella" },
        @{ id = "C3"; question = "Vem bråkar med sina syskon?"; answer = "Martin" },
        @{ id = "C4"; question = "Vem trivs bra med att inte ha några syskon?"; answer = "Rakel" }
    )
}

$sectionC | ConvertTo-Json -Depth 10 | Out-File "C.json" -Encoding UTF8


# ---- Section D ----
$sectionD = @{
    section   = "D"
    title     = "Två diagram"
    questions = @(
        @{ id = "D1"; question = "Vilket år föddes fler än 400 barn?"; answer = "2021" },
        @{ id = "D2"; question = "Vilken veckodag föddes flest barn år 2023?"; answer = "tisdag" }
    )
}

$sectionD | ConvertTo-Json -Depth 10 | Out-File "D.json" -Encoding UTF8


# ---- Section E ----
$sectionE = @{
    section   = "E"
    title     = "Intervju med Elin"
    text      = "Elin berättar att hennes intresse för bilar började när hon var barn. Hon gillar äldre bilmodeller och tycker att det roligaste är att se en bil få nytt liv. Hon kör sina bilar ibland."
    questions = @(
        @{ id = "E1"; question = "När blev du intresserad av bilar?"; answer = "2" },
        @{ id = "E2"; question = "Vilka bilar gillar du?"; answer = "4" },
        @{ id = "E3"; question = "Vad är det roligaste med att reparera bilar?"; answer = "5" },
        @{ id = "E4"; question = "Brukar du köra dina bilar också?"; answer = "1" }
    )
}

$sectionE | ConvertTo-Json -Depth 10 | Out-File "E.json" -Encoding UTF8


# ---- Section F ----
$sectionF = @{
    section   = "F"
    title     = "Han gör stadens godaste glass"
    text      = "Filip lärde sig göra glass efter en resa till Italien. Han öppnade ett glasscafé som blev populärt under sommaren. Det bästa med jobbet är att se kunderna njuta av glassen."
    questions = @(
        @{ id = "F1"; question = "Var lärde sig Filip att göra glass?"; options = @("I skolan", "i sitt hem", "på en resa"); answer = 1 },
        @{ id = "F2"; question = "Vad hände första dagen på Filips café?"; options = @("Han blev sjuk", "Glassen tog slut snabbt", "Det kom nästan inga kunder"); answer = 2 },
        @{ id = "F3"; question = "Vad är det bästa med jobbet?"; options = @("att prova nya smaker", "att bestämma allt själv", "att kunderna gillar glassen"); answer = 2 },
        @{ id = "F4"; question = "Vad är svårt med att ha caféet?"; options = @("att jobba mycket", "att arbeta ensam", "att sälja mindre på vintern"); answer = 0 },
        @{ id = "F5"; question = "Vad vill Filip göra i framtiden?"; options = @("ha billigare priser", "starta fler caféer", "sälja glass i mataffärer"); answer = 1 }
    )
}

$sectionF | ConvertTo-Json -Depth 10 | Out-File "F.json" -Encoding UTF8


# ---- Section G ----
$sectionG = @{
    section   = "G"
    title     = "Meddelanden på sociala medier"
    texts     = @(
        @{ name = "Hamid"; text = "Sopstationen är alltid full. Kommunen måste tömma oftare." },
        @{ name = "Rebecka"; text = "Biblioteket har extra öppet på helgerna med aktiviteter för barn." },
        @{ name = "Parvin"; text = "Tack till grannarna som hjälpte mig att hitta min katt." },
        @{ name = "Edvin"; text = "Har någon utemöbler att låna ut till min fest?" }
    )
    questions = @(
        @{ id = "G1"; question = "Vad vill Hamid?"; options = @("ge bort något", "klaga på något", "be om ursäkt"); answer = 1 },
        @{ id = "G2"; question = "Vad vill Rebecka?"; options = @("ge tips", "sälja något", "be om hjälp"); answer = 0 },
        @{ id = "G3"; question = "Vad vill Parvin?"; options = @("be om ursäkt", "ge tips", "tacka för något"); answer = 2 },
        @{ id = "G4"; question = "Vad vill Edvin?"; options = @("låna något", "tacka för något", "klaga på något"); answer = 0 }
    )
}

$sectionG | ConvertTo-Json -Depth 10 | Out-File "G.json" -Encoding UTF8


# ---- Section H ----
$sectionH = @{
    section   = "H"
    title     = "Anteckningar från ett möte + Folkets hus"
    texts     = @(
        @{
            name = "Klassråd"
            text = @(
                "Det är viktigt att komma i tid.",
                "Skolan borde ha vikarier när lärare är borta.",
                "Elever vill ha längre lunchrast.",
                "Elever vill åka på studiebesök."
            )
        },
        @{
            name = "Folkets hus"
            text = @(
                "Föreläsning om Österstad av Maria Jansson.",
                "Gympa för äldre på tisdagar.",
                "Språkgrupp för föräldralediga.",
                "Kurs i studieteknik med Hassan Karim.",
                "Konsert på Kafé Smakriket varje fredag."
            )
        }
    )
    questions = @(
        @{ id = "H1"; question = "Vilken rubrik passar bäst för text 1?"; answer = "Kom i tid" },
        @{ id = "H2"; question = "Vilken rubrik passar bäst för text 2?"; answer = "Anställ vikarier" },
        @{ id = "H3"; question = "Vilken rubrik passar bäst för text 3?"; answer = "Längre rast" },
        @{ id = "H4"; question = "Vilken rubrik passar bäst för text 4?"; answer = "Fler studiebesök" },
        @{ id = "H5"; question = "Vilken veckodag är det träning för äldre personer?"; answer = "Tisdag" },
        @{ id = "H6"; question = "Vem berättar om stadens historia?"; answer = "Maria Jansson" },
        @{ id = "H7"; question = "När är sista anmälningsdatum för studieteknik?"; answer = "30 september" },
        @{ id = "H8"; question = "Var kan man lyssna på musik på fredagar?"; answer = "Kafé Smakriket" }
    )
}

$sectionH | ConvertTo-Json -Depth 10 | Out-File "H.json" -Encoding UTF8


Write-Host "All reading files generated successfully!" -ForegroundColor Green
