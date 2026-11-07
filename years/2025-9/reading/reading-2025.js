const sections = ["A","B","C","D","E","F","G","H"];
const appNav = document.getElementById("sectionNav");
const appContent = document.getElementById("sectionContent");

let currentSection = "A";
const cache = {};

function createNav() {
    sections.forEach(sec => {
        const btn = document.createElement("button");
        btn.className = "section-btn";
        btn.textContent = sec;
        btn.dataset.section = sec;
        btn.addEventListener("click", () => {
            currentSection = sec;
            renderNav();
            loadSection(sec);
        });
        appNav.appendChild(btn);
    });
    renderNav();
}

function renderNav() {
    [...appNav.children].forEach(btn => {
        btn.classList.toggle("active", btn.dataset.section === currentSection);
    });
}

async function loadSection(section) {
    if (!cache[section]) {
        const res = await fetch(`${section}.json`);
        cache[section] = await res.json();
    }
    renderSection(cache[section]);
}

function renderSection(data) {
    appContent.innerHTML = "";

    const title = document.createElement("h2");
    title.textContent = `${data.section} – ${data.title}`;
    appContent.appendChild(title);
    if (data.section === "D") {
    renderDiagrams();
    }


    // TEXTS
    if (data.text) {
        const block = document.createElement("div");
        block.className = "text-block";
        block.textContent = data.text;
        appContent.appendChild(block);
    }

    if (data.texts) {
        data.texts.forEach(t => {
            const block = document.createElement("div");
            block.className = "text-block";
            const header = document.createElement("strong");
            if (t.name) header.textContent = t.name + ": ";
            if (t.date) header.textContent = t.date + " – ";
            block.appendChild(header);

            if (Array.isArray(t.text)) {
                const ul = document.createElement("ul");
                t.text.forEach(line => {
                    const li = document.createElement("li");
                    li.textContent = line;
                    ul.appendChild(li);
                });
                block.appendChild(ul);
            } else {
                const span = document.createElement("span");
                span.textContent = t.text;
                block.appendChild(span);
            }

            appContent.appendChild(block);
        });
    }

    // QUESTIONS
    if (data.questions) {
        data.questions.forEach(q => {
            const qb = document.createElement("div");
            qb.className = "question-block";

            const qp = document.createElement("p");
            qp.textContent = q.id + ": " + q.question;
            qb.appendChild(qp);

            if (q.options) {
                q.options.forEach((opt, idx) => {
                    const label = document.createElement("label");
                    label.className = "option";

                    const input = document.createElement("input");
                    input.type = "radio";
                    input.name = q.id;
                    input.value = idx;

                    label.appendChild(input);
                    label.appendChild(document.createTextNode(" " + opt));
                    qb.appendChild(label);
                });
            } else {
                const input = document.createElement("input");
                input.type = "text";
                input.name = q.id;
                input.style.width = "100%";
                qb.appendChild(input);
            }

            appContent.appendChild(qb);
        });
    }
}
function renderDiagrams() {
    // Clear old charts if switching sections
    const old1 = Chart.getChart("chartBirths");
    const old2 = Chart.getChart("chartWeekdays");
    if (old1) old1.destroy();
    if (old2) old2.destroy();

    // Inject canvases
    const diagramContainer = document.createElement("div");
    diagramContainer.innerHTML = `
        <h3>Diagram 1 – Antal barn födda per år</h3>
        <canvas id="chartBirths"></canvas>

        <h3 style="margin-top:30px;">Diagram 2 – Barn födda per veckodag (2023)</h3>
        <canvas id="chartWeekdays"></canvas>
    `;
    appContent.appendChild(diagramContainer);

    // DATA (rewritten, safe)
    const years = ["2018", "2019", "2020", "2021", "2022", "2023"];
    const births = [300, 320, 350, 420, 380, 360];

    const weekdays = ["Mån", "Tis", "Ons", "Tor", "Fre", "Lör", "Sön"];
    const weekdayBirths = [15, 23, 12, 14, 15, 13, 8];

    // CHART 1
    new Chart(document.getElementById("chartBirths"), {
        type: "bar",
        data: {
            labels: years,
            datasets: [{
                label: "Antal barn",
                data: births,
                backgroundColor: births.map(v => v > 400 ? "#ff4444" : "#4e79a7")
            }]
        },
        options: {
            plugins: {
                legend: { display: false }
            }
        }
    });

    // CHART 2
    new Chart(document.getElementById("chartWeekdays"), {
        type: "bar",
        data: {
            labels: weekdays,
            datasets: [{
                label: "Andel (%)",
                data: weekdayBirths,
                backgroundColor: weekdayBirths.map(v => v === 23 ? "#ff4444" : "#59a14f")
            }]
        },
        options: {
            plugins: {
                legend: { display: false }
            }
        }
    });
}
function getUserAnswer(id) {
    const radios = document.querySelectorAll(`input[name="${id}"]`);
    if (radios.length > 0) {
        const checked = [...radios].find(r => r.checked);
        return checked ? checked.value : null;
    }
    const text = document.querySelector(`input[name="${id}"]`);
    return text ? text.value.trim() : null;
}

function scoreSection(sectionData) {
    let correct = 0;
    let total = sectionData.questions.length;

    sectionData.questions.forEach(q => {
        const userAnswer = getUserAnswer(q.id);

        if (q.options) {
            // Multiple choice
            if (parseInt(userAnswer) === q.answer) correct++;
        } else {
            // Short answer
            if (userAnswer && userAnswer.toLowerCase() === q.answer.toLowerCase()) {
                correct++;
            }
        }
    });

    return { correct, total };
}

function renderSummary(results) {
    const summary = document.getElementById("summaryPage");
    summary.innerHTML = "";
    summary.style.padding = "20px";

    let totalCorrect = 0;
    let totalQuestions = 0;

    const title = document.createElement("h2");
    title.textContent = "📘 Sammanfattning av provet";
    summary.appendChild(title);

    const list = document.createElement("ul");

    results.forEach(r => {
        totalCorrect += r.correct;
        totalQuestions += r.total;

        const li = document.createElement("li");
        li.style.margin = "10px 0";
        li.innerHTML = `
            <strong>Sektion ${r.section}</strong>: ${r.correct}/${r.total} rätt
            <button class="section-btn" onclick="loadSection('${r.section}')">Visa sektion</button>
        `;
        list.appendChild(li);
    });

    summary.appendChild(list);

    const percent = Math.round((totalCorrect / totalQuestions) * 100);

    const finalScore = document.createElement("h3");
    finalScore.textContent = `Totalt resultat: ${totalCorrect}/${totalQuestions} (${percent}%)`;
    summary.appendChild(finalScore);

    const pass = document.createElement("h2");
    pass.style.color = percent >= 60 ? "green" : "red";
    pass.textContent = percent >= 60 ? "✔ Godkänt" : "✘ Underkänt";
    summary.appendChild(pass);
}

document.getElementById("submitAllBtn").addEventListener("click", async () => {
    const results = [];

    for (const sec of sections) {
        if (!cache[sec]) {
            const res = await fetch(`${sec}.json`);
            cache[sec] = await res.json();
        }

        const score = scoreSection(cache[sec]);
        results.push({
            section: sec,
            correct: score.correct,
            total: score.total
        });
    }

    renderSummary(results);
    window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
});


// init
createNav();
loadSection(currentSection);
