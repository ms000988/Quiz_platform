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
