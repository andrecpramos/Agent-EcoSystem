# ECO-PROTO-01 — Cross-Agent Request Ticket Protocol

**Rule:** No agent contacts another team's agent directly.
All cross-team requests route through the Orchestrator.

---

## Request Ticket Format

```
TICKET
────────────────────────────────────
Type      : DEPENDENCY | CLARIFICATION | BLOCKER | INFORMATION
Priority  : P0 (2h) | P1 (4h) | P2 (24h) | P3 (48h)
From      : [Agent name]
Need      : [One sentence — exactly what is needed]
From whom : [Agent or team]
Why       : [What work is blocked or at risk]
Have now  : [What exists — or: nothing]
Impact    : [What degrades if unresolved]
Deadline  : [Specific date — never ASAP]
────────────────────────────────────
```

---

## Orchestrator Response Format

```
VERDICT: APPROVED | REDIRECTED | SPLIT | ESCALATED | REJECTED

Decision    : [What was decided]
Assigned to : [Agent] — deliver [deliverable] by [date]
Filing agent: [What to do now]
```

---

## Ticket Types

| Type | Use when |
|---|---|
| DEPENDENCY | Need specific output from another team to proceed |
| CLARIFICATION | Task has out-of-scope elements — need scope defined first |
| BLOCKER | Work fully stopped |
| INFORMATION | Need reference data — not yet fully blocked |

---

## Priority SLAs

P0: Orchestrator responds within 2 hours
P1: within 4 hours
P2: within 24 hours
P3: within 48 hours

---

## Violations

Direct agent-to-agent contact across team boundaries = structural violation.
Orchestrator flags to CEO Layer. No exceptions.

---
*ECO-PROTO-01 v2.0 · Applies to all 32+ active agents*
