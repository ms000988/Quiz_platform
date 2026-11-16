export class WritingClient {
  constructor({ promptPath = './prompt.json', rootElement, examId, backendUrl = 'https://quiz-platform-aohd.onrender.com' }) {
    this.promptPath = promptPath;
    this.root = rootElement;
    this.examId = examId;
    this.backendUrl = backendUrl;
    this.promptData = null;
    this.draftKey = `sfi_${examId}_writing_draft`;
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
      this.promptData = {
        title: 'Skrivuppgift',
        promptText: 'Skriv en text och motivera dina åsikter.',
        minWords: 80
      };
    }

    this.render();
  }

  normalizeText(text) {
    return String(text || '').trim().toLowerCase().replace(/\s+/g, ' ');
  }

  isDuplicate(text) {
    try {
      const history = JSON.parse(localStorage.getItem(this.lastSubmissionsKey) || '[]');
      return history.includes(this.normalizeText(text));
    } catch {
      return false;
    }
  }

  recordSubmission(text, cefrResult) {
    try {
      const history = JSON.parse(localStorage.getItem(this.lastSubmissionsKey) || '[]');
      const currentNorm = this.normalizeText(text);
      if (!history.includes(currentNorm)) {
        history.push(currentNorm);
        localStorage.setItem(this.lastSubmissionsKey, JSON.stringify(history));
      }

      const attempts = JSON.parse(localStorage.getItem(this.historyKey) || '[]');
      attempts.unshift({
        date: new Date().toLocaleString('sv-SE'),
        cefr: cefrResult || '—',
        snippet: text.trim().substring(0, 120) + (text.trim().length > 120 ? '...' : ''),
        fullText: text
      });
      localStorage.setItem(this.historyKey, JSON.stringify(attempts.slice(0, 10)));
    } catch (e) {
      console.error(e);
    }
  }

  render() {
    const title = this.promptData?.title || 'Skrivuppgift';
    const minWords = this.promptData?.minWords || 80;
    const promptBodyHTML = this.promptData?.promptHtml
      ? this.promptData.promptHtml
      : `<p>${this.escapeHTML(this.promptData?.promptText || 'Skriv din text nedan.')}</p>`;

    const savedDraft = localStorage.getItem(this.draftKey) || '';

    this.root.innerHTML = `
      <header class="sticky-exam-header">
        <div class="header-top-row">
          <span class="exam-badge">✍️ Skriva – ${this.examId}</span>
          <span class="progress-text" id="word-counter-top">0 ord</span>
        </div>
        <div class="header-main-row">
          <h1 class="sticky-section-title">${this.escapeHTML(title)}</h1>
          <a href="../index.html" class="nav-btn secondary" style="padding: 6px 10px; font-size: 0.82rem;">← Delprov</a>
        </div>
      </header>

      <main class="exam-stage">
        <section class="content-card writing-prompt-card">
          <div class="prompt-body" style="line-height: 1.65;">${promptBodyHTML}</div>
          <div style="margin-top: 12px; padding-top: 10px; border-top: 1px solid var(--border); font-size: 0.85rem; color: var(--text-muted);">
            Rekommenderad längd: minst <strong>${minWords} ord</strong>
          </div>
        </section>

        <section class="content-card writing-editor-card">
          <label for="writing-textarea" style="display:block; font-weight: 600; margin-bottom: 8px;">Ditt svar:</label>
          <textarea id="writing-textarea" rows="12" placeholder="Skriv din text på svenska här...">${this.escapeHTML(savedDraft)}</textarea>
          <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px; flex-wrap: wrap; gap: 10px;">
            <span id="word-counter" style="font-size: 0.9rem; color: var(--text-muted);">0 ord</span>
            <div style="display: flex; gap: 8px;">
              <button type="button" id="btn-clear-draft" class="nav-btn secondary">Rensa text</button>
              <button type="button" id="btn-submit-writing" class="nav-btn primary">✔ Skicka in & Analysera</button>
            </div>
          </div>
        </section>

        <div id="writing-feedback-area"></div>

        <section class="content-card writing-history-section">
          <h3 style="margin: 0 0 12px 0; font-size: 1.05rem;">📜 Tidigare försök</h3>
          <div id="history-list"></div>
        </section>
      </main>
    `;

    const textarea = document.getElementById('writing-textarea');
    const updateCounts = () => {
      const words = textarea.value.trim() ? textarea.value.trim().split(/\s+/).length : 0;
      document.getElementById('word-counter').textContent = `${words} ord`;
      document.getElementById('word-counter-top').textContent = `${words} ord`;
      localStorage.setItem(this.draftKey, textarea.value);
    };

    textarea.addEventListener('input', updateCounts);
    updateCounts();

    document.getElementById('btn-clear-draft').addEventListener('click', () => {
      if (confirm('Vill du rensa textrutan?')) {
        textarea.value = '';
        localStorage.removeItem(this.draftKey);
        updateCounts();
      }
    });

    document.getElementById('btn-submit-writing').addEventListener('click', () => {
      this.handleSubmission(textarea.value, minWords);
    });

    this.renderHistory();
  }

  async handleSubmission(text, minWords) {
    const feedbackArea = document.getElementById('writing-feedback-area');
    const submitBtn = document.getElementById('btn-submit-writing');
    const words = text.trim() ? text.trim().split(/\s+/).length : 0;

    if (words < 10) {
      feedbackArea.innerHTML = `<div class="error-card">⚠️ Texten är alldeles för kort (${words} ord). Skriv hela meningar innan du skickar in.</div>`;
      return;
    }

    if (this.isDuplicate(text)) {
      feedbackArea.innerHTML = `<div class="error-card">⚠️ Du har redan skickat in exakt samma text. Gör ändringar i din text innan du analyserar igen.</div>`;
      return;
    }

    submitBtn.disabled = true;
    submitBtn.textContent = 'Analyserar...';
    feedbackArea.innerHTML = `<div class="content-card"><p style="margin:0;">⏳ Analyserar grammatik (LanguageTool) och språknivå (CEFR)...</p></div>`;

    try {
      const [correctRes, cefrRes] = await Promise.all([
        fetch(`${this.backendUrl}/correct`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ text })
        }).then(r => r.json()).catch(() => ({ matches: [] })),

        fetch(`${this.backendUrl}/cefr`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ text })
        }).then(r => r.json()).catch(() => ({ level: 'Error' }))
      ]);

      const cefrLabel = cefrRes.cefr || cefrRes.level || 'Error';
      const invalidFlags = ['TooShort', 'Meaningless', 'TooFewSentences', 'NoVerbs', 'Error'];
      const isInvalid = invalidFlags.includes(cefrLabel) || words < minWords;

      this.recordSubmission(text, isInvalid ? 'Ej bedömd' : cefrLabel);
      this.renderFeedbackWithHighlights(text, correctRes.matches || [], cefrLabel, isInvalid, words, minWords);
      this.renderHistory();
    } catch (err) {
      feedbackArea.innerHTML = `<div class="error-card">Kunde inte nå AI-servern: ${err.message}</div>`;
    } finally {
      submitBtn.disabled = false;
      submitBtn.textContent = '✔ Skicka in & Analysera';
    }
  }

  renderFeedbackWithHighlights(text, matches, cefrLabel, isInvalid, words, minWords) {
    const feedbackArea = document.getElementById('writing-feedback-area');

    // Build highlighted HTML safely using character offsets
    const sorted = [...matches].sort((a, b) => a.offset - b.offset);
    let resultHTML = '';
    let cursor = 0;

    sorted.forEach((m) => {
      if (m.offset < cursor) return; // Skip overlapping matches
      resultHTML += this.escapeHTML(text.slice(cursor, m.offset));

      const snippet = text.slice(m.offset, m.offset + m.length);
      let cssClass = 'error-grammar';
      const catId = (m.rule?.category?.id || '').toLowerCase();
      const issueType = (m.rule?.issueType || '').toLowerCase();

      if (catId.includes('typogr') || catId.includes('punct') || issueType === 'typographical') {
        cssClass = 'error-punctuation';
      } else if (catId.includes('spell') || issueType === 'misspelling') {
        cssClass = 'error-spelling';
      }

      const tooltip = m.replacements?.length
        ? `${m.message} (Förslag: ${m.replacements.slice(0, 3).map(r => r.value).join(', ')})`
        : m.message;

      resultHTML += `<span class="${cssClass}" title="${this.escapeHTML(tooltip)}">${this.escapeHTML(snippet)}</span>`;
      cursor = m.offset + m.length;
    });
    resultHTML += this.escapeHTML(text.slice(cursor));

    const headerBanner = isInvalid
      ? `<div class="error-card" style="margin-bottom: 12px;">
           <strong>Ingen CEFR-nivå eller poäng tilldelad (${this.escapeHTML(cefrLabel)}):</strong>
           ${words < minWords ? `Texten är kortare än rekommenderade ${minWords} ord.` : 'Texten innehåller för få fullständiga meningar eller verb för bedömning.'}
         </div>`
      : `<div style="display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
           <h3 style="margin:0;">Bedömd språknivå (CEFR): <span class="cefr-badge">${this.escapeHTML(cefrLabel)}</span></h3>
           <span style="font-size:0.85rem; color:var(--text-muted);">Håll muspekaren över markerade ord för förklaring</span>
         </div>`;

    feedbackArea.innerHTML = `
      <section class="content-card">
        ${headerBanner}
        <div class="highlighted-text-output">${resultHTML}</div>
        <div class="error-legend">
          <span class="legend-item"><span class="dot grammar"></span> Grammatik</span>
          <span class="legend-item"><span class="dot spelling"></span> Stavning</span>
          <span class="legend-item"><span class="dot punctuation"></span> Skiljetecken</span>
        </div>
      </section>
    `;
  }

  renderHistory() {
    const historyList = document.getElementById('history-list');
    if (!historyList) return;

    try {
      const attempts = JSON.parse(localStorage.getItem(this.historyKey) || '[]');
      if (attempts.length === 0) {
        historyList.innerHTML = '<p style="color: var(--text-muted); margin: 0;">Inga tidigare försök sparade ännu.</p>';
        return;
      }

      historyList.innerHTML = attempts.map((a, idx) => `
        <div style="padding: 10px 0; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: flex-start; gap: 12px;">
          <div>
            <div style="font-size: 0.8rem; color: var(--text-muted); margin-bottom: 4px;">${this.escapeHTML(a.date)} • Nivå: <strong>${this.escapeHTML(a.cefr)}</strong></div>
            <div style="font-size: 0.92rem;">${this.escapeHTML(a.snippet)}</div>
          </div>
          <button type="button" class="nav-btn secondary load-attempt-btn" data-idx="${idx}" style="padding: 6px 10px; font-size: 0.8rem;">Ladda</button>
        </div>
      `).join('');

      historyList.querySelectorAll('.load-attempt-btn').forEach((btn) => {
        btn.addEventListener('click', (e) => {
          const item = attempts[Number(e.currentTarget.dataset.idx)];
          if (item && item.fullText) {
            const textarea = document.getElementById('writing-textarea');
            textarea.value = item.fullText;
            textarea.dispatchEvent(new Event('input'));
            textarea.scrollIntoView({ behavior: 'smooth' });
          }
        });
      });
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
