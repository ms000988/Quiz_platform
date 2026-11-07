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

    // Score calculation
    const errorCount = data.matches.length;
    let score = 100 - (errorCount * 5);
    if (score < 0) score = 0;

    let html = `
        <h3>📊 CEFR-nivå: ${cefrData.cefr}</h3>
        <h3>🔢 Poäng: ${score}/100</h3>
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

    // Re-enable writing mode
    document.getElementById("editBtn").addEventListener("click", () => {
        btn.disabled = false;
        btn.innerText = "Skicka in";
    });

    // Save writing history
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
