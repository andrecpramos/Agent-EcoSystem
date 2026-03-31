# Ecosystem v1.0 · web-app
— Start Here

---

## Setup (2 minutes)

```bash
bash path/to/Ecosystem_v8.2/guides/setup.sh
```

Answers 4 questions: project name + type, stack, teams, integrations. Done.

---

## What setup creates in your project

```
project-root/
├── CLAUDE.md              ← 1 line: @.ecosystem/CLAUDE.md  (gitignored)
├── .claude/
│   └── agents/            ← only the teams you selected  (gitignored)
│       └── [team]/
│           ├── orchestrator.md
│           └── [agents].md
└── .ecosystem/            ← everything else  (gitignored)
    ├── CLAUDE.md          ← real orchestrator content
    ├── AGENT_STANDARDS.md
    ├── config.md          ← prefilled with your project info
    ├── mcp-map.md         ← skill + MCP routing rules
    ├── add-team.sh        ← add a team later
    ├── skills/
    │   └── custom/        ← code-conventions prefilled with your stack
    ├── tasks/
    │   ├── lessons.md     ← grows every session
    │   └── templates/     ← 130 reference templates
    ├── dormant/           ← 16 specialist agents ready to activate
    └── logs/
```

Three things in your project root. All gitignored. Everything real lives in `.ecosystem/`.

---

## Add a team later

```bash
bash .ecosystem/add-team.sh design
```

Installs agents, updates config, switches to Master Orchestrator automatically if now 2+ teams.

---

## Architecture

```
You
 ↓
Master Orchestrator     ← only when 2+ teams (.ecosystem/CLAUDE.md)
 ↓
Team Orchestrator       ← one per team (.claude/agents/[team]/orchestrator.md)
 ↓
Agents ↔ Agents         ← communicate freely within team
```

Single team: Team Orchestrator IS `.ecosystem/CLAUDE.md`. No routing layer.
Multi-team: Master Orchestrator coordinates. Teams never contact each other directly.

---

## Available teams

| Team | Agents | Model split |
|---|---|---|
| `dev` | frontend · backend · tester · security · devops · dev-docs | orch:opus · exec:sonnet · docs:haiku |
| `design` | designer · ux-researcher · brand-designer · motion-designer · accessibility · content-designer · design-docs | orch:opus · senior:opus · exec:sonnet · docs:haiku |
| `product` | product-manager · data-analyst · product-docs | orch:opus · pm:opus · analyst:sonnet · docs:haiku |
| `office` | doc-writer · slide-maker · spreadsheet · office-docs | orch:opus · writers:sonnet · ops:haiku |
| `ops` | jira-ops · notion-ops | orch:sonnet · agents:haiku |

---

## MCP tools wired per team

| Team | MCPs available |
|---|---|
| dev | Atlassian (JIRA) · Supabase |
| design | Figma · Atlassian |
| product | Atlassian · Notion |
| office | Notion · Gmail |
| ops | Atlassian · Notion · Gmail · Google Calendar |

Orchestrators use these MCPs directly. Workers (frontend, backend, etc.) have none — they produce, they don't reach external systems.

---

## After setup — the one thing worth doing

Open `.ecosystem/skills/custom/code-conventions.md`.
Add your naming conventions and folder structure.
Every code agent reads this. Takes 5 minutes, pays dividends every session.

---
*Ecosystem v1.0 · web-app

