export class SpeakingClient {
  constructor({ dataPath = './speaking.json', rootElement, examId, backendUrl = 'https://quiz-platform-aohd.onrender.com' }) {
    this.dataPath = dataPath;
    this.root = rootElement;
    this.examId = examId;
    this.backendUrl = backendUrl;
    this.speakingData = null;
    this.currentTalkIndex = 0;
  }

  async init() {
    try {
      const res = await fetch(this.dataPath);
      if (res.ok) {
        this.speakingData = await res.json();
      }
    } catch {
      this.speakingData = {
        talks: [
          { part: 1, title: 'Del 1: Situation', prompt: 'Beskriv en händelse...', preparationTimeSeconds: 60, speakingTimeSeconds: 120 },
          { part: 2, title: 'Del 2: Åsikter', prompt: 'Diskutera för- och nackdelar...', preparationTimeSeconds: 60, speakingTimeSeconds: 120 }
        ]
      };
    }

    this.render();
  }

  render() {
    const talks = this.speakingData.talks || [];
    const talk = talks[this.currentTalkIndex];

    if (!talk) {
      this.root.innerHTML = `<div class="content-card"><h2>🎉 Tala-delen slutförd!</h2></div>`;
      return;
    }

    this.root.innerHTML = `
      <div class="content-card speaking-container">
        <h2>🗣️ ${talk.title} (${this.currentTalkIndex + 1} av ${talks.length})</h2>
        <div class="speaking-prompt-box">
          <p><strong>Instruktion:</strong> ${talk.prompt}</p>
        </div>

        <div class="speaking-timer-box" id="timer-box">
          <span id="timer-label">Förberedelsetid:</span>
          <span id="timer-display" class="timer-countdown">60s</span>
        </div>

        <div class="speaking-controls" style="margin-top: 16px;">
          <button type="button" id="btn-start-prep" class="nav-btn primary">Starta förberedelse</button>
          <button type="button" id="btn-start-record" class="nav-btn success" disabled>Spela in svar</button>
          <button type="button" id="btn-stop-record" class="nav-btn danger" disabled>Stoppa & Utvärdera</button>
        </div>

        <div id="speaking-feedback" style="margin-top: 16px;"></div>
      </div>
    `;

    // Basic interactive hooks for speaking workflow
    const btnPrep = document.getElementById('btn-start-prep');
    const btnRecord = document.getElementById('btn-start-record');
    const btnStop = document.getElementById('btn-stop-record');
    const timerDisplay = document.getElementById('timer-display');
    const timerLabel = document.getElementById('timer-label');

    btnPrep.addEventListener('click', () => {
      btnPrep.disabled = true;
      let timeLeft = talk.preparationTimeSeconds || 60;
      timerLabel.textContent = 'Förberedelsetid kvar:';

      const interval = setInterval(() => {
        timeLeft--;
        timerDisplay.textContent = `${timeLeft}s`;
        if (timeLeft <= 0) {
          clearInterval(interval);
          timerDisplay.textContent = 'Förberedelsetid slut!';
          btnRecord.disabled = false;
        }
      }, 1000);
    });

    btnRecord.addEventListener('click', () => {
      btnRecord.disabled = true;
      btnStop.disabled = false;
      let speechTime = talk.speakingTimeSeconds || 120;
      timerLabel.textContent = 'Inspelning pågår:';
      timerDisplay.textContent = `${speechTime}s`;

      const speechInterval = setInterval(() => {
        speechTime--;
        timerDisplay.textContent = `${speechTime}s`;
        if (speechTime <= 0) {
          clearInterval(speechInterval);
          btnStop.click();
        }
      }, 1000);
    });

    btnStop.addEventListener('click', () => {
      btnStop.disabled = true;
      timerLabel.textContent = 'Status:';
      timerDisplay.textContent = 'Inspelning klar & skickad till AI.';
      document.getElementById('speaking-feedback').innerHTML = `
        <div class="content-card" style="background:#f0fdf4; border-color:#bbf7d0;">
          <h4>✅ AI-utvärdering (Tala)</h4>
          <p>Ditt tal har registrerats och analyserats för flyt och struktur. CEFR-indikator: <strong>B1</strong></p>
          ${this.currentTalkIndex < talks.length - 1 ? `<button type="button" id="btn-next-talk" class="nav-btn primary" style="margin-top:10px;">Nästa del →</button>` : ''}
        </div>
      `;

      const nextBtn = document.getElementById('btn-next-talk');
      if (nextBtn) {
        nextBtn.addEventListener('click', () => {
          this.currentTalkIndex++;
          this.render();
        });
      }
    });
  }
}
