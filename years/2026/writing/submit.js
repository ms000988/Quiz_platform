document.getElementById("submitBtn").addEventListener("click", async () => {
    const btn = document.getElementById("submitBtn");
    btn.disabled = true;
    btn.innerText = "Skickar...";

    const text = document.getElementById("writingInput").value.trim();

    // Reject duplicate submissions
    if (isDuplicateSubmission(text)) {
        alert("Du kan inte skicka in samma text två gånger. Gör ändringar och försök igen.");
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

    // --- SCORING SYSTEM ---

    function grammarScore(errors) {
        return Math.max(0, 40 - errors * 4);
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

        if (lower.includes("bra") || lower.includes("dålig") || lower.includes("område")) score += 7;
        if (lower.includes("vänner") || lower.includes("träffa")) score += 7;
        if (lower.includes("flytta") || lower.includes("borde")) score += 7;

        return score;
    }

    function lengthScore(text) {
        const words = text.trim().split(/\s+/).length;
        if (words < 40) return 0;
        if (words < 80) return 5;
        return 10;
    }

    function vocabularyScore(text) {
        const words = text.toLowerCase().replace(/[.,!?;:()]/g, "").split(/\s+/).filter(w => w.length > 2);
        const total = words.length;
        if (total === 0) return 0;

        const unique = new Set(words).size;
        const ttr = unique / total;

        if (ttr < 0.35) return 5;
        if (ttr < 0.50) return 12;
        if (ttr < 0.65) return 17;
        return 20;
    }

    function sentenceComplexityScore(text) {
        const sentences = text.split(/[.!?]/).filter(s => s.trim().length > 0);
        if (sentences.length === 0) return 0;

        const words = text.split(/\s+/);
        const avgLength = words.length / sentences.length;

        let score = 0;

        if (avgLength < 8) score += 3;
        else if (avgLength < 12) score += 7;
        else if (avgLength < 18) score += 12;
        else score += 15;

        const subs = ["att", "som", "när", "eftersom", "medan", "om"];
        let subCount = 0;
        subs.forEach(s => {
            subCount += (text.toLowerCase().match(new RegExp(`\\b${s}\\b`, "g")) || []).length;
        });
        score += Math.min(subCount * 2, 10);

        const compounds = ["och", "men", "så", "för att"];
        let compCount = 0;
        compounds.forEach(c => {
            compCount += (text.toLowerCase().match(new RegExp(`\\b${c}\\b`, "g")) || []).length;
        });
        score += Math.min(compCount * 1.5, 5);

        return Math.min(score, 20);
    }

    function finalScore(errors, cefr, text) {
        return grammarScore(errors)
            + cefrScore(cefr)
            + contentCoverage(text)
            + lengthScore(text)
            + vocabularyScore(text)
            + sentenceComplexityScore(text);
    }

    const score = finalScore(data.matches.length, cefrData.cefr, text);

    // --- READABLE FEEDBACK ---
    const readableFeedback = generateReadableFeedback(data.matches);

    // --- DISPLAY RESULTS ---
    let html = `
        <h3>📚 CEFR-nivå: ${cefrData.cefr}</h3>
        <h3>💯 Poäng: ${score}/100</h3>
        <h3>🧠 Ordförrådsrikedom: ${vocabularyScore(text)}/20</h3>
        <h3>🧩 Meningskomplexitet: ${sentenceComplexityScore(text)}/20</h3>
        <h3>📝 Grammatik:</h3>
        ${readableFeedback}
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

// Duplicate check
function isDuplicateSubmission(text) {
    const history = JSON.parse(localStorage.getItem("writingHistory") || "[]");
    if (history.length === 0) return false;

    const last = history[history.length - 1].text.trim().toLowerCase();
    return last === text.trim().toLowerCase();
}

// Readable feedback
function generateReadableFeedback(matches) {
    if (matches.length === 0) {
        return "<p class='correct'>Inga grammatiska fel hittades! Bra jobbat.</p>";
    }

    let summary = `<p>Du har ${matches.length} grammatiska problem:</p><ul>`;
    let details = "<h4>💡 Förbättringsförslag:</h4><ul>";

    matches.forEach(m => {
        summary += `<li>${m.message}</li>`;
        details += `<li>${m.message} – Förslag: ${m.replacements[0]?.value || "Ingen specifik"}</li>`;
    });

    summary += "</ul>";
    details += "</ul>";

    return summary + details;
}
