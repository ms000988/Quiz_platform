// ------------------------------
// DUPLICATE CHECK
// ------------------------------
function normalizeText(text) {
    return text
        .toLowerCase()
        .replace(/[.,!?;:()]/g, "")
        .replace(/\s+/g, " ")
        .replace(/å/g, "a")
        .replace(/ä/g, "a")
        .replace(/ö/g, "o")
        .trim();
}

function isDuplicateSubmission(text) {
    const history = JSON.parse(localStorage.getItem("writingHistory") || "[]");
    if (history.length === 0) return false;

    const normalizedNew = normalizeText(text);
    return history.some(entry => normalizeText(entry.text) === normalizedNew);
}

// ------------------------------
// ERROR HIGHLIGHTING
// ------------------------------
function classifyErrorType(match) {
    const msg = match.message.toLowerCase();

    if (msg.includes("stavfel") || msg.includes("felstavning")) return "error-spelling";
    if (msg.includes("komma") || msg.includes("punkt") || msg.includes("mellanslag")) return "error-punctuation";

    return "error-grammar";
}

function highlightErrors(text, matches) {
    let highlighted = text;
    let offsetShift = 0;

    matches.forEach(match => {
        const start = match.offset + offsetShift;
        const end = start + match.length;

        const wrongText = highlighted.substring(start, end);
        const errorType = classifyErrorType(match);

        const replacementHTML =
            `<span class="${errorType}" title="${match.message}">${wrongText}</span>`;

        highlighted =
            highlighted.substring(0, start) +
            replacementHTML +
            highlighted.substring(end);

        offsetShift += replacementHTML.length - wrongText.length;
    });

    return highlighted.replace(/\n/g, "<br>");
}

// ------------------------------
// READABLE FEEDBACK
// ------------------------------
function generateReadableFeedback(matches) {
    if (matches.length === 0) {
        return "<p>Inga grammatiska fel hittades.</p>";
    }

    let html = `<p>Du har ${matches.length} grammatiska problem:</p><ul>`;
    matches.forEach(m => {
        html += `<li>${m.message}</li>`;
    });
    html += "</ul>";

    return html;
}

// ------------------------------
// MAIN SUBMIT HANDLER
// ------------------------------
document.getElementById("submitBtn").addEventListener("click", async () => {
    const btn = document.getElementById("submitBtn");
    btn.disabled = true;
    btn.innerText = "Skickar...";

    const text = document.getElementById("writingInput").value.trim();
    const words = text.split(/\s+/).length;

    // Duplicate check
    if (isDuplicateSubmission(text)) {
        alert("Du kan inte skicka in samma text igen. Gör ändringar och försök på nytt.");
        btn.disabled = false;
        btn.innerText = "Skicka in";
        return;
    }

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

    // ------------------------------
    // RULE: NO SCORE FOR SHORT TEXTS
    // ------------------------------
    if (words < 40) {
        const highlighted = highlightErrors(text, data.matches);

        document.getElementById("result").innerHTML = `
            <h3>⚠️ Texten är för kort</h3>
            <p>Skriv minst <strong>40 ord</strong> för att få ett resultat.</p>

            <h3>📄 Din text med markeringar</h3>
            <div class="highlighted-text">${highlighted}</div>

            <h3>📝 Grammatik</h3>
            ${generateReadableFeedback(data.matches)}

            <button id="editBtn" class="secondary-btn">✏️ Redigera och skicka igen</button>
        `;
        document.getElementById("editBtn").addEventListener("click", () => {
            btn.disabled = false;
            btn.innerText = "Skicka in";
        });
        return;
    }

    // ------------------------------
    // RULE: NO SCORE IF CEFR FAILS
    // ------------------------------
    if (cefrData.cefr !== "A1" && cefrData.cefr !== "A2" && cefrData.cefr !== "B1" && cefrData.cefr !== "B2" && cefrData.cefr !== "C1") {
        const highlighted = highlightErrors(text, data.matches);

        document.getElementById("result").innerHTML = `
            <h3>⚠️ CEFR-nivå kunde inte bestämmas</h3>
            <p>Skriv en längre och mer sammanhängande text.</p>

            <h3>📄 Din text med markeringar</h3>
            <div class="highlighted-text">${highlighted}</div>

            <h3>📝 Grammatik</h3>
            ${generateReadableFeedback(data.matches)}

            <button id="editBtn" class="secondary-btn">✏️ Redigera och skicka igen</button>
        `;
        document.getElementById("editBtn").addEventListener("click", () => {
            btn.disabled = false;
            btn.innerText = "Skicka in";
        });
        return;
    }

    // ------------------------------
    // FULL SCORING (valid text)
    // ------------------------------
    const highlighted = highlightErrors(text, data.matches);

    document.getElementById("result").innerHTML = `
        <h3>📚 CEFR-nivå: ${cefrData.cefr}</h3>

        <h3>📄 Din text med markeringar</h3>
        <div class="highlighted-text">${highlighted}</div>

        <h3>📝 Grammatik</h3>
        ${generateReadableFeedback(data.matches)}

        <button id="editBtn" class="secondary-btn">✏️ Redigera och skicka igen</button>
    `;

    document.getElementById("editBtn").addEventListener("click", () => {
        btn.disabled = false;
        btn.innerText = "Skicka in";
    });

    // Save history
    const history = JSON.parse(localStorage.getItem("writingHistory") || "[]");

    history.push({
        date: new Date().toLocaleString("sv-SE"),
        text: text,
        cefr: cefrData.cefr
    });

    localStorage.setItem("writingHistory", JSON.stringify(history));
});
