/* ============================
   FINAL SUBMIT FUNCTION
   ============================ */

function submitQuizsdf() {
    let correct = 0;
    let feedback = "";

    for (const qName in answerKey) {
        const correctIndex = answerKey[qName];
        const selected = document.querySelector(`input[name='${qName}']:checked`);
        const sectionLabel = qName.split("_")[1]; // A, B, C...

        if (!selected) {
            feedback += `<p class="wrong">${sectionLabel} – ${qName}: No answer.</p>`;
            continue;
        }

        const val = parseInt(selected.value);
        if (val === correctIndex) {
            correct++;
            feedback += `<p class="correct">${sectionLabel} – ${qName}: Correct!</p>`;
        } else {
            feedback += `<p class="wrong">${sectionLabel} – ${qName}: Wrong.</p>`;
        }
    }

    const percent = Math.round((correct / totalQuestions) * 100);
    document.getElementById("result").innerHTML =
        `You got <strong>${correct}</strong> out of <strong>${totalQuestions}</strong> correct (${percent}%).<br><br>${feedback}`;
}

/* ============================
   ANSWER KEY
   ============================ */

/* ============================
   ANSWER KEY
   ============================ */

const answerKeysdaf = {
  "q_A_1": 1,
  "q_A_2": 2,
  "q_A_3": 1,
  "q_A_4": 0,

  "q_B_1": 1,
  "q_B_2": 3,
  "q_B_3": 4,
  "q_B_4": 0,

  "q_C_1": 2,
  "q_C_2": 2,
  "q_C_3": 0,
  "q_C_4": 1,
  "q_C_5": 1,
  "q_C_6": 2,

  "q_D_1": 1,
  "q_D_2": 0,
  "q_D_3": 1,
  "q_D_4": 1,
  "q_D_5": 0,

  "q_E_1": 2,
  "q_E_2": 0,
  "q_E_3": 2,
  "q_E_4": 1,

  "q_F_1": 2,
  "q_F_2": 5,
  "q_F_3": 3,
  "q_F_4": 0,

  "q_G_1": 2,
  "q_G_2": 0,
  "q_G_3": 3,
  "q_G_4": 4,

  "q_H_1": 2,
  "q_H_2": 3
};

const totalQuestions = Object.keys(answerKey).length;

/* ============================
   PROGRESS BAR
   ============================ */

function updateProgress() {
  const answered = document.querySelectorAll("input[type='radio']:checked").length;
  const percent = Math.round((answered / totalQuestions) * 100);
  const bar = document.getElementById("progressBar");
  if (bar) bar.style.width = percent + "%";
}

document.addEventListener("change", (e) => {
  if (e.target.type === "radio") updateProgress();
});

/* ============================
   RESULT CHECK
   ============================ */

document.getElementById("submitBtn").addEventListener("click", () => {
  let correct = 0;
  let feedback = "";

  for (const qName in answerKey) {
    const correctIndex = answerKey[qName];
    const selected = document.querySelector(`input[name='${qName}']:checked`);
    const sectionLabel = qName.split("_")[1];

    if (!selected) {
      feedback += `<p class="wrong">${sectionLabel} – ${qName}: No answer.</p>`;
      continue;
    }

    const val = parseInt(selected.value);
    if (val === correctIndex) {
      correct++;
      feedback += `<p class="correct">${sectionLabel} – ${qName}: Correct!</p>`;
    } else {
      feedback += `<p class="wrong">${sectionLabel} – ${qName}: Wrong.</p>`;
    }
  }

  const percent = Math.round((correct / totalQuestions) * 100);
  document.getElementById("result").innerHTML =
    `You got <strong>${correct}</strong> out of <strong>${totalQuestions}</strong> correct (${percent}%).<br><br>${feedback}`;
});

/* ============================
   SAFE CHART INITIALIZER
   ============================ */

function initChart() {
    const canvas = document.getElementById('diagramChart');
    if (!canvas) {
        console.warn("diagramChart not found yet. Section H may not be loaded.");
        return;
    }

    const ctx = canvas.getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Sporthall', 'Badhus', 'Museum', 'Bibliotek'],
            datasets: [
                {
                    label: '2022',
                    data: [6000, 7000, 3000, 7000],
                    backgroundColor: 'rgba(75, 192, 192, 0.6)'
                },
                {
                    label: '2023',
                    data: [6500, 7200, 3500, 6800],
                    backgroundColor: 'rgba(153, 102, 255, 0.6)'
                },
                {
                    label: '2024',
                    data: [8000, 7000, 4000, 7000],
                    backgroundColor: 'rgba(255, 159, 64, 0.6)'
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'top' }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { stepSize: 1000 }
                }
            }
        }
    });
}

/* ============================
   INIT PROGRESS
   ============================ */

updateProgress();

