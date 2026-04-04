# MCP Tool Map
## Which tools each team orchestrator has access to

---

## Team MCP assignments

| Team | tools: (already in orchestrator frontmatter) |
|---|---|
| dev | mcp__atlassian · mcp__supabase |
| design | mcp__figma · mcp__atlassian |
| product | mcp__atlassian · mcp__notion |
| office | mcp__notion · mcp__gmail |
| ops | mcp__atlassian · mcp__notion · mcp__gmail · mcp__gcal |
| master | mcp__atlassian · mcp__notion |

Workers (frontend, backend, etc.) have no MCP tools — they produce, they do not call external services.
## Skill injection map (Team Orchestrator decides)

| Task trigger | Skill to inject | Team |
|---|---|---|
| UI / web component | `frontend-design` | dev, design |
| Writing code for this project | `code-conventions` | dev |
| API endpoint design | `api-conventions` | dev |
| UI component (design system) | `design-system` | design, dev |
| Word document output | `docx` | office |
| Slide deck output | `pptx` | office |
| Spreadsheet output | `xlsx` | office |
| External-facing copy | `brand-voice` | office, design |
| Vendor / tool evaluation | `vendor-evaluation` | product, ops |
| Notion sync | `notion-sync` | ops |

**Rule:** Orchestrator reads this map before every spawn. Inject only the skill whose trigger applies. One skill per spawn. Never speculative.

---
*Ecosystem v1.0 · web-app
