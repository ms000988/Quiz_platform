export class ReadingRenderer {
  constructor({ configPath = './config.json', rootElement, examId }) {
    this.configPath = configPath;
    this.root = rootElement;
    this.examId = examId;
    this.config = null;
    this.sectionsData = [];
    this.currentSectionIndex = 0;
    this.userAnswers = {};
    this.storageKey = `sfi_${examId}_reading_answers`;
  }

  async init() {
    try {
      const res = await fetch(this.configPath);
      if (!res.ok) throw new Error('Could not load config.json');
      this.config = await res.json();

      const sections = this.config.sections || [];
      const promises = sections.map(secFile =>
        fetch(secFile).then(r => r.json()).catch(() => null)
      );
      this.sectionsData = (await Promise.all(promises)).filter(Boolean);

      // Load saved answers
      try {
        const saved = localStorage.getItem(this.storageKey);
        if (saved) this.userAnswers = JSON.parse(saved);
      } catch (e) { console.error(e); }

      this.render();
    } catch (err) {
      this.root.innerHTML = `<div class="error-card">Kunde inte ladda läsprovet: ${err.message}</div>`;
    }
  }

  render() {
    if (this.sectionsData.length === 0) {
      this.root.innerHTML = `<div class="error-card">Inga sektioner hittades i detta prov.</div>`;
      return;
    }

    const currentSec = this.sectionsData[this.currentSectionIndex];
    const totalSecs = this.sectionsData.length;

    const navTabsHTML = this.sectionsData.map((s, idx) => `
      <button type="button" class="nav-btn ${idx === this.currentSectionIndex ? 'primary' : 'secondary'}" data-sec-idx="${idx}" style="padding: 6px 12px; font-size: 0.85rem;">
        ${s.icon || '📖'} ${s.section || (idx + 1)}
      </button>
    `).join('');

    const textsHTML = (currentSec.texts || []).map(t => `
      <div style="margin-bottom: 16px;">
        ${t.heading ? `<h4 style="margin: 0 0 6px 0; color: var(--primary);">${this.escapeHTML(t.heading)}</h4>` : ''}
        <p style="white-space: pre-line; line-height: 1.6; margin: 0;">${this.escapeHTML(t.body)}</p>
      </div>
    `).join('');

    const questionsHTML = (currentSec.questions || []).map((q, qIdx) => {
      const savedVal = this.userAnswers[q.id] || '';

      if (q.type === 'short') {
        return `
          <div class="question-card" style="margin-bottom: 16px; padding: 14px; background: var(--bg-card); border: 1px solid var(--border); border-radius: 8px;">
            <p style="font-weight: 600; margin: 0 0 10px 0;">${qIdx + 1}. ${this.escapeHTML(q.prompt)}</p>
            <input type="text" class="short-answer-input" data-qid="${q.id}" value="${this.escapeHTML(savedVal)}" placeholder="Skriv ditt svar här..." style="width: 100%; padding: 10px; border: 1px solid var(--border); border-radius: 6px; font-size: 0.95rem;" />
            <div class="feedback-msg" id="feedback_${q.id}" style="margin-top: 6px; font-size: 0.9rem;"></div>
          </div>
        `;
      } else {
        // MCQ
        const optionsHTML = (q.options || []).map(opt => `
          <label style="display: flex; align-items: center; gap: 8px; padding: 8px 10px; background: var(--bg-page); border: 1px solid var(--border); border-radius: 6px; cursor: pointer; margin-bottom: 6px;">
            <input type="radio" name="${q.id}" value="${this.escapeHTML(opt)}" ${savedVal === opt ? 'checked' : ''} style="accent-color: var(--primary);" />
            <span>${this.escapeHTML(opt)}</span>
          </label>
        `).join('');

        return `
          <div class="question-card" style="margin-bottom: 16px; padding: 14px; background: var(--bg-card); border: 1px solid var(--border); border-radius: 8px;">
            <p style="font-weight: 600; margin: 0 0 10px 0;">${qIdx + 1}. ${this.escapeHTML(q.prompt)}</p>
            <div style="display: flex; flex-direction: column; gap: 4px;">${optionsHTML}</div>
            <div class="feedback-msg" id="feedback_${q.id}" style="margin-top: 6px; font-size: 0.9rem;"></div>
          </div>
        `;
      }
    }).join('');

    this.root.innerHTML = `
      <header class="sticky-exam-header">
        <div class="header-top-row">
          <span class="exam-badge">📘 Läsförståelse – ${this.examId}</span>
          <span class="progress-text">Sektion ${this.currentSectionIndex + 1} av ${totalSecs}</span>
        </div>
        <div class="header-main-row" style="margin-top: 8px; display: flex; gap: 6px; flex-wrap: wrap;">
          ${navTabsHTML}
        </div>
      </header>

      <main class="exam-stage" style="max-width: 850px; margin: 20px auto; padding: 0 16px;">
        <section class="content-card" style="margin-bottom: 20px;">
          <h2 style="margin: 0 0 8px 0; font-size: 1.4rem;">${this.escapeHTML(currentSec.icon || '')} ${this.escapeHTML(currentSec.title || '')}</h2>
          <p style="color: var(--text-muted); margin: 0 0 16px 0; font-size: 0.95rem;">${this.escapeHTML(currentSec.instructions || '')}</p>

          ${textsHTML}

          <!-- Charts Container -->
          <div id="charts-container" style="margin-top: 20px;"></div>
        </section>

        ${currentSec.questions && currentSec.questions.length > 0 ? `
          <section class="content-card" style="margin-bottom: 20px;">
            <h3 style="margin: 0 0 14px 0; font-size: 1.1rem;">Frågor</h3>
            ${questionsHTML}
            <div style="display: flex; justify-content: flex-end; margin-top: 16px;">
              <button type="button" id="btn-check-section" class="nav-btn primary">✔ Kontrollera svar</button>
            </div>
          </section>
        ` : '<p style="color: var(--text-muted); text-align: center;">Inga frågor i denna sektion.</p>'}

        <div style="display: flex; justify-content: space-between; align-items: center; margin: 24px 0;">
          <button type="button" id="btn-prev-sec" class="nav-btn secondary" ${this.currentSectionIndex === 0 ? 'disabled style="opacity:0.5; pointer-events:none;"' : ''}>← Föregående sektion</button>
          <button type="button" id="btn-next-sec" class="nav-btn primary" ${this.currentSectionIndex === totalSecs - 1 ? 'disabled style="opacity:0.5; pointer-events:none;"' : ''}>Nästa sektion →</button>
        </div>
      </main>
    `;

    // Render Charts if present using Chart.js
    if (currentSec.charts && currentSec.charts.length > 0 && window.Chart) {
      const container = document.getElementById('charts-container');
      currentSec.charts.forEach((chartCfg, idx) => {
        const wrap = document.createElement('div');
        wrap.style.cssText = 'margin-bottom: 24px; background: var(--bg-page); padding: 16px; border-radius: 8px; border: 1px solid var(--border);';
        wrap.innerHTML = `
          <h4 style="margin: 0 0 12px 0; font-size: 1rem; text-align: center;">${this.escapeHTML(chartCfg.title || '')}</h4>
          <div style="position: relative; height: 280px; width: 100%;">
            <canvas id="canvas_${this.currentSectionIndex}_${idx}"></canvas>
          </div>
        `;
        container.appendChild(wrap);

        const canvasEl = document.getElementById(`canvas_${this.currentSectionIndex}_${idx}`);
        try {
          new window.Chart(canvasEl, {
            type: chartCfg.type || 'bar',
            data: {
              labels: chartCfg.labels || [],
              datasets: chartCfg.datasets || []
            },
            options: {
              responsive: true,
              maintainAspectRatio: false,
              plugins: {
                legend: { position: 'bottom' }
              }
            }
          });
        } catch (e) { console.error('Chart.js render error:', e); }
      });
    }

    // Event Listeners for navigation tabs
    this.root.querySelectorAll('[data-sec-idx]').forEach(btn => {
      btn.addEventListener('click', (e) => {
        this.currentSectionIndex = Number(e.currentTarget.dataset.secIdx);
        this.render();
        window.scrollTo({ top: 0, behavior: 'smooth' });
      });
    });

    const prevBtn = document.getElementById('btn-prev-sec');
    if (prevBtn) prevBtn.addEventListener('click', () => {
      if (this.currentSectionIndex > 0) {
        this.currentSectionIndex--;
        this.render();
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }
    });

    const nextBtn = document.getElementById('btn-next-sec');
    if (nextBtn) nextBtn.addEventListener('click', () => {
      if (this.currentSectionIndex < this.sectionsData.length - 1) {
        this.currentSectionIndex++;
        this.render();
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }
    });

    // Save inputs
    this.root.querySelectorAll('input[type="radio"]').forEach(radio => {
      radio.addEventListener('change', (e) => {
        this.userAnswers[e.target.name] = e.target.value;
        this.saveAnswers();
      });
    });

    this.root.querySelectorAll('.short-answer-input').forEach(input => {
      input.addEventListener('input', (e) => {
        this.userAnswers[e.target.dataset.qid] = e.target.value.trim();
        this.saveAnswers();
      });
    });

    const checkBtn = document.getElementById('btn-check-section');
    if (checkBtn) {
      checkBtn.addEventListener('click', () => {
        (currentSec.questions || []).forEach(q => {
          const fbEl = document.getElementById(`feedback_${q.id}`);
          const userVal = (this.userAnswers[q.id] || '').trim();
          if (!userVal) {
            fbEl.innerHTML = `<span style="color: var(--text-muted);">⚠️ Inget svar angivet.</span>`;
            return;
          }

          if (q.type === 'short') {
            const accepted = [q.answer, ...(q.acceptedAnswers || [])].map(a => String(a).toLowerCase());
            if (accepted.includes(userVal.toLowerCase())) {
              fbEl.innerHTML = `<span style="color: #16a34a; font-weight: 600;">✔ Rätt! (${q.answer})</span>`;
            } else {
              fbEl.innerHTML = `<span style="color: #dc2626; font-weight: 600;">✘ Fel. Rätt svar är: ${this.escapeHTML(q.answer)}</span>`;
            }
          } else {
            if (userVal === q.answer) {
              fbEl.innerHTML = `<span style="color: #16a34a; font-weight: 600;">✔ Rätt!</span>`;
            } else {
              fbEl.innerHTML = `<span style="color: #dc2626; font-weight: 600;">✘ Fel. Rätt svar är: ${this.escapeHTML(q.answer)}</span>`;
            }
          }
        });
      });
    }
  }

  saveAnswers() {
    try {
      localStorage.setItem(this.storageKey, JSON.stringify(this.userAnswers));
    } catch (e) { console.error(e); }
  }

  escapeHTML(str) {
    return String(str ?? '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }
}
