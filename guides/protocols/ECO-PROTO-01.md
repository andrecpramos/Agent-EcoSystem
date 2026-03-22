# ECO-PROTO-01 — Cross-Team Request Protocol

Never contact another team's agent directly. All cross-team requests via Orchestrator.

## Ticket format

```
TICKET
Type      : DEPENDENCY | CLARIFICATION | BLOCKER | INFORMATION
Priority  : P0(2h) | P1(4h) | P2(24h) | P3(48h)
From      : [agent]
Need      : [one sentence]
Why       : [what's blocked]
Deadline  : [date]
```

## Orchestrator verdict

```
VERDICT: APPROVED | REDIRECTED | REJECTED
Assigned to : [agent] by [date]
```

Bypassing this protocol = structural violation, flagged to CEO Layer.

---
*ECO-PROTO-01 v2 · Ecosystem v7*
