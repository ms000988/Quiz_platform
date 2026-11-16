import { ExamEngine } from './exam-engine.js';

const DEFAULT_ICONS = {
  A: '🛒', B: '📔', C: '👨‍👩‍👧‍👦', D: '📊',
  E: '🚗', F: '🍦', G: '📱', H: '🏛️'
};

export class ReadingRenderer {
  constructor({ configPath = './config.json', rootElement, examId }) {
    this.configPath = configPath;
    this.root = rootElement;
    this.examId = examId;
    this.config = null;
    this.sections = [];
    this.activeCharts = [];
    this.isReviewMode = false;
    this.isSummaryView = false;
    this.engine = null;
  }

  async init() {
    try {
      const configRes = await fetch(this.configPath);
      if (!configRes.ok) throw new Error(`Failed to load ${this.configPath}`);
      this.config = await configRes.json();

      const sectionPromises = this.config.sections.map(async (file) => {
        const res = await fetch(`./${file}`);
        if (!res.ok) throw new Error(`Failed to load section ${file}`);
        const data = await res.json();
        data.questions = (data.questions || []).map((q, idx) => ({
          ...q,
          id: q.id || `${data.section}_Q${idx + 1}`
        }));
        return data;
      });

      this.sections = await Promise.all(sectionPromises);

      const totalQuestions = this.sections.reduce(
        (sum, sec) => sum + sec.questions.length, 0
      );

      this.engine = new ExamEngine({
        examId: this.examId,
        module: 'reading',
        onSectionChange: () => {
          this.isSummaryView = false;
          this.renderCurrentSection();
        },
        onProgressChange: (stats) => this.updateProgressBar(stats)
      });

      this.engine.setMetadata({
        totalSections: this.sections.length,
        totalQuestions
      });

      this.buildShell();
      this.engine.bindSwipeNavigation(this.root);
      this.engine.notifyProgress();
      this.renderCurrentSection();
    } catch (err) {
      this.root.innerHTML = `<div class="content-card error-card"><p>Could not load reading exam data: ${err.message}</p></div>`;
      console.error(err);
    }
  }

  getIcon(sectionObj) {
    return sectionObj.icon || DEFAULT_ICONS[sectionObj.section] || '📄';
  }

  buildShell() {
    const dropdownOptions = this.sections
      .map((sec, idx) => {
        const icon = this.getIcon(sec);
        return `<option value="${idx}">${icon} Section ${sec.section} – ${sec.title}</option>`;
      })
      .join('');

    this.root.innerHTML = `
      <div class="top-progress-container" role="progressbar">
        <div class="top-progress-fill" id="progress-fill"></div>
      </div>

      <header class="sticky-exam-header">
        <div class="header-top-row">
          <span class="exam-badge">${this.config.title || `Reading ${this.examId}`}</span>
          <span class="progress-text" id="progress-text">0 / 0</span>
        </div>
        <div class="header-main-row">
          <h1 class="sticky-section-title" id="sticky-title"></h1>
          <select id="section-jump-select" class="section-dropdown" aria-label="Jump to section">
            ${dropdownOptions}
          </select>
        </div>
      </header>

      <main id="exam-stage" class="exam-stage"></main>

      <footer class="bottom-nav-bar" id="bottom-nav">
        <button type="button" id="btn-prev" class="nav-btn secondary">← Previous</button>
        <button type="button" id="btn-finish" class="nav-btn finish">Finish Exam</button>
        <button type="button" id="btn-next" class="nav-btn primary">Next →</button>
      </footer>
    `;

    document.getElementById('section-jump-select').addEventListener('change', (e) => {
      this.engine.goToSection(Number(e.target.value));
    });

    document.getElementById('btn-prev').addEventListener('click', () => this.engine.prevSection());
    document.getElementById('btn-next').addEventListener('click', () => this.engine.nextSection());
    document.getElementById('btn-finish').addEventListener('click', () => this.renderSummaryPage());
  }

  updateProgressBar({ answered, total, percentage }) {
    const fill = document.getElementById('progress-fill');
    const text = document.getElementById('progress-text');
    if (fill) fill.style.width = `${percentage}%`;
    if (text) text.textContent = `${answered} / ${total} answered`;
  }

  destroyCharts() {
    this.activeCharts.forEach((chart) => chart.destroy());
    this.activeCharts = [];
  }

  renderCurrentSection() {
    this.destroyCharts();
    const idx = this.engine.currentSectionIndex;
    const sec = this.sections[idx];
    const icon = this.getIcon(sec);

    document.getElementById('sticky-title').textContent = `${icon} ${sec.section} – ${sec.title}`;
    document.getElementById('section-jump-select').value = String(idx);

    const bottomNav = document.getElementById('bottom-nav');
    bottomNav.style.display = 'flex';
    document.getElementById('btn-prev').disabled = idx === 0;
    document.getElementById('btn-next').disabled = idx === this.sections.length - 1;

    const stage = document.getElementById('exam-stage');
    stage.innerHTML = '';

    if (this.isReviewMode) {
      const banner = document.createElement('div');
      banner.className = 'review-banner';
      banner.innerHTML = `
        <span>Review Mode Active</span>
        <button type="button" id="btn-back-summary" class="nav-btn small">Back to Summary</button>
      `;
      stage.appendChild(banner);
      banner.querySelector('#btn-back-summary').addEventListener('click', () => this.renderSummaryPage());
    }

    if (sec.instructions) {
      const inst = document.createElement('p');
      inst.className = 'section-instructions';
      inst.textContent = sec.instructions;
      stage.appendChild(inst);
    }

    if (sec.texts && sec.texts.length > 0) {
      const textsContainer = document.createElement('div');
      textsContainer.className = 'texts-grid';
      sec.texts.forEach((item) => {
        const card = document.createElement('article');
        card.className = 'content-card text-card';
        if (typeof item === 'string') {
          card.innerHTML = `<p>${item}</p>`;
        } else {
          const heading = item.heading || item.author || item.title || '';
          const meta = item.meta || item.date || '';
          const body = item.body || item.content || item.text || '';
          card.innerHTML = `
            ${heading ? `<h3 class="text-card-title">${heading}</h3>` : ''}
            ${meta ? `<div class="text-card-meta">${meta}</div>` : ''}
            <div class="text-card-body">${body}</div>
          `;
        }
        textsContainer.appendChild(card);
      });
      stage.appendChild(textsContainer);
    }

    if (sec.charts && sec.charts.length > 0) {
      const chartsContainer = document.createElement('div');
      chartsContainer.className = 'charts-grid';
      sec.charts.forEach((chartCfg, cIdx) => {
        const card = document.createElement('div');
        card.className = 'content-card chart-card';
        const canvasId = `chart-${sec.section}-${cIdx}`;
        card.innerHTML = `
          ${chartCfg.title ? `<h3 class="chart-title">${chartCfg.title}</h3>` : ''}
          <div class="chart-wrapper"><canvas id="${canvasId}"></canvas></div>
        `;
        chartsContainer.appendChild(card);

        requestAnimationFrame(() => {
          const ctx = document.getElementById(canvasId);
          if (ctx && window.Chart) {
            const instance = new window.Chart(ctx, {
              type: chartCfg.type || 'bar',
              data: chartCfg.data,
              options: {
                responsive: true,
                maintainAspectRatio: false,
                ...(chartCfg.options || {})
              }
            });
            this.activeCharts.push(instance);
          }
        });
      });
      stage.appendChild(chartsContainer);
    }

    const questionsContainer = document.createElement('div');
    questionsContainer.className = 'questions-list';

    sec.questions.forEach((q, qIdx) => {
      const savedVal = this.engine.getAnswer(q.id);
      const isCorrect = this.evaluateQuestion(q, savedVal);
      const qCard = document.createElement('div');
      qCard.className = 'content-card question-card';

      if (this.isReviewMode) {
        qCard.classList.add(isCorrect ? 'review-correct' : 'review-incorrect');
      }

      const isMCQ = Array.isArray(q.options) && q.options.length > 0;
      let inputHTML = '';

      if (isMCQ) {
        inputHTML = `<div class="options-group">
          ${q.options.map((opt) => {
            const checked = savedVal === opt ? 'checked' : '';
            const disabled = this.isReviewMode ? 'disabled' : '';
            return `
              <label class="option-label ${checked ? 'selected' : ''}">
                <input type="radio" name="${q.id}" value="${this.escapeHTML(opt)}" ${checked} ${disabled} />
                <span>${opt}</span>
              </label>
            `;
          }).join('')}
        </div>`;
      } else {
        const disabled = this.isReviewMode ? 'disabled' : '';
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

      const reviewFeedbackHTML = this.isReviewMode
        ? `<div class="review-feedback">
             ${isCorrect
               ? '✅ Rätt svar!'
               : `❌ Ditt svar: <strong>${this.escapeHTML(savedVal || '(Inget svar)')}</strong> | Rätt svar: <strong>${this.escapeHTML(q.answer)}</strong>`
             }
           </div>`
        : '';

      qCard.innerHTML = `
        <div class="question-header">
          <span class="question-number">${qIdx + 1}.</span>
          <p class="question-prompt">${q.prompt || q.question}</p>
        </div>
        ${inputHTML}
        ${reviewFeedbackHTML}
      `;

      if (!this.isReviewMode) {
        if (isMCQ) {
          qCard.querySelectorAll('input[type="radio"]').forEach((radio) => {
            radio.addEventListener('change', (e) => {
              this.engine.saveAnswer(q.id, e.target.value);
              qCard.querySelectorAll('.option-label').forEach((lbl) => lbl.classList.remove('selected'));
              e.target.closest('.option-label').classList.add('selected');
            });
          });
        } else {
          const textInput = qCard.querySelector('.short-answer-input');
          textInput.addEventListener('input', (e) => {
            this.engine.saveAnswer(q.id, e.target.value);
          });
        }
      }

      questionsContainer.appendChild(qCard);
    });

    stage.appendChild(questionsContainer);
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
    this.destroyCharts();
    this.isSummaryView = true;
    this.isReviewMode = false;

    document.getElementById('sticky-title').textContent = '📋 Exam Summary';
    document.getElementById('bottom-nav').style.display = 'none';

    let totalScore = 0;
    let totalMax = 0;

    const sectionRowsHTML = this.sections.map((sec, idx) => {
      let secScore = 0;
      sec.questions.forEach((q) => {
        if (this.evaluateQuestion(q, this.engine.getAnswer(q.id))) {
          secScore++;
        }
      });
      const secMax = sec.questions.length;
      totalScore += secScore;
      totalMax += secMax;

      const icon = this.getIcon(sec);
      return `
        <div class="summary-section-row">
          <div class="summary-sec-info">
            <span class="summary-icon">${icon}</span>
            <div>
              <strong>Section ${sec.section}: ${sec.title}</strong>
              <div class="summary-score-badge">${secScore} / ${secMax}</div>
            </div>
          </div>
          <button type="button" class="nav-btn secondary review-sec-btn" data-sec-idx="${idx}">
            Review Section
          </button>
        </div>
      `;
    }).join('');

    const percentage = totalMax > 0 ? Math.round((totalScore / totalMax) * 100) : 0;
    const passThreshold = (this.config.passThreshold ?? 0.6) * 100;
    const passed = percentage >= passThreshold;

    const stage = document.getElementById('exam-stage');
    stage.innerHTML = `
      <div class="content-card summary-hero ${passed ? 'status-pass' : 'status-fail'}">
        <h2>${passed ? '🎉 Godkänt (Passed)' : '📚 Ej godkänt (Keep Practicing)'}</h2>
        <div class="total-score-display">${totalScore} / ${totalMax}</div>
        <div class="percentage-display">${percentage}% (Pass requirement: ${passThreshold}%)</div>
      </div>

      <div class="summary-breakdown">
        ${sectionRowsHTML}
      </div>

      <div class="summary-actions">
        <button type="button" id="btn-continue-exam" class="nav-btn secondary">← Return to Exam</button>
        <button type="button" id="btn-reset-exam" class="nav-btn danger">Reset All Answers</button>
      </div>
    `;

    stage.querySelectorAll('.review-sec-btn').forEach((btn) => {
      btn.addEventListener('click', (e) => {
        const idx = Number(e.currentTarget.dataset.secIdx);
        this.isReviewMode = true;
        this.engine.goToSection(idx);
      });
    });

    document.getElementById('btn-continue-exam').addEventListener('click', () => {
      this.isReviewMode = false;
      this.renderCurrentSection();
    });

    document.getElementById('btn-reset-exam').addEventListener('click', () => {
      if (confirm('Are you sure you want to clear all saved answers for this exam?')) {
        this.isReviewMode = false;
        this.engine.resetExam();
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
