import { listeningParts } from "./listeningData.js";

const container = document.getElementById("listeningContainer");

// Track audio play counts
const playCounts = {};

function renderListeningParts() {
    container.innerHTML = "";

    listeningParts.forEach(part => {
        playCounts[part.id] = 0;

        const partDiv = document.createElement("div");
        partDiv.className = "listening-part";

        partDiv.innerHTML = `
            <h2>${part.title}</h2>

            <audio id="audio-${part.id}" controls>
                <source src="${part.audio}" type="audio/mpeg">
            </audio>

            <p id="limit-${part.id}" class="audio-limit"></p>

            <div id="questions-${part.id}"></div>
        `;

        container.appendChild(partDiv);

        setupAudioLimit(part.id);
        renderQuestions(part.id, part.questions);
    });
}

function setupAudioLimit(id) {
    const audio = document.getElementById(`audio-${id}`);
    const limitText = document.getElementById(`limit-${id}`);

    audio.addEventListener("play", () => {
        playCounts[id]++;

        if (playCounts[id] > 2) {
            audio.pause();
            audio.currentTime = 0;
            limitText.textContent = "Du kan bara spela ljudet 2 gånger.";
        } else {
            limitText.textContent = `Du har spelat ljudet ${playCounts[id]} av 2 gånger.`;
        }
    });
}

function renderQuestions(id, questions) {
    const qDiv = document.getElementById(`questions-${id}`);

    questions.forEach((q, index) => {
        const block = document.createElement("div");
        block.className = "question-block";

        let html = `<p>${q.q}</p>`;

        q.options.forEach((opt, optIndex) => {
            html += `
                <button class="option-btn" onclick="checkAnswer(${id}, ${index}, ${optIndex})">
                    ${opt}
                </button>
            `;
        });

        block.innerHTML = html;
        qDiv.appendChild(block);
    });
}

window.checkAnswer = function(partId, qIndex, optIndex) {
    const part = listeningParts.find(p => p.id === partId);
    const question = part.questions[qIndex];

    if (optIndex === question.answer) {
        alert("Rätt svar!");
    } else {
        alert("Fel svar, försök igen.");
    }
};

renderListeningParts();
