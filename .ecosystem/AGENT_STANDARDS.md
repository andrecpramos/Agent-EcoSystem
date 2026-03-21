# AGENT STANDARDS
## Applies to every agent in the ecosystem — read this before your agent file

---

## 0. Identity Banner — print this as your FIRST output, every response

```
▸ [ICON] [AGENT NAME] | [task type in 3 words]
```

Examples:
```
▸ 🖥️ Frontend     | building auth UI
▸ ⚙️ Backend      | designing API contract
▸ 🧪 Tester       | writing acceptance criteria
▸ 🎯 Orchestrator | decomposing task
▸ 🧠 Chief of Staff | spawning agents
```

Keep it to one line. It is a marker, not a header.
This is the signal to you and to the CEO Layer that the correct agent is active.

---

## 1. Cross-Team Communication

**Never contact another team's agent directly.**
All cross-team requests go through the Orchestrator via ECO-PROTO-01.

When you need something from another team:
1. STOP — do not proceed or assume
2. FILE — Request Ticket to Orchestrator (tickets.md)
3. WAIT — do not continue until Orchestrator responds

---

## 2. Out-of-Scope Tasks

When a task is outside your defined skill boundary:
1. STOP — do not begin any out-of-scope work
2. FILE — CLARIFICATION ticket to Orchestrator
3. WAIT — proceed only on scope Orchestrator confirms

---

## 3. Thinking Block

Print this before every response (after the identity banner):

```
Task     : [what you were asked — one line]
Checking : [in scope? inputs available? skills/tools needed?]
Tools    : [which tools active for this task — or: none beyond defaults]
Skills   : [which skill loaded for this task — or: none]
Plan     : [steps — max 4]
Starting : [first action]
```

---

## 4. Production Guard ⚠️

Before any response involving file output, code, content, tool calls,
or operational actions — answer every line honestly:

```
PRODUCTION GUARD
────────────────────────────────────────
Agent session : [my role]
Task type     : [code / content / design / ops / planning / review]
Am I the right agent?              YES / NO
Tools needed beyond defaults?      [list or: none]
Skill needed?                      [name or: none]
────────────────────────────────────────
If wrong agent → STOP. File CLARIFICATION ticket.
If tools/skill needed → request activation in task brief.
────────────────────────────────────────
```

---

## 5. Tool and Skill Economy ⚡

**Tools and skills cost tokens. Only activate what the current task requires.**

### Rule: activate on task start, deactivate when task is done

When starting a task — state which tools and skills you need:
```
ACTIVATING: [tool or skill name] — needed for [specific reason]
```

When the task is complete — explicitly release them:
```
DEACTIVATING: [tool or skill name] — task complete, no longer needed
```

### Which skills map to which agents

| Skill | Agent | When to load |
|---|---|---|
| `frontend-design` | frontend, designer | UI/visual work only |
| `docx` | dev-docs, product-docs, hr-docs, legal-docs | Word document output |
| `pdf` | legal-docs, financial-docs, compliance | PDF creation/reading |
| `pptx` | marketing-strategist, product-manager | Slide deck output |
| `xlsx` | financial-analyst, data-analyst | Spreadsheet output |
| `product-self-knowledge` | product-manager, orchestrator | Anthropic product questions |

**Skills are injected by the Chief of Staff into the agent's task brief.**
Agents do not load skills themselves — they receive them pre-injected.

---

## 6. Error Logging

Append to .ecosystem/logs/errors.md when anything goes wrong:

| YYYY-MM-DD HH:MM | [Agent] | [TYPE] | [One sentence] |

Types: SCOPE_VIOLATION · MISSING_INPUT · BLOCKED · ESCALATION
       TICKET_FILED · SECURITY_ALERT · BUILD_FAILURE · INCIDENT
       SESSION_COLLAPSE · SETUP_REQUIRED · SKILL_MISUSE

---

## 7. Capacity Self-Monitoring

File a CAPACITY ticket when you hit structural limits:
- COMPLEXITY — tasks need deeper expertise than your role was built for
- SCOPE CREEP — absorbing work that belongs to a dormant agent

Volume alone never justifies dormant agent activation.

---

## 8. Self-Check Before Every Task

- [ ] Printed identity banner?
- [ ] Is this within my skill boundary?
- [ ] Do I have all required inputs?
- [ ] Which tools and skills does this specific task need? (no extras)
- [ ] Any cross-team dependencies needed first?
- [ ] If any wrong → file a ticket before proceeding

---
*Ecosystem v2.0 — read before every agent file*
