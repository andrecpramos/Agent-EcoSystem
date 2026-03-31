# MCP Tool Map — Godot Ecosystem

## Team MCP assignments

| Team | MCPs |
|---|---|
| dev | mcp__atlassian (issue tracking) |
| design | mcp__notion (design docs) |
| qa | mcp__atlassian (bug tickets) |
| ops | mcp__atlassian · mcp__notion |
| master | mcp__atlassian · mcp__notion |

Workers (scene-architect, gameplay-programmer, etc.) have no MCP tools.
Orchestrators call external services. Workers produce files and specs.

---

## Skill injection map

| Task trigger | Skill to inject | Team |
|---|---|---|
| Writing or reviewing GDScript | `code-conventions` | dev |
| Designing or reviewing scene structure | `scene-conventions` | dev, design |
| Code quality review | `gdscript-style` | dev, qa |

One skill per spawn. Orchestrator checks this map before every spawn.
Inject only if the trigger matches the task. Never speculative.

---
*godot v1.0*
