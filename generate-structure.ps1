# Root project folder
$root = "C:\YourProject\Quiz_platform"

# Year folders
$examFolders = @(
    "2012-1", "2013-2", "2013-3", "2013-4",
    "2014-5", "2014-6", "2015-7", "2015-8",
    "2016-9", "2016-10", "2017-11", "2017-12",
    "2018-13", "2018-14", "2019-15", "2019-16",
    "2020-18", "2022-1", "2022-2", "2022-3",
    "2023-4", "2023-5", "2024-6", "2024-7",
    "2025-8", "2025-9", "2026-10"
)

# Part folders
$parts = @("reading", "listening", "writing")

# Templates
$yearIndexTemplate = @"
<!DOCTYPE html>
<html lang='sv'>
<head>
    <meta charset='UTF-8'>
    <title>Delprov – YEAR</title>
    <link rel='stylesheet' href='../../assets/css/style.css'>
</head>
<body>
    <h1>Välj delprov för YEAR</h1>

    <div class='exam-parts'>
        <a href='reading/index.html' class='btn'>📘 Läsförståelse</a>
        <a href='listening/index.html' class='btn'>🎧 Hörförståelse</a>
        <a href='writing/index.html' class='btn'>✍️ Skriva</a>
    </div>
</body>
</html>
"@

$readingIndexTemplate = @"
<!DOCTYPE html>
<html lang='sv'>
<head>
    <meta charset='UTF-8'>
    <title>Läsförståelse – YEAR</title>
    <link rel='stylesheet' href='../../../assets/css/style.css'>
</head>
<body>
    <h1>Läsförståelse – YEAR</h1>

    <div id='progressContainer'><div id='progressBar'></div></div>

    <div id='sectionA'></div>
    <div id='sectionB'></div>
    <div id='sectionC'></div>
    <div id='sectionD'></div>

    <button id='submitBtn'>Rätta provet</button>
    <div id='result'></div>

    <script src='quiz.js'></script>
</body>
</html>
"@

$listeningIndexTemplate = @"
<!DOCTYPE html>
<html lang='sv'>
<head>
    <meta charset='UTF-8'>
    <title>Hörförståelse – YEAR</title>
    <link rel='stylesheet' href='../../../assets/css/style.css'>
</head>
<body>
    <h1>Hörförståelse – YEAR</h1>

    <audio controls src='../assets/audio/audio1.mp3'></audio>

    <div id='progressContainer'><div id='progressBar'></div></div>

    <div id='questions'></div>

    <button id='submitBtn'>Rätta provet</button>
    <div id='result'></div>

    <script src='quiz.js'></script>
</body>
</html>
"@

$writingIndexTemplate = @"
<!DOCTYPE html>
<html lang='sv'>
<head>
    <meta charset='UTF-8'>
    <title>Skriva – YEAR</title>
    <link rel='stylesheet' href='../../../assets/css/style.css'>
</head>
<body>
    <h1>Skriva – YEAR</h1>

    <p>Läs instruktionerna nedan:</p>
    <iframe src='../assets/docs/instructions.pdf' width='100%' height='600px'></iframe>

    <textarea id='writingInput' placeholder='Skriv ditt svar här...'></textarea>
    <button id='submitBtn'>Skicka</button>

    <script src='submit.js'></script>
</body>
</html>
"@

$quizTemplate = @"
const answerKey = {};

const totalQuestions = Object.keys(answerKey).length;

function updateProgress() {
    const answered = document.querySelectorAll(\"input[type='radio']:checked\").length;
    const percent = totalQuestions > 0 ? Math.round((answered / totalQuestions) * 100) : 0;
    document.getElementById('progressBar').style.width = percent + '%';
}

document.addEventListener('change', (e) => {
    if (e.target.type === 'radio') updateProgress();
});

function saveHistory(percent) {
    localStorage.setItem('history_FOLDERNAME_PARTNAME', JSON.stringify({
        score: percent,
        date: new Date().toLocaleString()
    }));
}

document.getElementById('submitBtn').addEventListener('click', () => {
    let correct = 0;
    let feedback = '';

    for (const qName in answerKey) {
        const correctIndex = answerKey[qName];
        const selected = document.querySelector(`input[name='${qName}']:checked`);
        const sectionLabel = qName.split('_')[1];

        if (!selected) {
            feedback += `<p class='wrong'>${sectionLabel} – ${qName}: No answer.</p>`;
            continue;
        }

        const val = parseInt(selected.value);
        if (val === correctIndex) {
            correct++;
            feedback += `<p class='correct'>${sectionLabel} – ${qName}: Correct!</p>`;
        } else {
            feedback += `<p class='wrong'>${sectionLabel} – ${qName}: Wrong.</p>`;
        }
    }

    const percent = totalQuestions > 0 ? Math.round((correct / totalQuestions) * 100) : 0;

    saveHistory(percent);

    document.getElementById('result').innerHTML =
        `You got <strong>${correct}</strong> out of <strong>${totalQuestions}</strong> correct (${percent}%).<br><br>${feedback}`;
});

updateProgress();
"@

# Create years folder
$yearsRoot = Join-Path $root "years"
if (!(Test-Path $yearsRoot)) {
    New-Item -ItemType Directory -Path $yearsRoot | Out-Null
}

foreach ($folder in $examFolders) {

    $folderPath = Join-Path $yearsRoot $folder

    if (!(Test-Path $folderPath)) {
        New-Item -ItemType Directory -Path $folderPath | Out-Null
    }

    # Create per-year assets folder
    $assetsPath = Join-Path $folderPath "assets"
    foreach ($sub in @("images", "audio", "docs")) {
        $subPath = Join-Path $assetsPath $sub
        if (!(Test-Path $subPath)) {
            New-Item -ItemType Directory -Path $subPath | Out-Null
        }
    }

    # Create part folders
    foreach ($part in $parts) {
        $partPath = Join-Path $folderPath $part
        if (!(Test-Path $partPath)) {
            New-Item -ItemType Directory -Path $partPath | Out-Null
        }

        # Generate index.html per part
        if ($part -eq "reading") {
            $content = $readingIndexTemplate.Replace("YEAR", $folder)
        }
        elseif ($part -eq "listening") {
            $content = $listeningIndexTemplate.Replace("YEAR", $folder)
        }
        elseif ($part -eq "writing") {
            $content = $writingIndexTemplate.Replace("YEAR", $folder)
        }

        Set-Content -Path (Join-Path $partPath "index.html") -Value $content

        # Generate quiz.js per part
        $quizContent = $quizTemplate.Replace("FOLDERNAME", $folder).Replace("PARTNAME", $part)
        Set-Content -Path (Join-Path $partPath "quiz.js") -Value $quizContent
    }

    # Generate year index.html
    $yearIndex = $yearIndexTemplate.Replace("YEAR", $folder)
    Set-Content -Path (Join-Path $folderPath "index.html") -Value $yearIndex
}

Write-Host "Multi-part exam structure generated successfully."
