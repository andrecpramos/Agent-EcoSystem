# CAPACITY SIGNAL PROTOCOL
## How agents flag overload and request dormant agent activation

---

## Signal Types

- **VOLUME** — too many tasks. Solve by reprioritisation. No activation.
- **COMPLEXITY** — tasks need deeper expertise than this agent was built for. May justify activation.
- **SCOPE CREEP** — agent absorbing work that belongs to a dormant agent. Strongest signal.

Only COMPLEXITY and SCOPE CREEP justify activating a dormant agent.

---

## Process

```
Agent files CAPACITY ticket → Orchestrator assesses within 24h

REPRIORITISE  : Signal is VOLUME. Orchestrator adjusts workload.
RECOMMEND     : Evidence is solid. Orchestrator prepares activation brief for CEO Layer.
INSUFFICIENT  : More evidence needed. Review date set.

CEO Layer decides:
ACTIVATE  → Orchestrator runs activation checklist from dormant-registry.md
DEFER     → Review date set
DECLINE   → Orchestrator adjusts workload instead
```

---

## Activation Checklist (from dormant-registry.md)

When CEO Layer approves:
1. Copy dormant agent file from 03_DORMANT/ to .ecosystem/agents/
2. Brief new agent on project context
3. Define handoff — exactly which tasks transfer
4. Both agents confirm boundary is clear
5. Update dormant-registry.md status to Active

---

## What This System Is Not

- Not a way to avoid difficult work
- Not triggered by a single hard task
- Not bypassed because something feels urgent
- CEO Layer always makes the final call

---
*Capacity Protocol v2.0 · Ecosystem v2.0*
