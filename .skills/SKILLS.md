# Ecosystem Skills Registry
## Chief of Staff reads this before every spawn decision

---

## How skills work

Skills are instruction sets injected into an agent's context at spawn time.
They cost tokens only when used. When the task ends, the skill disappears.

**Lookup order:** project skills first, then Anthropic official.
If a skill exists in both `custom/` and `anthropic/`, the custom version wins.

---

## Available skills

### Anthropic official — `anthropic/`

| Skill | Trigger | Path |
|---|---|---|
| `frontend-design` | Building UI components, web interfaces, any visual frontend work | `anthropic/frontend-design/SKILL.md` |
| `docx` | Creating or editing Word documents (.docx) | `anthropic/docx/SKILL.md` |
| `pdf` | Creating, reading, or processing PDF files | `anthropic/pdf/SKILL.md` |
| `pptx` | Creating or editing slide decks (.pptx) | `anthropic/pptx/SKILL.md` |
| `xlsx` | Creating or editing spreadsheets (.xlsx) | `anthropic/xlsx/SKILL.md` |
| `product-self-knowledge` | Any question about Anthropic products, pricing, or capabilities | `anthropic/product-self-knowledge/SKILL.md` |

### Project custom — `custom/`

| Skill | Trigger | Path |
|---|---|---|
| `brand-voice` | Writing external-facing content: marketing, sales, customer communications | `custom/brand-voice.md` |
| `code-conventions` | Any agent writing or reviewing code for this project | `custom/code-conventions.md` |
| `api-conventions` | Backend agent designing or implementing API endpoints | `custom/api-conventions.md` |
| `design-system` | Designer or frontend agent creating UI components | `custom/design-system.md` |

---

## Skill selection rules

**One skill per spawn — or none.**
Never inject multiple skills. If a task seems to need two, split the task into two spawns.

**Only inject when the trigger applies.**
A backend agent writing business logic does not need `code-conventions` injected
if the conventions are already in the codebase and visible to the agent.
Inject when the agent is starting fresh work that needs active guidance.

**Do not inject speculatively.**
"This might be useful" is not a trigger. The trigger condition must be met.

---

## Adding a new custom skill

1. Create a new `.md` file in `custom/`
2. Add YAML frontmatter: `name`, `description` (the trigger condition)
3. Write the skill content — specific instructions, not general guidance
4. Add a row to the table above
5. Chief of Staff picks it up immediately — no other changes needed

Template:
```markdown
---
name: skill-name
description: When to use this skill — specific trigger condition
---

# Skill Name

[Skill content here — specific instructions for the agent]
```

---

## Skill economy — token cost reference

| Skill | Approximate tokens |
|---|---|
| `frontend-design` | ~800 |
| `code-conventions` | ~300–600 (depends on how much you fill in) |
| `brand-voice` | ~200–400 |
| `api-conventions` | ~300–500 |
| `design-system` | ~400–700 |
| `docx` / `pdf` / `pptx` / `xlsx` | ~600–1000 |

These are one-time costs per spawn — not per response.
A 10-response agent session with a skill costs the skill tokens once, not ten times.

---
*Ecosystem v2.0 · Skills Registry*
