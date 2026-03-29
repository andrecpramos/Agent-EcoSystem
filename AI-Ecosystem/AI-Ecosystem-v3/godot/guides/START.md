# Godot Ecosystem — Start Here

---

## Setup (2 minutes)

```bash
bash path/to/godot/guides/setup.sh
```

Answers 4 questions: project name + Godot version + platform, teams, integrations.

---

## Add a team later

```bash
bash .ecosystem/add-team.sh design
```

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

---

## Teams

| Team | Agents | Use for |
|---|---|---|
| `dev` | scene-architect · gameplay-programmer · shader-developer · tool-scripter · game-docs | All Godot implementation |
| `design` | level-designer · ui-designer · audio-designer · vfx-designer · design-docs | Level, UI, audio, VFX design |
| `qa` | playtester · performance-analyst | Quality and performance |
| `ops` | jira-ops · notion-ops | Issue tracking and workspace |

**Typical single-developer session:** `dev` team only.
**With design work:** add `design` team.

---

## How it works

1. Open Claude Code in your Godot project root
2. Give a task: *"Design a scene contract for the player character"*
3. Dev Team Orchestrator decomposes → spawns scene-architect
4. scene-architect produces a scene contract doc
5. gameplay-programmer implements from that contract
6. game-docs records the deliverable

No frontend. No backend. No Figma. Just Godot.

---

## Installed structure

```
godot-project/
├── CLAUDE.md              ← @.ecosystem/CLAUDE.md (1-line pointer)
├── .claude/agents/        ← selected teams (gitignored)
└── .ecosystem/            ← everything (gitignored)
    ├── CLAUDE.md          ← real orchestrator
    ├── config.md          ← your project settings
    ├── skills/custom/     ← code-conventions, scene-conventions, gdscript-style
    ├── tasks/templates/   ← scene contracts, level docs, bug reports, etc.
    ├── dormant/           ← network-programmer, physics-specialist, localisation
    └── logs/
```

---

## After setup

Fill in two skill files — this is the highest-leverage thing you can do:

1. `.ecosystem/skills/custom/code-conventions.md` — your naming patterns and autoloads
2. `.ecosystem/skills/custom/scene-conventions.md` — your folder layout and node rules

Every agent reads these. Takes 10 minutes, pays dividends every session.

---
*godot v1.0*
