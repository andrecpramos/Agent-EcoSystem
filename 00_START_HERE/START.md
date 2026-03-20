# START HERE — Agent Ecosystem v2.0
## 37 subagents · 10 teams · Native Claude Code integration

---

## How this works now

You open **one Claude Code session**. That is all.

The ecosystem runs as native Claude Code subagents. No terminals.
No manual agent loading. No session management by you.

Give a task → Orchestrator decomposes it → spawns the right agents
→ agents work in parallel → results return to Orchestrator → done.

---

## First-time setup (5 minutes)

```bash
# 1. From your project root
bash path/to/ECOSYSTEM_V2/00_START_HERE/setup.sh

# This creates:
#   .claude/agents/     ← 37 subagent definitions (auto-loaded by Claude Code)
#   CLAUDE.md           ← Orchestrator instructions (read every session)
#   .ecosystem/         ← config, logs, tickets, session registry
```

```bash
# 2. Fill in .ecosystem/config.md
# Project name, active teams, tools you use
```

```bash
# 3. Open Claude Code and give a task
# "Build the user login feature"
# "Review the marketing campaign brief"
# "Analyse our Q3 pipeline"
```

That is it.

---

## What happens when you give a task

```
Your task
    ↓
Orchestrator (CLAUDE.md instructions)
    ↓ decomposes → writes task briefs
    ↓
Spawns agents via Task tool (parallel where independent)
  ┌─────────────────┬─────────────────┐
  │   frontend      │   backend       │
  │ (own context)   │ (own context)   │
  └────────┬────────┴────────┬────────┘
           ↓ output          ↓ output
    Orchestrator reviews both
           ↓
    Chief of Staff logs, updates Notion
           ↓
    Reports to you
```

---

## Folder structure

```
ECOSYSTEM_V2/
  CLAUDE.md                ← Read by Claude Code every session (Orchestrator rules)
  .claude/
    agents/                ← 37 subagent definitions (Claude Code native format)
      frontend.md
      backend.md
      ... (all agents)
  00_START_HERE/           ← This file, config template, setup script
  01_COMMAND/              ← orchestrator.md + chief-of-staff.md (reference docs)
  02_PROTOCOLS/            ← AGENT_STANDARDS + SESSION-PROTOCOL + ECO-PROTO-01
  03_DORMANT/              ← 17 dormant agents (activate when needed)
  teams/                   ← Full agent definitions (source for .claude/agents/)
```

---

## The two things that prevent single-session collapse

**1. CLAUDE.md** instructs the Orchestrator to print a Session Collapse
Check before any production task — forcing agent identification and
brief writing before any output.

**2. Tool restrictions** in `.claude/agents/` YAML frontmatter.
The security agent has read-only tools — it cannot write code even if
instructed to. Structure enforces what rules cannot.

---

## Active teams

Edit `.ecosystem/config.md` to set which teams are active.
The Orchestrator reads this before decomposing any task and only
spawns agents from active teams.

---

## Dormant agents

17 additional agents live in `03_DORMANT/`. They activate when an
active agent files a CAPACITY ticket indicating structural overload.
See `02_PROTOCOLS/capacity-protocol.md`.

To activate a dormant agent: copy its file to `.claude/agents/`
after CEO Layer approval. It becomes immediately available.

---
*Ecosystem v2.0 · Claude Code native · No terminals required*
