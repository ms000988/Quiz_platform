document.getElementById("submitBtn").addEventListener("click", () => {
    const text = document.getElementById("writingInput").value.trim();

    if (text.length < 20) {
        document.getElementById("result").innerHTML =
            "<p class='wrong'>Du måste skriva lite mer.</p>";
        return;
    }

    // Save writing answer locally
    localStorage.setItem("writing_2026-10", JSON.stringify({
        answer: text,
        date: new Date().toLocaleString()
    }));

    document.getElementById("result").innerHTML =
        "<p class='correct'>Ditt svar har sparats! Du kan nu gå vidare.</p>";
});
