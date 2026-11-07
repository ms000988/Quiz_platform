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
    localStorage.setItem('history_2022-3_writing', JSON.stringify({
        score: percent,
        date: new Date().toLocaleString()
    }));
}

document.getElementById('submitBtn').addEventListener('click', () => {
    let correct = 0;
    let feedback = '';

    for (const qName in answerKey) {
        const correctIndex = answerKey[qName];
        const selected = document.querySelector(input[name='']:checked);
        const sectionLabel = qName.split('_')[1];

        if (!selected) {
            feedback += <p class='wrong'> – : No answer.</p>;
            continue;
        }

        const val = parseInt(selected.value);
        if (val === correctIndex) {
            correct++;
            feedback += <p class='correct'> – : Correct!</p>;
        } else {
            feedback += <p class='wrong'> – : Wrong.</p>;
        }
    }

    const percent = totalQuestions > 0 ? Math.round((correct / totalQuestions) * 100) : 0;

    saveHistory(percent);

    document.getElementById('result').innerHTML =
        You got <strong></strong> out of <strong></strong> correct (%).<br><br>;
});

updateProgress();
