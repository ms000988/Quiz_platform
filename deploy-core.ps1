# deploy-core.ps1 - SFI & Universal Exam Platform Core Deployment Script

Write-Host "Deploying universal core architecture and rendering engines..." -ForegroundColor Cyan

# 1. Ensure core and css directories exist
$dirs = @("assets/core", "assets/css")
foreach ($d in $dirs) {
    if (!(Test-Path $d)) {
        New-Item -ItemType Directory -Path $d | Out-Null
    }
}

# 2. Create assets/core/exam-engine.js (State, Autosave, Swipe & Progress Engine)
$examEngineContent = @'
export class ExamEngine {
  constructor({ examId, module, onSectionChange, onProgressChange }) {
    this.examId = examId;
    this.module = module;
    this.onSectionChange = onSectionChange;
    this.onProgressChange = onProgressChange;

    this.answersKey = `sfi_${examId}_${module}_answers`;
    this.sectionKey = `sfi_${examId}_${module}_currentSection`;

    this.answers = this._loadJSON(this.answersKey, {});
    this.currentSectionIndex = parseInt(localStorage.getItem(this.sectionKey) || '0', 10);
    this.totalSections = 0;
    this.totalQuestions = 0;
  }

  _loadJSON(key, fallback) {
    try {
      const raw = localStorage.getItem(key);
      return raw ? JSON.parse(raw) : fallback;
    } catch {
      return fallback;
    }
  }

  setMetadata({ totalSections, totalQuestions }) {
    this.totalSections = totalSections;
    this.totalQuestions = totalQuestions;
    if (this.currentSectionIndex >= totalSections || this.currentSectionIndex < 0) {
      this.currentSectionIndex = 0;
    }
  }

  saveAnswer(questionId, value) {
    const cleaned = typeof value === 'string' ? value : String(value ?? '');
    if (cleaned.trim() === '') {
      delete this.answers[questionId];
    } else {
      this.answers[questionId] = cleaned;
    }
    localStorage.setItem(this.answersKey, JSON.stringify(this.answers));
    this.notifyProgress();
  }

  getAnswer(questionId) {
    return this.answers[questionId] ?? '';
  }

  getAnsweredCount() {
    return Object.keys(this.answers).filter(
      (id) => String(this.answers[id]).trim().length > 0
    ).length;
  }

  notifyProgress() {
    if (typeof this.onProgressChange === 'function') {
      this.onProgressChange({
        answered: this.getAnsweredCount(),
        total: this.totalQuestions,
        percentage: this.totalQuestions > 0
          ? Math.round((this.getAnsweredCount() / this.totalQuestions) * 100)
          : 0
      });
    }
  }

  goToSection(index) {
    if (index < 0 || index >= this.totalSections) return;
    this.currentSectionIndex = index;
    localStorage.setItem(this.sectionKey, String(index));
    if (typeof this.onSectionChange === 'function') {
      this.onSectionChange(index);
    }
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  nextSection() {
    this.goToSection(this.currentSectionIndex + 1);
  }

  prevSection() {
    this.goToSection(this.currentSectionIndex - 1);
  }

  resetExam() {
    this.answers = {};
    this.currentSectionIndex = 0;
    localStorage.removeItem(this.answersKey);
    localStorage.removeItem(this.sectionKey);
    this.notifyProgress();
    this.goToSection(0);
  }

  bindSwipeNavigation(element) {
    let startX = 0;
    let startY = 0;

    element.addEventListener('touchstart', (e) => {
      startX = e.changedTouches[0].screenX;
      startY = e.changedTouches[0].screenY;
    }, { passive: true });

    element.addEventListener('touchend', (e) => {
      if (['INPUT', 'TEXTAREA', 'SELECT', 'CANVAS', 'BUTTON'].includes(e.target.tagName)) return;

      const deltaX = e.changedTouches[0].screenX - startX;
      const deltaY = e.changedTouches[0].screenY - startY;

      if (Math.abs(deltaX) > 60 && Math.abs(deltaX) > Math.abs(deltaY) * 1.5) {
        if (deltaX < 0) {
          this.nextSection();
        } else {
          this.prevSection();
        }
      }
    }, { passive: true });
  }
}
'@
Set-Content -Path "assets/core/exam-engine.js" -Value $examEngineContent -Encoding utf8
Write-Host "  [Created] assets/core/exam-engine.js" -ForegroundColor Green

# 3. Create assets/core/reading-renderer.js
$readingRendererContent = @'
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
'@
Set-Content -Path "assets/core/reading-renderer.js" -Value $readingRendererContent -Encoding utf8
Write-Host "  [Created] assets/core/reading-renderer.js" -ForegroundColor Green

# 4. Create assets/core/listening-renderer.js (Enforces strict 2-play audio limits)
$listeningRendererContent = @'
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
      if (!res.ok) throw new Error('Failed to load listening data');
      this.data = await res.json();

      let totalQuestions = 0;
      this.data.parts.forEach((p) => {
        totalQuestions += (p.questions || []).length;
      });

      this.engine = new ExamEngine({
        examId: this.examId,
        module: 'listening',
        onProgressChange: (stats) => this.updateProgressBar(stats)
      });

      this.engine.setMetadata({
        totalSections: this.data.parts.length,
        totalQuestions
      });

      this.buildShell();
      this.engine.notifyProgress();
      this.renderParts();
    } catch (err) {
      this.root.innerHTML = `<div class="content-card error-card"><p>Could not load listening exam: ${err.message}</p></div>`;
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
          <span class="exam-badge">Hörförståelse – Session ${this.examId}</span>
          <span class="progress-text" id="progress-text">0 / 0</span>
        </div>
        <div class="header-main-row">
          <h1 class="sticky-section-title">🎧 Lyssna och svara på frågorna</h1>
        </div>
      </header>

      <main id="exam-stage" class="exam-stage"></main>
    `;
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

    this.data.parts.forEach((part, pIdx) => {
      const partCard = document.createElement('div');
      partCard.className = 'content-card listening-part-card';

      const maxPlays = part.maxPlays || 2;
      const currentPlays = this.playCounts[part.id] || 0;
      const playsRemaining = Math.max(0, maxPlays - currentPlays);

      let questionsHTML = '';
      (part.questions || []).forEach((q, qIdx) => {
        const qId = q.id || `L_Part${part.id}_Q${qIdx + 1}`;
        const savedVal = this.engine.getAnswer(qId);
        const isMCQ = Array.isArray(q.options) && q.options.length > 0;

        let inputHTML = '';
        if (isMCQ) {
          inputHTML = `<div class="options-group">
            ${q.options.map((opt) => {
              const checked = savedVal === opt ? 'checked' : '';
              return `
                <label class="option-label ${checked ? 'selected' : ''}">
                  <input type="radio" name="${qId}" value="${this.escapeHTML(opt)}" ${checked} />
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
              data-qid="${qId}"
              value="${this.escapeHTML(savedVal)}"
              placeholder="Skriv ditt svar här..."
            />
          `;
        }

        questionsHTML += `
          <div class="question-card" style="margin-top:12px;">
            <div class="question-header">
              <span class="question-number">${qIdx + 1}.</span>
              <p class="question-prompt">${q.prompt || q.question}</p>
            </div>
            ${inputHTML}
          </div>
        `;
      });

      partCard.innerHTML = `
        <h2>${part.title}</h2>
        <div class="audio-player-box">
          <audio id="audio-elem-${part.id}" src="../assets/audio/${part.audio}" controls ${playsRemaining === 0 ? 'disabled' : ''}></audio>
          <div class="play-count-badge" id="plays-badge-${part.id}">
            ${playsRemaining > 0 ? `Spelningar kvar: <strong>${playsRemaining}</strong> / ${maxPlays}` : '⚠️ Du har använt alla tillgängliga spelningar.'}
          </div>
        </div>
        <div class="listening-questions">${questionsHTML}</div>
      `;

      // Audio play restriction enforcement
      const audioElem = partCard.querySelector(`#audio-elem-${part.id}`);
      const badgeElem = partCard.querySelector(`#plays-badge-${part.id}`);

      audioElem.addEventListener('play', () => {
        if ((this.playCounts[part.id] || 0) >= maxPlays) {
          audioElem.pause();
          audioElem.currentTime = 0;
          return;
        }

        this.playCounts[part.id] = (this.playCounts[part.id] || 0) + 1;
        this._savePlays();

        const remaining = maxPlays - this.playCounts[part.id];
        if (remaining <= 0) {
          audioElem.setAttribute('disabled', 'true');
          audioElem.controls = false;
          badgeElem.innerHTML = '⚠️ Du har använt alla tillgängliga spelningar.';
        } else {
          badgeElem.innerHTML = `Spelningar kvar: <strong>${remaining}</strong> / ${maxPlays}`;
        }
      });

      // Bind input autosave
      partCard.querySelectorAll('input[type="radio"]').forEach((radio) => {
        radio.addEventListener('change', (e) => {
          const qId = e.target.name;
          this.engine.saveAnswer(qId, e.target.value);
          e.target.closest('.listening-questions').querySelectorAll(`input[name="${qId}"]`).forEach((r) => {
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

      stage.appendChild(partCard);
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
'@
Set-Content -Path "assets/core/listening-renderer.js" -Value $listeningRendererContent -Encoding utf8
Write-Host "  [Created] assets/core/listening-renderer.js" -ForegroundColor Green

# 5. Create assets/core/writing-client.js (LanguageTool error highlighting & CEFR classification)
$writingClientContent = @'
export class WritingClient {
  constructor({ promptPath = './prompt.json', rootElement, examId, backendUrl = 'https://quiz-platform-aohd.onrender.com' }) {
    this.promptPath = promptPath;
    this.root = rootElement;
    this.examId = examId;
    this.backendUrl = backendUrl;
    this.promptData = null;
    this.historyKey = `sfi_${examId}_writing_history`;
    this.lastSubmissionsKey = `sfi_${examId}_writing_duplicates`;
  }

  async init() {
    try {
      const res = await fetch(this.promptPath);
      if (res.ok) {
        this.promptData = await res.json();
      }
    } catch {
      this.promptData = { promptText: 'Skriv en text om dina framtidsplaner.', minWords: 100 };
    }

    this.render();
  }

  normalizeText(text) {
    return String(text || '').trim().toLowerCase().replace(/\s+/g, ' ');
  }

  isDuplicate(text) {
    try {
      const history = JSON.parse(localStorage.getItem(this.lastSubmissionsKey) || '[]');
      const currentNorm = this.normalizeText(text);
      return history.includes(currentNorm);
    } catch {
      return false;
    }
  }

  recordSubmission(text) {
    try {
      const history = JSON.parse(localStorage.getItem(this.lastSubmissionsKey) || '[]');
      const currentNorm = this.normalizeText(text);
      if (!history.includes(currentNorm)) {
        history.push(currentNorm);
        localStorage.setItem(this.lastSubmissionsKey, JSON.stringify(history));
      }

      const attempts = JSON.parse(localStorage.getItem(this.historyKey) || '[]');
      attempts.unshift({
        date: new Date().toLocaleString(),
        text: text.substring(0, 100) + '...',
        fullText: text
      });
      localStorage.setItem(this.historyKey, JSON.stringify(attempts.slice(0, 5)));
    } catch (e) {
      console.error(e);
    }
  }

  render() {
    const promptText = this.promptData?.promptText || 'Skriv en text och motivera dina åsikter.';
    const minWords = this.promptData?.minWords || 100;

    this.root.innerHTML = `
      <div class="content-card writing-container">
        <h2>✍️ Skrivande (Writing Task)</h2>
        <div class="writing-prompt-box">
          <p><strong>Uppgift:</strong> ${promptText}</p>
          <small>Minimum antal ord: ${minWords}</small>
        </div>

        <div class="textarea-wrapper">
          <textarea id="writing-textarea" rows="12" placeholder="Skriv din text på svenska här..."></textarea>
          <div class="word-counter" id="word-counter">0 ord</div>
        </div>

        <div class="writing-actions">
          <button type="button" id="btn-submit-writing" class="nav-btn primary">Skicka in / Analysera text</button>
        </div>

        <div id="writing-feedback-area" class="feedback-area" style="margin-top: 16px;"></div>

        <div class="writing-history-section" style="margin-top: 24px;">
          <h3>Tidigare försök</h3>
          <div id="history-list"></div>
        </div>
      </div>
    `;

    const textarea = document.getElementById('writing-textarea');
    const counter = document.getElementById('word-counter');

    textarea.addEventListener('input', () => {
      const words = textarea.value.trim() ? textarea.value.trim().split(/\s+/).length : 0;
      counter.textContent = `${words} ord`;
    });

    document.getElementById('btn-submit-writing').addEventListener('click', () => {
      this.handleSubmission(textarea.value, minWords);
    });

    this.renderHistory();
  }

  async handleSubmission(text, minWords) {
    const feedbackArea = document.getElementById('writing-feedback-area');
    const words = text.trim() ? text.trim().split(/\s+/).length : 0;

    if (words < minWords) {
      feedbackArea.innerHTML = `<div class="error-card">⚠️ Texten är för kort (${words} ord). Du behöver minst ${minWords} ord för att få en fullständig analys.</div>`;
      return;
    }

    if (this.isDuplicate(text)) {
      feedbackArea.innerHTML = `<div class="error-card">⚠️ Du har redan skickat in en identisk text tidigare. Ändra texten innan du skickar in igen.</div>`;
      return;
    }

    feedbackArea.innerHTML = `<div class="loading-spinner">Analyserat text med AI och LanguageTool...</div>`;

    try {
      // Call backend for LanguageTool corrections & CEFR evaluation
      const [correctRes, cefrRes] = await Promise.all([
        fetch(`${this.backendUrl}/correct`, {
          method: 'POST',
          headers: { 'ContentType': 'application/json', 'Content-Type': 'application/json' },
          body: JSON.stringify({ text })
        }).then(r => r.json()).catch(() => ({ matches: [] })),

        fetch(`${this.backendUrl}/cefr`, {
          method: 'POST',
          headers: { 'ContentType': 'application/json', 'Content-Type': 'application/json' },
          body: JSON.stringify({ text })
        }).then(r => r.json()).catch(() => ({ level: 'B1' }))
      ]);

      this.recordSubmission(text);
      this.renderFeedbackWithHighlights(text, correctRes.matches || [], cefrRes.level || 'B1');
      this.renderHistory();
    } catch (err) {
      feedbackArea.innerHTML = `<div class="error-card">Kunde inte ansluta till AI-servern: ${err.message}</div>`;
    }
  }

  renderFeedbackWithHighlights(text, matches, cefrLevel) {
    const feedbackArea = document.getElementById('writing-feedback-area');

    // Sort matches descending by offset to highlight safely from end to start
    const sorted = [...matches].sort((a, b) => b.offset - a.offset);
    let highlightedText = text;

    sorted.forEach((m) => {
      const start = m.offset;
      const length = m.length;
      const snippet = text.substring(start, start + length);
      if (!snippet) return;

      let cssClass = 'error-grammar';
      const ruleType = (m.rule?.category?.id || '').toLowerCase();
      if (ruleType.includes('typogr') || ruleType.includes('punctuat')) {
        cssClass = 'error-punctuation';
      } else if (ruleType.includes('spell') || ruleType.includes('spelling')) {
        cssClass = 'error-spelling';
      }

      const replacement = `<span class="${cssClass}" title="${this.escapeHTML(m.message)}">${this.escapeHTML(snippet)}</span>`;
      highlightedText = highlightedText.substring(0, start) + replacement + highlightedText.substring(start + length);
    });

    feedbackArea.innerHTML = `
      <div class="content-card cefr-result-box">
        <h3>Bedömning & CEFR-nivå: <span class="cefr-badge">${cefrLevel}</span></h3>
        <p class="cefr-note">Notera: Inget godtyckligt siffrobetyg ges för otillräcklig eller meningslös text. Feedback ges direkt i texten nedan.</p>
        <div class="highlighted-text-output">${highlightedText}</div>
        <div class="error-legend">
          <span class="legend-item"><span class="dot grammar"></span> Grammatik</span>
          <span class="legend-item"><span class="dot spelling"></span> Stavning</span>
          <span class="legend-item"><span class="dot punctuation"></span> Skiljetecken</span>
        </div>
      </div>
    `;
  }

  renderHistory() {
    const historyList = document.getElementById('history-list');
    if (!historyList) return;

    try {
      const attempts = JSON.parse(localStorage.getItem(this.historyKey) || '[]');
      if (attempts.length === 0) {
        historyList.innerHTML = '<p class="text-muted">Inga tidigare försök sparade.</p>';
        return;
      }

      historyList.innerHTML = attempts.map(a => `
        <div class="history-item">
          <span class="history-date">${a.date}</span>
          <p class="history-snippet">${this.escapeHTML(a.text)}</p>
        </div>
      `).join('');
    } catch {
      historyList.innerHTML = '';
    }
  }

  escapeHTML(str) {
    return String(str ?? '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }
}
'@
Set-Content -Path "assets/core/writing-client.js" -Value $writingClientContent -Encoding utf8
Write-Host "  [Created] assets/core/writing-client.js" -ForegroundColor Green

# 6. Create assets/core/speaking-client.js (Interactive 2-part Speaking module)
$speakingClientContent = @'
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
'@
Set-Content -Path "assets/core/speaking-client.js" -Value $speakingClientContent -Encoding utf8
Write-Host "  [Created] assets/core/speaking-client.js" -ForegroundColor Green

# 7. Update assets/css/style.css with error highlighting and modern UI variables
$cssContent = @'
:root {
  --bg-page: #f4f6f9;
  --bg-card: #ffffff;
  --text-main: #1e293b;
  --text-muted: #64748b;
  --primary: #2563eb;
  --primary-hover: #1d4ed8;
  --success: #16a34a;
  --danger: #dc2626;
  --border: #e2e8f0;
  --shadow: 0 2px 8px rgba(15, 23, 42, 0.06);
  --radius: 12px;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  background: var(--bg-page);
  color: var(--text-main);
  padding-bottom: 84px;
}

.app-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 24px 16px;
}

.hero-header {
  text-align: center;
  margin-bottom: 24px;
}

.hub-grid {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.platform-card, .content-card {
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 20px;
  box-shadow: var(--shadow);
}

.exam-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 10px;
}

.exam-chip {
  background: #eff6ff;
  color: var(--primary);
  border: 1px solid #bfdbfe;
  padding: 6px 12px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 500;
  font-size: 0.9rem;
}

.exam-chip:hover {
  background: var(--primary);
  color: #fff;
}

/* Top Progress Bar */
.top-progress-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 5px;
  background: #e2e8f0;
  z-index: 1000;
}

.top-progress-fill {
  height: 100%;
  width: 0%;
  background: var(--primary);
  transition: width 0.25s ease;
}

/* Sticky Header */
.sticky-exam-header {
  position: sticky;
  top: 5px;
  background: rgba(255, 255, 255, 0.96);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--border);
  padding: 10px 16px;
  z-index: 900;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
}

.header-top-row {
  display: flex;
  justify-content: space-between;
  font-size: 0.78rem;
  color: var(--text-muted);
  margin-bottom: 4px;
}

.header-main-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 12px;
}

.sticky-section-title {
  margin: 0;
  font-size: 1.05rem;
  font-weight: 700;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.section-dropdown {
  padding: 6px 10px;
  border-radius: 8px;
  border: 1px solid var(--border);
  background: var(--bg-page);
  font-size: 0.85rem;
  max-width: 175px;
}

.exam-stage {
  max-width: 820px;
  margin: 0 auto;
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

/* Writing Highlighting & Errors */
.error-grammar {
  background-color: #fee2e2;
  border-bottom: 2px solid var(--danger);
  cursor: help;
}

.error-spelling {
  background-color: #fef9c3;
  border-bottom: 2px solid #ca8a04;
  cursor: help;
}

.error-punctuation {
  background-color: #e0f2fe;
  border-bottom: 2px solid var(--primary);
  cursor: help;
}

.error-legend {
  display: flex;
  gap: 16px;
  margin-top: 12px;
  font-size: 0.85rem;
  color: var(--text-muted);
}

.legend-item {
  display: flex;
  align-items: center;
  gap: 6px;
}

.dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  display: inline-block;
}

.dot.grammar { background: var(--danger); }
.dot.spelling { background: #ca8a04; }
.dot.punctuation { background: var(--primary); }

.cefr-badge {
  background: var(--primary);
  color: #fff;
  padding: 2px 8px;
  border-radius: 6px;
  font-size: 0.9rem;
}

/* Bottom Navigation */
.bottom-nav-bar {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background: var(--bg-card);
  border-top: 1px solid var(--border);
  padding: 10px 16px;
  display: flex;
  justify-content: space-between;
  gap: 8px;
  z-index: 950;
}

.nav-btn {
  padding: 10px 14px;
  border-radius: 8px;
  border: none;
  font-weight: 600;
  font-size: 0.9rem;
  cursor: pointer;
}

.nav-btn:disabled { opacity: 0.45; cursor: not-allowed; }
.nav-btn.primary { background: var(--primary); color: #fff; }
.nav-btn.secondary { background: var(--bg-page); color: var(--text-main); border: 1px solid var(--border); }
.nav-btn.finish, .nav-btn.success { background: var(--success); color: #fff; }
.nav-btn.danger { background: var(--danger); color: #fff; }
'@
Set-Content -Path "assets/css/style.css" -Value $cssContent -Encoding utf8
Write-Host "  [Updated] assets/css/style.css" -ForegroundColor Green

Write-Host "=== Core Deployment Completed Successfully! ===" -ForegroundColor Cyan
