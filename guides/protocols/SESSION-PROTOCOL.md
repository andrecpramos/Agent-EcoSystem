# SESSION PROTOCOL v3.1

## Flow

```
CEO gives task → Orchestrator plans → invokes chief-of-staff (Agent tool)
→ COS spawns team agents → outputs return → Orchestrator reviews → reports to CEO
```

CEO does nothing except give the task.

## Spawn — Model A: Agent tool (preferred, interactive sessions)

```
subagent_type : [agent name from .claude/agents/]
prompt        : [task brief + skill content if needed]
```

Parallel: multiple Agent tool calls in one response = concurrent.

## Spawn — Model B: CLI

```bash
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md .claude/agents/[agent].md)" \
  --print "[task brief]"

# With skill:
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md .claude/agents/[agent].md \
  .skills/[source]/[skill-file])" --print "[task brief]"

# Parallel:
claude ... --print "[brief]" > .ecosystem/logs/[agent]-output.md 2>&1 &
wait
```

COS uses Model A first. Falls back to B if Agent tool unavailable.

## Skill injection (Model A)

Paste skill file content at the end of the prompt field.

## Session registry

`.ecosystem/agent-sessions.md`
```
| When             | Agent    | Model | Status   | Task           |
| 2026-03-20 09:14 | frontend | A     | SPAWNED  | Build login UI |
| 2026-03-20 09:31 | frontend | A     | COMPLETE | Done           |
```

## Context management

60% → write session summary to `.ecosystem/logs/session-summary.md`
80% → finish current task, signal new session needed

Resume: paste session-summary contents as first message in new session.

---
*Session Protocol v3.1 · Ecosystem v7*
