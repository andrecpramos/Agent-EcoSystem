# Ecosystem + Skills — Start Here

---

## What this is

A complete AI agent operating system for any project.
37 active agents across 10 teams. Skills injected on demand.
One session to open. Chief of Staff handles everything else.

---

## Folder structure — what lives where

```
Ecosystem_Skills_v3/
│
├── CLAUDE.md              ← Orchestrator instructions (Claude Code reads this automatically)
│
├── .claude/
│   └── agents/            ← 37 active subagents (Claude Code native format)
│       ├── frontend.md
│       ├── backend.md
│       ├── chief-of-staff.md
│       └── ... (34 more)
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
│       ├── docx/
│       └── ... (4 more)
│
├── .ecosystem/            ← Runtime state only (written during operation)
│   ├── config.md          ← Your project settings
│   ├── agent-sessions.md  ← Session log (Chief of Staff maintains)
│   ├── tickets.md         ← Request tickets
│   └── logs/              ← Agent outputs
│
├── dormant/               ← 17 agents waiting to activate when needed
│   ├── dormant-registry.md
│   └── ... (16 agent files)
│
└── guides/                ← Everything for humans
    ├── START.md           ← This file
    ├── PROJECT_CONFIG_TEMPLATE.md
    ├── setup.sh
    ├── vscode_settings.json
    └── protocols/
        ├── AGENT_STANDARDS.md
        ├── ECO-PROTO-01.md
        ├── SESSION-PROTOCOL.md
        ├── capacity-protocol.md
        └── ORCHESTRATOR_MCP_MAP.md
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
bash path/to/Ecosystem_Skills_v3/guides/setup.sh
```

Then:
1. Fill in `.ecosystem/config.md` — project name, active teams
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
*Ecosystem + Skills v3*
