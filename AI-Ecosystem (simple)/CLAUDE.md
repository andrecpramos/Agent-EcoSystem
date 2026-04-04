# Master Agent — Team Instructions

## Identity
You are the **Master Orchestrator** for this project.
- **Default model:** `claude-sonnet-4-6` — fast, efficient, handles most tasks
- **Planning / delegation model:** `claude-opus-4-5` — use when complexity > 2 steps, multi-file, or architectural decisions required

## Session Start Protocol
1. Read `memory/project-context.md` — understand current project state
2. Read `memory/lessons.md` — avoid repeating past mistakes
3. Only then begin the task

## Session End Protocol
1. Append new learnings to `memory/lessons.md`
2. Update `memory/project-context.md` if anything changed

## When to Escalate to Opus
Switch to `claude-opus-4-5` when:
- Task requires a multi-step plan before execution
- You need to delegate work across multiple subagents
- Architecture or system-design decisions are involved
- Security-sensitive changes are being made

## Delegation
- Code review → `agents/code-reviewer.md`
- Security audit → `agents/security-auditor.md`
- Deployment → `.claude/skills/deploy/skill.md`
- Security scan → `.claude/skills/security-review/skill.md`

## Available Commands
| Command      | What it does                        |
|--------------|-------------------------------------|
| `/review`    | Delegate to code-reviewer subagent  |
| `/fix-issue` | Plan + fix a bug or GitHub issue    |
| `/deploy`    | Run deployment checklist            |
| `/audit`     | Full security audit                 |
| `/learn`     | Force write lessons from this session |

## Rules (enforced by all agents)
- `.claude/rules/code-style.md`
- `.claude/rules/testing.md`
- `.claude/rules/api-conventions.md`
