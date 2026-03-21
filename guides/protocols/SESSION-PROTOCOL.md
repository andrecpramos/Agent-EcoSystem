# SESSION PROTOCOL v3.0
## How agents are spawned — both execution models documented

---

## The two spawn models

Claude Code supports two execution models. Chief of Staff uses whichever
matches how your session is running.

---

### Model A — Interactive session (VS Code / Claude Code chat)

Chief of Staff uses the **Agent tool** (Task tool):

```
Agent tool call:
  subagent_type : [agent name matching .claude/agents/ filename]
  prompt        : [full task brief including skill if needed]
```

Claude Code reads the matching file from `.claude/agents/[name].md`
automatically. The agent runs in its own context window.
Output returns to Chief of Staff as the tool result.

**Parallel spawn:** call the Agent tool multiple times in the same response.
Claude Code runs them concurrently.

---

### Model B — CLI / automated session

Chief of Staff uses bash subprocesses:

```bash
# Sequential — wait for completion
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md)" \
  --print "[task brief]"

# With skill injected
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md \
  .skills/[source]/[skill-path])" \
  --print "[task brief]"

# Parallel — background processes
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md)" \
  --print "[task brief]" \
  > .ecosystem/logs/[agent]-output.md 2>&1 &

wait  # wait for all parallel agents
```

---

## How Chief of Staff decides which model to use

```
Am I in an interactive Claude Code / VS Code session?
  YES → use Agent tool (Model A)
  NO  → use CLI bash subprocess (Model B)
```

If unsure: attempt Model A first. If Agent tool is not available, use Model B.

---

## Skill injection — both models

**Model A (Agent tool):** include the skill content directly in the prompt field.
Chief of Staff reads the skill file and pastes it into the prompt.

```
prompt: [task brief]

---
[contents of .skills/custom/code-conventions.md pasted here]
```

**Model B (CLI):** concatenate the skill file into the system prompt.
```bash
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .claude/agents/[agent].md \
  .skills/custom/code-conventions.md)" \
  --print "[task brief]"
```

---

## Session registry

Chief of Staff maintains `.ecosystem/agent-sessions.md`:

```
| When             | Agent    | Model | Status   | Task                  |
| 2026-03-20 09:14 | frontend | A     | SPAWNED  | Build login component |
| 2026-03-20 09:31 | frontend | A     | COMPLETE | Login component done  |
```

---

## Single-session collapse — how the gate prevents it

**The PRE-RESPONSE GATE in CLAUDE.md is the primary enforcement.**
It is unconditional — it runs before every substantive response, not just
before "production tasks." The Orchestrator cannot categorise around it.

**Tool prohibition is the structural backstop.**
Even if the gate were bypassed, the Orchestrator's prohibited actions list
removes the tools needed to execute production work directly.

**Two layers. Neither relies on judgement.**

---

## Parallel execution — Model A

```
Chief of Staff response (single message, multiple Agent tool calls):
  [Agent tool: frontend] → build login UI
  [Agent tool: backend]  → build auth API
  (both run simultaneously)
  (results return when both complete)
```

---

## Resuming an agent (Model A)

```
"Continue the previous frontend work and add the password reset flow."
→ Chief of Staff uses SendMessage with the previous agent's ID
→ Agent resumes with full conversation history
```

---
*Session Protocol v3.0 · Ecosystem v3 · Both spawn models documented*
