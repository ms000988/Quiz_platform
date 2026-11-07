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
// SCORING SYSTEM (REALISTIC)
// ------------------------------

// Grammar (0–30)
function grammarScore(errors) {
    return Math.max(0, 30 - errors * 5);
}

// CEFR (0–20)
function cefrScore(level) {
    switch (level) {
        case "A1": return 5;
        case "A2": return 10;
        case "B1": return 15;
        case "B2": return 20;
        case "C1": return 20;
        default: return 0; // "Error"
    }
}

// Content coverage (0–30)
function contentCoverage(text) {
    const lower = text.toLowerCase();
    let score = 0;

    if (lower.includes("bra") || lower.includes("dålig") || lower.includes("område")) score += 10;
    if (lower.includes("vänner") || lower.includes("träffa")) score += 10;
    if (lower.includes("flytta") || lower.includes("borde")) score += 10;

    return score;
}

// Length (0–10)
function lengthScore(text) {
    const words = text.trim().split(/\s+/).length;
    if (words < 40) return 0;
    if (words < 80) return 5;
    return 10;
}

// Vocabulary richness (0–5)
function vocabularyScore(text) {
    const words = text.toLowerCase().replace(/[.,!?;:()]/g, "").split(/\s+/).filter(w => w.length > 2);
    const total = words.length;
    if (total === 0) return 0;

    const unique = new Set(words).size;
    const ttr = unique / total;

    if (ttr < 0.35) return 1;
    if (ttr < 0.50) return 3;
    if (ttr < 0.65) return 4;
    return 5;
}

// Sentence complexity (0–5)
function sentenceComplexityScore(text) {
    const sentences = text.split(/[.!?]/).filter(s => s.trim().length > 0);
    if (sentences.length === 0) return 0;

    const words = text.split(/\s+/);
    const avgLength = words.length / sentences.length;

    let score = 0;

    if (avgLength < 8) score += 1;
    else if (avgLength < 12) score += 2;
    else if (avgLength < 18) score += 3;
    else score += 4;

    const subs = ["att", "som", "när", "eftersom", "medan", "om"];
    let subCount = 0;
    subs.forEach(s => {
        subCount += (text.toLowerCase().match(new RegExp(`\\b${s}\\b`, "g")) || []).length;
    });
    score += Math.min(subCount, 1);

    return Math.min(score, 5);
}

// FINAL SCORE (only for full texts)
function finalScore(errors, cefr, text) {
    return grammarScore(errors)
        + cefrScore(cefr)
        + contentCoverage(text)
        + lengthScore(text)
        + vocabularyScore(text)
        + sentenceComplexityScore(text);
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
        document.getElementById("result").innerHTML = `
            <h3>⚠️ Texten är för kort</h3>
            <p>Skriv minst <strong>40 ord</strong> för att få ett resultat.</p>
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
    if (cefrData.cefr === "Error") {
        document.getElementById("result").innerHTML = `
            <h3>⚠️ CEFR-nivå kunde inte bestämmas</h3>
            <p>Skriv en längre och mer sammanhängande text.</p>
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
    // RULE: NO SCORE IF CONTENT MISSING
    // ------------------------------
    if (contentCoverage(text) < 10) {
        document.getElementById("result").innerHTML = `
            <h3>⚠️ Du har inte svarat på uppgiften</h3>
            <p>Beskriv området, vänner och om din vän ska flytta.</p>
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
    const score = finalScore(data.matches.length, cefrData.cefr, text);

    let html = `
        <h3>📚 CEFR-nivå: ${cefrData.cefr}</h3>
        <h3>💯 Poäng: ${score}/100</h3>
        <h3>📝 Grammatik</h3>
        ${generateReadableFeedback(data.matches)}
        <button id="editBtn" class="secondary-btn">✏️ Redigera och skicka igen</button>
    `;

    document.getElementById("result").innerHTML = html;

    document.getElementById("editBtn").addEventListener("click", () => {
        btn.disabled = false;
        btn.innerText = "Skicka in";
    });

    // Save history
    const history = JSON.parse(localStorage.getItem("writingHistory") || "[]");

    history.push({
        date: new Date().toLocaleString("sv-SE"),
        text: text,
        score: score,
        cefr: cefrData.cefr
    });

    localStorage.setItem("writingHistory", JSON.stringify(history));
});
