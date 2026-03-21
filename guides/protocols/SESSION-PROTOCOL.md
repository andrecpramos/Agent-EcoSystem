# SESSION PROTOCOL v2.1
## Chief of Staff spawns agents — no manual terminals required

---

## How it works now

```
CEO Layer gives task
    ↓
Orchestrator (CLAUDE.md) — plans, identifies agents, writes briefs
    ↓
Orchestrator sends AGENT SPAWN REQUESTS to Chief of Staff
    ↓
Chief of Staff executes terminal spawn commands for each agent
  ├── frontend:  claude --system-prompt "..." --print "[brief]"
  ├── backend:   claude --system-prompt "..." --print "[brief]" &
  └── tester:    claude --system-prompt "..." --print "[brief]"
    ↓
Each agent runs in isolation, returns output to log file
    ↓
Chief of Staff reads output, reports to Orchestrator
    ↓
Orchestrator reviews, sends next spawn request or reports done
```

You open Claude Code once. Chief of Staff handles all agent spawning.

---

## Spawn command reference

```bash
# Sequential (wait for completion)
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md)" \
  --print "[task brief]"

# With skill injected
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md \
  .skills/anthropic/[skill]/SKILL.md)" \
  --print "[task brief]"

# Parallel (background, saves output to log)
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md)" \
  --print "[task brief]" \
  > .ecosystem/logs/[agent]-output.md 2>&1 &

# Wait for all background agents to complete
wait
```

---

## Available Anthropic skills

| Skill name | Path | Use when |
|---|---|---|
| `frontend-design` | `.skills/anthropic/frontend-design/SKILL.md` | UI / visual frontend work |
| `docx` | `.skills/anthropic/docx/SKILL.md` | Word document output |
| `pdf` | `.skills/anthropic/pdf/SKILL.md` | PDF creation or reading |
| `pptx` | `.skills/anthropic/pptx/SKILL.md` | Presentation / slide deck |
| `xlsx` | `.skills/anthropic/xlsx/SKILL.md` | Spreadsheet output |
| `product-self-knowledge` | `.skills/anthropic/product-self-knowledge/SKILL.md` | Anthropic product questions |

**Injection rule:** one skill per spawn, or none. Never inject speculatively.
Skills are tokens. Only load what the task requires. Release by not re-injecting next spawn.

---

## Tool economy

Tool activation is declared in the task brief and in each agent's YAML `tools` field.
Restricted agents (security, accessibility, data-analyst) have read-only tools by design.
For other agents, tools inherit by default — no need to list unless restricting.

---

## Session registry

Location: `.ecosystem/agent-sessions.md`

Chief of Staff maintains this. Format:
```
| When             | Agent    | Status   | Task                  |
| 2026-03-20 09:14 | frontend | SPAWNED  | Build login component |
| 2026-03-20 09:31 | frontend | COMPLETE | Login component done  |
```

---

## Single-session collapse — both forms now blocked

**Form 1 — Orchestrator produces code directly:**
CLAUDE.md instructs Orchestrator to send all production tasks as spawn requests.
Orchestrator has no bash tool access — it cannot spawn itself.

**Form 2 — Orchestrator executes operations directly:**
Chief of Staff holds bash/Notion tool access.
Orchestrator sends a spawn request → COS executes. Never the other way.

---

## Parallel execution pattern

```bash
# Chief of Staff parallel spawn
claude --system-prompt "..." --print "[frontend brief]" \
  > .ecosystem/logs/frontend-output.md 2>&1 &

claude --system-prompt "..." --print "[backend brief]" \
  > .ecosystem/logs/backend-output.md 2>&1 &

wait  # wait for both to complete

# Read outputs
cat .ecosystem/logs/frontend-output.md
cat .ecosystem/logs/backend-output.md
```

---
*Session Protocol v2.1 · Ecosystem v2.0 · COS owns spawning*
