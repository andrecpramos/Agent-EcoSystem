# AGENT STANDARDS v3
## Applies to every agent. Read before your role file.

---

## 0. Identity banner — first output, every response
```
▸ [ICON] [NAME] | [3-word task summary]
```

---

## 1. Plan before executing
For 3+ step tasks or architectural decisions:
- Plan steps, approach, verification method before starting
- Ask "is there a more elegant way?" before delivering non-trivial output
- **Minimal impact**: touch only what's necessary. No side-effects.
- Skip for simple tasks.

---

## 2. Verify before marking done
- Code: run it, check logs, confirm tests pass
- Docs: confirm structure matches the brief
- Ask: "Would a senior practitioner approve this?"
- Diff output against what was asked. Report what changed and why.

**Audit-to-fix handoff** — when identifying code changes another agent must apply:
```
FIX REQUIRED
File    : [exact path]
Line    : [line number or unique snippet]
Issue   : [one sentence]
Fix     : [corrected code block]
Verify  : [command to confirm, e.g. `npm run build`]
```

---

## 3. Autonomous unblocking
1. Diagnose root cause — the specific error, not the symptom
2. Attempt one fix
3. If still blocked → file BLOCKED ticket to Orchestrator

**API rate limits:** Log `RATE_LIMIT · [service] · retry in [Xs]` → retry 3× (30s/60s/120s) → execute task brief fallback → document limitation in output.

---

## 4. Lessons
After correction: append to `tasks/lessons.md` — pattern + prevention rule.
After any task completion:
```
REFLECTION — [date] — [agent]
Went well    : [one thing]
Unexpected   : [one thing — or: none]
Next time    : [one improvement — or: none]
```

---

## 5. Cross-team communication
Never contact another team directly. File Request Ticket to Orchestrator. Wait.

---

## 6. Scope boundary
Task outside your role → STOP · CLARIFICATION ticket · wait.

---

## 7. Error logging
`| YYYY-MM-DD HH:MM | [Agent] | [TYPE] | [one sentence] |` → `.ecosystem/logs/errors.md`
Types: `SCOPE_VIOLATION` · `BLOCKED` · `BUILD_FAILURE` · `LESSON_LOGGED` · `ESCALATION` · `SECURITY_ALERT` · `SESSION_COLLAPSE` · `RATE_LIMIT`

---

## 8. Tool and skill economy
Activate only what this task requires. `ACTIVATING: [tool/skill] — [reason]`
Release when done.

---

## 9. Parallel operations — mandatory
**1 message = all related operations.**
- Multiple file reads → batch in one message
- Multiple file writes/edits → batch in one message
- Multiple searches → all Grep/Glob calls in one message
- Multiple sub-tasks → launch all concurrently, wait for results

Never sequence operations that have no dependency on each other.

---

## 10. Self-check before starting
- [ ] Banner printed?
- [ ] Plan written for 3+ step tasks?
- [ ] Within skill boundary?
- [ ] Tools/skill identified (no extras)?
- [ ] Fallback defined if task needs an external API?
- [ ] All parallel ops batched in one message?

---
*Ecosystem v8.0*
