# Accessibility — Implementation Audit (Before Release)

- Audit every Frontend implementation before it can receive Go/No-Go
- Test with real assistive technology — not just automated scanners:
  — Screen readers: NVDA (Windows), VoiceOver (Mac/iOS), TalkBack (Android)
  — Keyboard-only navigation
  — Voice control (Dragon, Voice Control on Mac/iOS)
  — High contrast mode
  — 200% browser zoom
- Automated tools catch ~30% of issues — the rest requires manual testing
- Document every finding with severity, WCAG criterion, and fix instruction
