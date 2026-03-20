# SESSION PROTOCOL v2.0
## Native Claude Code subagent model

---

## How the ecosystem runs in Claude Code

The previous version required you to open terminals manually.
This version uses Claude Code's native subagent system.

**You open one Claude Code session. That is all.**

The Orchestrator (via CLAUDE.md) reads the task, identifies the right
agents, writes task briefs, and spawns them as isolated subprocesses
via the Task tool. Each agent runs in its own context window with its
own system prompt from `.claude/agents/`. You never touch a terminal.

---

## The mechanism

```
You: give a task in Claude Code
        ↓
Orchestrator reads CLAUDE.md + .ecosystem/config.md
        ↓
Orchestrator decomposes task → writes task briefs
        ↓
Orchestrator spawns agents via Task tool (parallel where possible)
  Agent A context: .claude/agents/frontend.md + task brief
  Agent B context: .claude/agents/backend.md + task brief
        ↓
Each agent works independently, returns output to Orchestrator
        ↓
Orchestrator reviews output, assigns next steps or marks complete
        ↓
Chief of Staff logs completion, updates Notion/files if needed
```

---

## What you actually do to start a session

```bash
# 1. First time only — run setup
bash .ecosystem/setup.sh

# 2. Open Claude Code in your project
code .        # or however you open VS Code
# Then open the Claude Code panel

# 3. Give a task
# "Build the user authentication feature"
# "Review the Q3 marketing campaign brief"
# "Analyse our sales pipeline for this quarter"
```

That is it. No terminals. No manual agent loading.

---

## How agents get their identity

Each file in `.claude/agents/` contains:
- YAML frontmatter with: `name`, `description`, `model`, optional `tools`
- System prompt = AGENT_STANDARDS + the agent's full role definition

The `description` field is what Claude Code uses to automatically
match tasks to the right agent. Write task briefs that reference
the agent by name to guarantee the correct one is used.

---

## Single-session collapse prevention

**Form 1 — Orchestrator produces code/content directly:**
CLAUDE.md instructs the Orchestrator to print a Session Collapse Check
before any production task. The check forces agent identification
and brief writing before spawning.

**Form 2 — Orchestrator executes operations directly:**
The Chief of Staff subagent holds operational tool access.
Orchestrator writes a brief → spawns chief-of-staff → COS executes.

**The structural fix:**
Agents are defined with tool restrictions in their YAML frontmatter.
The security agent, for example, has read-only tools — it cannot write
code even if it wanted to. Tool access is configured per agent, not
per session, giving structural rather than behavioural enforcement.

---

## Parallel execution

Spawn multiple agents simultaneously for independent tasks:

```
"Use the frontend and backend agents in parallel to build
 the authentication feature — frontend builds the login UI,
 backend builds the auth API endpoint."
```

Claude Code runs them concurrently. Both agents work independently.
Orchestrator receives both results and integrates them.

---

## Resuming an agent

If a task needs continuation:

```
"Continue the previous frontend work and add the password
 reset flow to what was already built."
```

Claude Code resumes the previous subagent with full conversation history.

---

## Session registry — lightweight

Since Claude Code tracks agent IDs natively, the session registry
is simplified. Chief of Staff maintains it for audit purposes:

Location: `.ecosystem/agent-sessions.md`

```
| datetime         | agent      | status   | task                        |
| 2026-03-20 09:14 | frontend   | SPAWNED  | Build login component       |
| 2026-03-20 09:14 | backend    | SPAWNED  | Auth API endpoints          |
| 2026-03-20 09:31 | frontend   | COMPLETE | Login component done        |
| 2026-03-20 09:44 | backend    | COMPLETE | Auth API done               |
```

---

## Agent tool restrictions reference

| Agent | Tools | Reason |
|---|---|---|
| security | Read, Grep, Glob | Reviews only — never writes code |
| accessibility | Read, Glob | Audits only — never modifies |
| data-analyst | Read, Glob | Analysis only — never modifies data |
| All others | Inherit all | Full access needed for execution |

---

## Important Claude Code constraint

**Subagents cannot spawn other subagents.**

This means:
- Chief of Staff cannot spawn team agents — Orchestrator does all spawning
- All delegation happens from the main Orchestrator session
- For nested workflows, chain agents sequentially from the main session

---
*Session Protocol v2.0 · Ecosystem v2.0 · Claude Code native*
