document.getElementById("submitBtn").addEventListener("click", async () => {
    const text = document.getElementById("writingInput").value.trim();

    const response = await fetch("https://quiz-platform-aohd.onrender.com/correct", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ text })
    });

    const data = await response.json();

    let html = "<h3>Förslag på förbättringar:</h3>";

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

    document.getElementById("result").innerHTML = html;
});
