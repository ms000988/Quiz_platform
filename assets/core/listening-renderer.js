import { ExamEngine } from './exam-engine.js';

export class ListeningRenderer {
  constructor({ dataPath = './listening.json', rootElement, examId }) {
    this.dataPath = dataPath;
    this.root = rootElement;
    this.examId = examId;
    this.data = null;
    this.engine = null;
    this.playCountsKey = `sfi_${examId}_listening_plays`;
    this.playCounts = this._loadPlays();
    this.activeSessionPlayed = {}; // Tracks whether current play session already incremented count
    this.isReviewMode = false;
  }

  _loadPlays() {
    try {
      const raw = localStorage.getItem(this.playCountsKey);
      return raw ? JSON.parse(raw) : {};
    } catch {
      return {};
    }
  }

  _savePlays() {
    localStorage.setItem(this.playCountsKey, JSON.stringify(this.playCounts));
  }

  async init() {
    try {
      const res = await fetch(this.dataPath);
      if (!res.ok) throw new Error(`Failed to load ${this.dataPath}`);
      this.data = await res.json();

      let totalQuestions = 0;
      (this.data.parts || []).forEach((part, pIdx) => {
        part.id = part.id ?? pIdx + 1;
        part.questions = (part.questions || []).map((q, qIdx) => ({
          ...q,
          id: q.id || `L_Part${part.id}_Q${qIdx + 1}`
        }));
        totalQuestions += part.questions.length;
      });

      this.engine = new ExamEngine({
        examId: this.examId,
        module: 'listening',
        onProgressChange: (stats) => this.updateProgressBar(stats)
      });

      this.engine.setMetadata({
        totalSections: (this.data.parts || []).length,
        totalQuestions
      });

      this.buildShell();
      this.engine.notifyProgress();
      this.renderParts();
    } catch (err) {
      this.root.innerHTML = `<div class="exam-stage"><div class="content-card error-card"><p>Could not load listening exam: ${err.message}</p></div></div>`;
      console.error(err);
    }
  }

  buildShell() {
    this.root.innerHTML = `
      <div class="top-progress-container" role="progressbar">
        <div class="top-progress-fill" id="progress-fill"></div>
      </div>

      <header class="sticky-exam-header">
        <div class="header-top-row">
          <span class="exam-badge">🎧 Hörförståelse – ${this.examId}</span>
          <span class="progress-text" id="progress-text">0 / 0</span>
        </div>
        <div class="header-main-row">
          <h1 class="sticky-section-title">Lyssna och svara på frågorna</h1>
          <a href="../index.html" class="nav-btn secondary" style="padding: 6px 10px; font-size: 0.82rem;">← Delprov</a>
        </div>
      </header>

      <main id="exam-stage" class="exam-stage"></main>

      <footer class="bottom-nav-bar" id="bottom-nav">
        <a href="../index.html" class="nav-btn secondary">← Tillbaka</a>
        <button type="button" id="btn-finish-listening" class="nav-btn finish">✔ Rätta provet</button>
      </footer>
    `;

    document.getElementById('btn-finish-listening').addEventListener('click', () => {
      this.renderSummaryPage();
    });
  }

  updateProgressBar({ answered, total, percentage }) {
    const fill = document.getElementById('progress-fill');
    const text = document.getElementById('progress-text');
    if (fill) fill.style.width = `${percentage}%`;
    if (text) text.textContent = `${answered} / ${total} answered`;
  }

  renderParts() {
    const stage = document.getElementById('exam-stage');
    stage.innerHTML = '';
    document.getElementById('bottom-nav').style.display = 'flex';

    if (this.isReviewMode) {
      const banner = document.createElement('div');
      banner.className = 'review-banner';
      banner.innerHTML = `
        <span>Granskningsläge (Review Mode)</span>
        <button type="button" id="btn-back-summary" class="nav-btn primary" style="padding: 6px 12px; font-size: 0.85rem;">Tillbaka till resultat</button>
      `;
      stage.appendChild(banner);
      banner.querySelector('#btn-back-summary').addEventListener('click', () => this.renderSummaryPage());
    }

    const parts = this.data.parts || [];
    if (parts.length === 0) {
      stage.innerHTML += `<div class="content-card"><p>Inga hörförståelsedelar har lagts till i <code>listening.json</code> ännu.</p></div>`;
      return;
    }

    parts.forEach((part) => {
      const partCard = document.createElement('section');
      partCard.className = 'content-card listening-part-card';

      const maxPlays = part.maxPlays || 2;
      const currentPlays = this.playCounts[part.id] || 0;
      const playsRemaining = Math.max(0, maxPlays - currentPlays);
      const isLocked = playsRemaining === 0 && !this.isReviewMode;

      let questionsHTML = '';
      if (part.questions.length === 0) {
        questionsHTML = `<p style="color: var(--text-muted); margin-top: 12px;">Inga frågor har lagts till för denna del ännu.</p>`;
      } else {
        part.questions.forEach((q, qIdx) => {
          const savedVal = this.engine.getAnswer(q.id);
          const isCorrect = this.evaluateQuestion(q, savedVal);
          const isMCQ = Array.isArray(q.options) && q.options.length > 0;
          const disabled = this.isReviewMode ? 'disabled' : '';

          let inputHTML = '';
          if (isMCQ) {
            inputHTML = `<div class="options-group">
              ${q.options.map((opt) => {
                const checked = savedVal === opt ? 'checked' : '';
                return `
                  <label class="option-label ${checked ? 'selected' : ''}">
                    <input type="radio" name="${q.id}" value="${this.escapeHTML(opt)}" ${checked} ${disabled} />
                    <span>${opt}</span>
                  </label>
                `;
              }).join('')}
            </div>`;
          } else {
            inputHTML = `
              <input
                type="text"
                class="short-answer-input"
                data-qid="${q.id}"
                value="${this.escapeHTML(savedVal)}"
                placeholder="Skriv ditt svar här..."
                ${disabled}
              />
            `;
          }

          const reviewClass = this.isReviewMode ? (isCorrect ? 'review-correct' : 'review-incorrect') : '';
          const reviewFeedback = this.isReviewMode && q.answer !== undefined
            ? `<div class="review-feedback">
                 ${isCorrect
                   ? '✅ Rätt svar!'
                   : `❌ Ditt svar: <strong>${this.escapeHTML(savedVal || '(Inget svar)')}</strong> | Rätt svar: <strong>${this.escapeHTML(q.answer)}</strong>`}
               </div>`
            : '';

          questionsHTML += `
            <div class="content-card question-card ${reviewClass}" style="margin-top: 14px; box-shadow: none;">
              <div class="question-header">
                <span class="question-number">${qIdx + 1}.</span>
                <p class="question-prompt">${q.prompt || q.question}</p>
              </div>
              ${inputHTML}
              ${reviewFeedback}
            </div>
          `;
        });
      }

      partCard.innerHTML = `
        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 8px; margin-bottom: 12px;">
          <h2 style="margin: 0; font-size: 1.2rem;">${part.title}</h2>
          <span class="play-count-badge" id="plays-badge-${part.id}" style="font-size: 0.85rem; padding: 4px 10px; border-radius: 6px; background: #eff6ff; color: var(--primary); font-weight: 600;">
            ${isLocked
              ? '⚠️ You have used all available plays.'
              : `Spelningar kvar: <strong>${playsRemaining}</strong> / ${maxPlays}`}
          </span>
        </div>

        <div class="audio-player-box" style="background: var(--bg-page); padding: 12px; border-radius: 8px; border: 1px solid var(--border);">
          <audio id="audio-elem-${part.id}" src="../assets/audio/${part.audio}" controls style="width: 100%;" ${isLocked ? 'disabled' : ''}></audio>
        </div>

        <div class="listening-questions">${questionsHTML}</div>
      `;

      const audioElem = partCard.querySelector(`#audio-elem-${part.id}`);
      const badgeElem = partCard.querySelector(`#plays-badge-${part.id}`);

      if (isLocked) {
        audioElem.controls = false;
      }

      // Count 1 play per playthrough (allows pause/resume during the same play, locks once ended or max reached)
      audioElem.addEventListener('play', () => {
        if (this.isReviewMode) return;

        if ((this.playCounts[part.id] || 0) >= maxPlays && !this.activeSessionPlayed[part.id]) {
          audioElem.pause();
          audioElem.currentTime = 0;
          return;
        }

        if (!this.activeSessionPlayed[part.id]) {
          this.activeSessionPlayed[part.id] = true;
          this.playCounts[part.id] = (this.playCounts[part.id] || 0) + 1;
          this._savePlays();

          const remaining = Math.max(0, maxPlays - this.playCounts[part.id]);
          badgeElem.innerHTML = remaining > 0
            ? `Spelningar kvar: <strong>${remaining}</strong> / ${maxPlays}`
            : '⚠️ Sista spelningen pågår...';
        }
      });

      audioElem.addEventListener('ended', () => {
        this.activeSessionPlayed[part.id] = false;
        const remaining = Math.max(0, maxPlays - (this.playCounts[part.id] || 0));
        if (remaining <= 0 && !this.isReviewMode) {
          audioElem.setAttribute('disabled', 'true');
          audioElem.controls = false;
          badgeElem.style.background = '#fef2f2';
          badgeElem.style.color = 'var(--danger)';
          badgeElem.innerHTML = '⚠️ You have used all available plays.';
        }
      });

      // Bind answer autosave
      if (!this.isReviewMode) {
        partCard.querySelectorAll('input[type="radio"]').forEach((radio) => {
          radio.addEventListener('change', (e) => {
            const qId = e.target.name;
            this.engine.saveAnswer(qId, e.target.value);
            partCard.querySelectorAll(`input[name="${qId}"]`).forEach((r) => {
              r.closest('.option-label').classList.remove('selected');
            });
            e.target.closest('.option-label').classList.add('selected');
          });
        });

        partCard.querySelectorAll('.short-answer-input').forEach((txtInput) => {
          txtInput.addEventListener('input', (e) => {
            this.engine.saveAnswer(e.target.dataset.qid, e.target.value);
          });
        });
      }

      stage.appendChild(partCard);
    });
  }

  normalize(str) {
    return String(str ?? '').trim().toLowerCase();
  }

  evaluateQuestion(question, userAnswer) {
    const cleanUser = this.normalize(userAnswer);
    if (!cleanUser) return false;

    const isMCQ = Array.isArray(question.options) && question.options.length > 0;
    if (isMCQ) {
      return userAnswer === question.answer;
    }

    const validAnswers = Array.isArray(question.acceptedAnswers)
      ? question.acceptedAnswers
      : [question.answer];

    return validAnswers.some((ans) => this.normalize(ans) === cleanUser);
  }

  renderSummaryPage() {
    this.isReviewMode = false;
    document.getElementById('bottom-nav').style.display = 'none';

    let totalScore = 0;
    let totalMax = 0;

    const rowsHTML = (this.data.parts || []).map((part) => {
      let partScore = 0;
      part.questions.forEach((q) => {
        if (this.evaluateQuestion(q, this.engine.getAnswer(q.id))) {
          partScore++;
        }
      });
      const partMax = part.questions.length;
      totalScore += partScore;
      totalMax += partMax;

      return `
        <div class="summary-section-row">
          <div class="summary-sec-info">
            <span class="summary-icon">🎧</span>
            <div>
              <strong>${part.title}</strong>
              <div class="summary-score-badge">${partScore} / ${partMax}</div>
            </div>
          </div>
        </div>
      `;
    }).join('');

    const percentage = totalMax > 0 ? Math.round((totalScore / totalMax) * 100) : 0;
    const passed = percentage >= 60;

    const stage = document.getElementById('exam-stage');
    stage.innerHTML = `
      <div class="content-card summary-hero ${passed ? 'status-pass' : 'status-fail'}">
        <h2>${passed ? '🎉 Godkänt (Passed)' : '📚 Ej godkänt (Keep Practicing)'}</h2>
        <div class="total-score-display">${totalScore} / ${totalMax}</div>
        <div class="percentage-display">${percentage}% (Krav för godkänt: 60%)</div>
      </div>

      <div class="summary-breakdown">${rowsHTML}</div>

      <div class="summary-actions" style="flex-wrap: wrap;">
        <button type="button" id="btn-review-listening" class="nav-btn primary">🔍 Granska svar</button>
        <button type="button" id="btn-back-listening" class="nav-btn secondary">← Tillbaka till provet</button>
        <button type="button" id="btn-reset-listening" class="nav-btn danger">Nollställ prov & spelningar</button>
      </div>
    `;

    document.getElementById('btn-review-listening').addEventListener('click', () => {
      this.isReviewMode = true;
      this.renderParts();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    document.getElementById('btn-back-listening').addEventListener('click', () => {
      this.isReviewMode = false;
      this.renderParts();
    });

    document.getElementById('btn-reset-listening').addEventListener('click', () => {
      if (confirm('Vill du rensa alla sparade svar och återställa ljudspelningarna?')) {
        localStorage.removeItem(this.playCountsKey);
        this.playCounts = {};
        this.activeSessionPlayed = {};
        this.isReviewMode = false;
        this.engine.resetExam();
        this.renderParts();
      }
    });
  }

  escapeHTML(str) {
    return String(str ?? '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }
}
