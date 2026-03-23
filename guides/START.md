# Ecosystem + Skills — Start Here

---

## What this is

A token-lean AI agent operating system for small/medium projects.
37 active agents across 10 teams. Skills injected on demand.
One Claude Code session to open. No terminals. No manual agent loading. Chief of Staff handles everything.

**Token efficiency built-in:**
- Auto-compaction activates at 45% full (not 80%) via `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=50`
- Model routing: haiku for docs/ops · sonnet for most work · opus for COS + security/legal only
- Session state auto-restored via session hook on start
- Budget: 200,000t per session — thresholds at 120k (warn) and 160k (wrap up)

---

## Folder structure — what lives where

```
Agent-EcoSystem/
│
├── CLAUDE.md              ← Orchestrator instructions (Claude Code reads this automatically)
│
├── .claude/
│   ├── agents/            ← 37 active subagents (Claude Code native format)
│   │   ├── frontend.md      (sonnet)
│   │   ├── backend.md       (sonnet)
│   │   ├── chief-of-staff.md (opus — coordinator)
│   │   ├── security.md      (opus — high-stakes)
│   │   ├── general-counsel.md (opus — legal)
│   │   └── ... (32 more, mostly sonnet/haiku)
│   ├── settings.json      ← CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=50 + session hooks
│   └── helpers/
│       └── session-hook.cjs ← Auto-restores last session summary on start
│
├── .skills/               ← Skills library — injected on demand, never permanently
│   ├── SKILLS.md          ← Registry: which skill, which agent, when to use
│   ├── custom/            ← YOUR project skills (fill these in)
│   │   ├── brand-voice.md
│   │   ├── code-conventions.md
│   │   ├── api-conventions.md
│   │   └── design-system.md
│   └── anthropic/         ← Official Anthropic skills (auto-linked)
│       ├── frontend-design/
│       └── ... (5 more)
│
├── .ecosystem/            ← Runtime state (written during operation)
│   ├── config.md          ← YOUR project settings — fill this in first
│   ├── agent-sessions.md  ← Token ledger (Chief of Staff maintains)
│   ├── tickets.md         ← Request/blocked/escalation tickets
│   ├── AGENT_STANDARDS.md ← Standards injected into every agent spawn
│   └── logs/              ← Agent outputs + session summaries
│
├── dormant/               ← 17 agents waiting to activate when needed
│
├── tasks/                 ← todo.md, lessons.md, templates/
│
└── guides/                ← Everything for humans
    ├── START.md           ← This file
    ├── PROJECT_CONFIG_TEMPLATE.md
    ├── setup.sh
    └── protocols/
```

---

## Why no duplication

There is only **one** location for agent definitions: `.claude/agents/`

Claude Code reads subagents from `.claude/agents/` natively.
There is no separate `teams/` folder because that would be the same files twice.
The YAML frontmatter (`name`, `description`, `model`, `tools`) is what makes
a file a Claude Code subagent. The full role definition is inside the same file.

---

## Setup — 3 minutes

```bash
# From your project root
bash path/to/Agent-EcoSystem/guides/setup.sh
```

Then:
1. Fill in `.ecosystem/config.md` — project name, active teams (pre-created, just fill it)
2. Fill in `.skills/custom/` templates — your conventions, voice, design system
3. Open Claude Code and give a task

---

## Visual identity — how to know which agent is active

Every agent prints a one-line banner as its first output:
```
▸ 🎯 Orchestrator    | decomposing task
▸ 🧠 Chief of Staff  | spawning backend agent
▸ ⚙️ Backend         | designing API contract
▸ 🖥️ Frontend        | building login component
```

No banner = agent did not load. Tell Orchestrator to re-issue the spawn request.

---

## Skills — what, why, when

Skills are instruction sets injected at spawn time. One per task, or none.

**Custom skills** (`.skills/custom/`) — your project's specific patterns:
- `brand-voice.md` — tone, vocabulary, writing rules
- `code-conventions.md` — naming, patterns, architectural decisions
- `api-conventions.md` — API shapes, error codes, auth approach
- `design-system.md` — tokens, components, visual rules

**Anthropic official skills** (`.skills/anthropic/`) — task-specific capabilities:
- `frontend-design` — production-grade UI with distinctive aesthetics
- `docx`, `pdf`, `pptx`, `xlsx` — document output formats

Custom skills take precedence. Chief of Staff reads `.skills/SKILLS.md`
to decide which to inject — you never select manually.

---

## Dormant agents

17 agents in `dormant/` activate when an active agent files a CAPACITY ticket.
To activate: copy the file to `.claude/agents/` after CEO Layer approval.
It is immediately available for spawning. No other changes needed.

---

## Reading order (first time)

1. `guides/protocols/AGENT_STANDARDS.md` — rules every agent follows
2. `guides/protocols/SESSION-PROTOCOL.md` — how agents are spawned
3. `CLAUDE.md` — what the Orchestrator does
4. `.skills/SKILLS.md` — skill registry and injection rules

---
*Ecosystem v8.0 — token-lean for small/medium projects*
