# SESSION PROTOCOL v3.1
## Correct flow · Context management · Both spawn models

---

## The correct execution flow

```
CEO Layer gives task
      ↓
Orchestrator (CLAUDE.md)
  — plans, identifies agents, writes briefs
  — invokes chief-of-staff via Agent tool  ← this happens immediately
      ↓
Chief of Staff (agent)
  — receives spawn request
  — spawns team agents via Agent tool or CLI
  — returns output to Orchestrator
      ↓
Orchestrator reviews output
  — if review needed: invokes COS again → reviewer agent
  — reports status to CEO Layer
```

**CEO Layer does nothing except give the initial task.**
The Orchestrator → COS → agents chain executes automatically.

---

## Why Orchestrator invokes COS directly

Previous design: Orchestrator writes spawn requests as text, waits for CEO Layer
to manually open COS. This broke the workflow — CEO had to intervene every time.

Current design: Orchestrator has exactly one permitted Agent tool call — `chief-of-staff`.
Everything else is still prohibited. COS spawns all team agents.
Architecture is preserved. Flow is uninterrupted.

---

## Context management

### When to compress

Orchestrator tracks context usage and acts before degradation:

| Context level | Action |
|---|---|
| ~60% | Warn CEO Layer, begin writing session summary |
| ~80% | Finish current task only, write summary, signal new session needed |
| New topic / major context shift | Proactively suggest new conversation |

### Session summary format

Written to `.ecosystem/logs/session-summary.md` by COS (on Orchestrator instruction):

```
SESSION SUMMARY — [datetime]
Completed  : [what was finished]
In progress: [agent · task · current status]
Blocked    : [anything waiting and why]
Next actions: [exactly what the next session does first]
Open tickets: [ticket IDs still active]
```

### Resuming in a new conversation

CEO Layer pastes this as the first message:
```
Continuing from previous session.
[paste session-summary.md contents]
Resume from: [next action from the summary]
```

Orchestrator reads it, runs the session start block, and continues.

---

## Spawn methods — Model A preferred

### Model A — Interactive session (VS Code / Claude Code chat)

Chief of Staff uses the Agent tool:
```
subagent_type : [agent name matching .claude/agents/ filename]
prompt        : [task brief + skill content if needed]
```

**Parallel:** multiple Agent tool calls in one COS response = concurrent execution.

### Model B — CLI / automated session

```bash
# Standard
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md)" \
  --print "[task brief]"

# With skill injected
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md \
  .skills/[source]/[skill-file])" \
  --print "[task brief]"

# Parallel background
claude --system-prompt "..." --print "[brief]" \
  > .ecosystem/logs/[agent]-output.md 2>&1 &
wait
```

COS attempts Model A first. Uses Model B if Agent tool is unavailable.

---

## Session registry

`.ecosystem/agent-sessions.md` — maintained by COS:

```
| When             | Agent    | Model | Status   | Task                |
| 2026-03-20 09:14 | frontend | A     | SPAWNED  | Build login UI      |
| 2026-03-20 09:31 | frontend | A     | COMPLETE | Login UI done       |
```

---

## Collapse prevention — updated

**The PRE-RESPONSE GATE** in CLAUDE.md stops the Orchestrator from producing directly.
**The PROHIBITED list** removes all tools except the COS Agent tool call.
**The COS invocation** is immediate — Orchestrator does not write requests and wait.

Three layers. None rely on judgement alone.

---
*Session Protocol v3.1 · Ecosystem v3*
