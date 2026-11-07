document.getElementById("submitBtn").addEventListener("click", async () => {
    const btn = document.getElementById("submitBtn");
    btn.disabled = true;
    btn.innerText = "Skickar...";

    const text = document.getElementById("writingInput").value.trim();

    // Grammar correction
    const response = await fetch("https://quiz-platform-aohd.onrender.com/correct", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ text })
    });

    const data = await response.json();

    // CEFR scoring
    const cefrResponse = await fetch("https://quiz-platform-aohd.onrender.com/cefr", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ text })
    });

    const cefrData = await cefrResponse.json();

    // --- SCORING SYSTEM ---

    function grammarScore(errors) {
        const score = 40 - (errors * 4);
        return Math.max(0, score);
    }

    function cefrScore(level) {
        switch (level) {
            case "A1": return 5;
            case "A2": return 15;
            case "B1": return 25;
            case "B2": return 30;
            case "C1": return 30;
            default: return 5;
        }
    }

    function contentCoverage(text) {
        const lower = text.toLowerCase();
        let score = 0;

        if (lower.includes("bra") || lower.includes("dålig") || lower.includes("område"))
            score += 7;

        if (lower.includes("vänner") || lower.includes("träffa"))
            score += 7;

        if (lower.includes("flytta") || lower.includes("borde"))
            score += 7;

        return score;
    }

    function lengthScore(text) {
        const words = text.trim().split(/\s+/).length;
        if (words < 40) return 0;
        if (words < 80) return 5;
        return 10;
    }

    function finalScore(errors, cefr, text) {
        return grammarScore(errors)
            + cefrScore(cefr)
            + contentCoverage(text)
            + lengthScore(text);
    }

    const score = finalScore(data.matches.length, cefrData.cefr, text);

    // --- DISPLAY RESULTS ---

    let html = `
        <h3>📚 CEFR-nivå: ${cefrData.cefr}</h3>
        <h3>💯 Poäng: ${score}/100</h3>
        <h3>Förslag på förbättringar:</h3>
    `;

    if (data.matches.length === 0) {
        html += "<p class='correct'>Inga fel hittades! Bra jobbat.</p>";
    } else {
        data.matches.forEach(match => {
            html += `
                <div class="lt-suggestion">
                    <p><strong>Problem:</strong> ${match.message}</p>
                    ${match.replacements.length > 0 ? `<p><strong>Förslag:</strong> ${match.replacements[0].value}</p>` : ""}
                    <p><strong>Text:</strong> ${match.context.text}</p>
                </div>
            `;
        });
    }

    // Edit & resend button
    html += `
        <button id="editBtn" class="secondary-btn">✏️ Redigera och skicka igen</button>
    `;

    document.getElementById("result").innerHTML = html;

    document.getElementById("editBtn").addEventListener("click", () => {
        btn.disabled = false;
        btn.innerText = "Skicka in";
    });

    // --- SAVE HISTORY ---
    const history = JSON.parse(localStorage.getItem("writingHistory") || "[]");

    history.push({
        date: new Date().toLocaleString("sv-SE"),
        text: text,
        score: score,
        cefr: cefrData.cefr
    });

    localStorage.setItem("writingHistory", JSON.stringify(history));
});

// Show writing history
function renderHistory() {
    const history = JSON.parse(localStorage.getItem("writingHistory") || "[]");

    if (history.length === 0) return;

    let historyHTML = "<h3>📄 Dina tidigare skrivuppgifter</h3>";

    history.forEach(entry => {
        historyHTML += `
            <div class="history-item">
                <p><strong>${entry.date}</strong></p>
                <p>Poäng: ${entry.score}/100</p>
                <p>CEFR: ${entry.cefr}</p>
                <details>
                    <summary>Visa text</summary>
                    <p>${entry.text}</p>
                </details>
            </div>
        `;
    });

    document.getElementById("result").insertAdjacentHTML("afterend", historyHTML);
}

renderHistory();
