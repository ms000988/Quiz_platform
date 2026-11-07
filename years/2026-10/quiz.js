// ===============================
// Answer key for this exam year
// ===============================
const answerKey = {
    // Example:
    // "q_A_1": 1,
    // "q_B_2": 0,
    // "q_C_3": 2,
};

// ===============================
// Progress bar update
// ===============================
document.addEventListener("change", () => {
    const answered = document.querySelectorAll("input[type=radio]:checked").length;
    const total = Object.keys(answerKey).length;

    if (total > 0) {
        const percent = Math.round((answered / total) * 100);
        document.getElementById("progressBar").style.width = percent + "%";
    }
});

// ===============================
// Save history to LocalStorage
// ===============================
function saveHistory(percent) {
    localStorage.setItem("history_FOLDER_NAME", JSON.stringify({
        score: percent,
        date: new Date().toLocaleString()
    }));
}

// ===============================
// Submit button logic
// ===============================
document.getElementById("submitBtn").addEventListener("click", () => {
    let correct = 0;
    let feedback = "";

    for (const q in answerKey) {
        const selected = document.querySelector(`input[name='${q}']:checked`);

        if (selected && parseInt(selected.value) === answerKey[q]) {
            correct++;
            feedback += `<p class='correct'>${q}: Rätt!</p>`;
        } else {
            feedback += `<p class='wrong'>${q}: Fel.</p>`;
        }
    }

    const total = Object.keys(answerKey).length;
    const percent = total > 0 ? Math.round((correct / total) * 100) : 0;

    // Save history
    saveHistory(percent);

    // Show result
    document.getElementById("result").innerHTML = `
        Du fick <strong>${correct}</strong> av <strong>${total}</strong> rätt (${percent}%).<br><br>
        ${feedback}
    `;
});
