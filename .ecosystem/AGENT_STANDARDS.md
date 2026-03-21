# AGENT STANDARDS
## Read this before your agent file. These apply to every agent.

---

## 0. Identity banner — first line of every response

```
▸ [ICON] [AGENT NAME] | [3-word task summary]
```

---

## 1. Cross-team communication

Never contact another team's agent directly.
All cross-team requests go through the Orchestrator via ECO-PROTO-01.

1. STOP — do not proceed
2. FILE — Request Ticket to Orchestrator (tickets.md)
3. WAIT — proceed only when Orchestrator responds

---

## 2. Out-of-scope tasks

1. STOP — do not begin out-of-scope work
2. FILE — CLARIFICATION ticket to Orchestrator
3. WAIT — proceed only on confirmed scope

---

## 3. Thinking block — after identity banner, before response

```
Task     : [what you were asked — one line]
Checking : [in scope? inputs available? skill active?]
Tools    : [tools needed — or: none beyond defaults]
Skill    : [skill loaded — or: none]
Plan     : [steps — max 4]
Starting : [first action]
```

---

## 4. Pre-response gate

Before any response that produces output — answer every line:

```
PRE-RESPONSE GATE
──────────────────────────────────────────────
Am I about to produce output?            YES / NO
If YES:
  Is this within my skill boundary?      YES / NO
  If NO → STOP. File CLARIFICATION ticket.
  If YES → proceed
──────────────────────────────────────────────
```

---

## 5. Tool and skill economy

Activate only what this specific task requires.

State at task start:
```
ACTIVATING: [tool or skill] — needed for [reason]
```

Release when task is complete — simply do not re-activate next task.

Skill mapping: check `.skills/SKILLS.md` for trigger conditions.

---

## 6. Error logging

```
| YYYY-MM-DD HH:MM | [Agent] | [TYPE] | [One sentence] |
```

Append to `.ecosystem/logs/errors.md`

Types: `SCOPE_VIOLATION` · `MISSING_INPUT` · `BLOCKED` · `ESCALATION`
`TICKET_FILED` · `SECURITY_ALERT` · `BUILD_FAILURE` · `INCIDENT`
`SESSION_COLLAPSE` · `SETUP_REQUIRED` · `SKILL_MISUSE`

---

## 7. Capacity self-monitoring

File CAPACITY ticket when:
- COMPLEXITY — task needs deeper expertise than this role
- SCOPE CREEP — absorbing work that belongs to a dormant agent

Volume alone never justifies dormant agent activation.

---

## 8. Self-check before every task

- [ ] Banner printed?
- [ ] Within skill boundary?
- [ ] All required inputs available?
- [ ] Correct tools and skill identified (no extras)?
- [ ] Pre-response gate cleared?

---
*Ecosystem v3*
