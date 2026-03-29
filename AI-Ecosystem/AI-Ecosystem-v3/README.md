# AI Ecosystem — Claude Code Agent Library

Eleven independent agent ecosystems for Claude Code.
Pick the folder that matches your work. Each is self-contained.

---

## Which ecosystem?

| Folder | For | Teams |
|---|---|---|
| `web-app/` | Web and API development | dev · design · product · ops |
| `godot/` | Godot game development | dev · design · qa · ops |
| `office/` | Documents, slides, and data | writing · presentation · data · ops |
| `mobile/` | iOS and Android apps | dev · qa · ops |
| `data-science/` | Python, ML, and data pipelines | dev · analysis · ops |
| `chrome-extension/` | Browser extensions (Manifest V3) | dev · qa · ops |
| `api-service/` | Backend API / microservice | dev · qa · ops |
| `unity/` | Unity game development | dev · design · qa · ops |
| `cli-tool/` | Command-line tools | dev · qa · ops |
| `content-creator/` | Newsletter, blog, social media | research · writing · publishing · ops |
| `browser-automation/` | Playwright / Puppeteer / scraping | dev · qa · ops |

---

## Setup (any ecosystem)

```bash
bash path/to/[ecosystem]/guides/setup.sh
```

Two minutes. Answers 4-5 questions. Done.

---

## What gets installed

```
project-root/
├── CLAUDE.md              ← 1-line pointer (gitignored)
├── .claude/agents/        ← only the teams you selected (gitignored)
└── .ecosystem/            ← all state (gitignored)
    ├── CLAUDE.md          ← real orchestrator
    ├── config.md          ← your project settings
    ├── skills/custom/     ← prefilled by setup, edit to add conventions
    ├── tasks/             ← lessons, todo, templates
    ├── dormant/           ← specialist agents, activate when needed
    └── logs/
```

---

## Architecture (same across all ecosystems)

```
You
 ↓
Master Orchestrator     ← only when 2+ teams (opus)
 ↓
Team Orchestrator       ← one per team (opus)
 ↓
Agents ↔ Agents         ← communicate freely within team
                           sonnet for execution · haiku for docs/ops
```

**Planning scope:**
- Master: WHAT each team delivers + SEQUENCE
- Team Orchestrators: HOW — which agents, what order, what runs in parallel

---

## Add a team later

```bash
bash .ecosystem/add-team.sh [team-name]
```

---
