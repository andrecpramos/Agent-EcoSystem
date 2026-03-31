# Office Ecosystem — Start Here

---

## Setup (2 minutes)

```bash
bash path/to/office/guides/setup.sh
```

---

## Teams

| Team | Agents | Use for |
|---|---|---|
| `writing` | doc-writer · copy-editor · researcher | Reports, briefs, proposals, memos |
| `presentation` | slide-maker · visual-designer | Slide decks, pitches, board presentations |
| `data` | spreadsheet · data-visualiser | Excel models, charts, dashboards |
| `ops` | notion-ops · gmail-ops · calendar-ops | Workspace, email, calendar |

---

## Architecture

```
You
 ↓
Master Orchestrator     ← only when 2+ teams
 ↓
Team Orchestrator       ← one per team
 ↓
Agents ↔ Agents         ← communicate freely within team
```

No code. No scenes. Just documents, slides, data, and ops.

---

## Installed structure

```
workspace/
├── CLAUDE.md              ← @.ecosystem/CLAUDE.md
├── .claude/agents/        ← selected teams (gitignored)
└── .ecosystem/            ← everything (gitignored)
    ├── CLAUDE.md          ← real orchestrator
    ├── config.md
    ├── skills/custom/     ← brand-voice, style-guide
    ├── skills/anthropic/  ← docx, pptx, xlsx skills
    └── logs/
```

---

## After setup — fill in two files

1. `.ecosystem/skills/custom/brand-voice.md` — your organisation's tone and style
2. `.ecosystem/skills/custom/style-guide.md` — document formatting standards

Every writing and presentation agent reads these. Takes 10 minutes.

---
*office v1.0*
