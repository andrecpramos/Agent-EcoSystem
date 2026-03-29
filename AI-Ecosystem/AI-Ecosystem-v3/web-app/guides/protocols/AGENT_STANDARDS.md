# AGENT STANDARDS
## Applies to every agent. Read before your role file.

---

## 0. Identity banner — first output, every response
```
▸ [ICON] [NAME] | [3-word task summary]
```

---

## 1. Plan before executing
For 3+ step tasks or architectural decisions:
- Write the plan: steps, approach, verification method
- For complex code: write the interface/contract before the implementation
- Ask "is there a more elegant way?" before delivering non-trivial output
- **Minimal impact**: touch only what's necessary. No side-effects.
- Skip for simple, obvious tasks.
- **If execution goes sideways**: STOP. Re-plan immediately. Do not keep pushing.

---

## 2. Verify before marking done
- Code: run it, confirm tests pass · no `// TODO: fix later` · no temporary fixes
- File writes: `ls -la [path]` → missing/empty → log `WRITE_FAILURE` → retry → escalate
- For code changes: diff shows exactly what changed and why it's correct
- Ask: "Would a senior practitioner approve this without reservations?"
- Diff against brief. Report what changed and why.

**Audit-to-fix handoff:**
```
FIX REQUIRED
File    : [exact path]
Line    : [line number or unique snippet]
Issue   : [one sentence]
Fix     : [corrected code block]
Verify  : [command to confirm]
```

---

## 3. Autonomous unblocking
1. Diagnose root cause — the specific error, not the symptom
2. Attempt one fix — no hand-holding required
3. Failing tests or CI are your problem to fix, not to report
4. If still blocked after one attempt → file BLOCKED ticket to Orchestrator
5. If task scope is exploding → flag to Orchestrator for delegation, not expansion

**API rate limits:** Log `RATE_LIMIT · [service] · retry in [Xs]` → retry 3× (30s/60s/120s) → fallback → document.

---

## 4. Lessons + JIRA
After correction: append to `.ecosystem/tasks/lessons.md` — pattern + prevention rule.
After any task completion:
```
REFLECTION — [date] — [agent]
Went well    : [one thing]
Unexpected   : [one thing — or: none]
Next time    : [one improvement — or: none]
```
**JIRA** (if `jira_project` set): report to Team Orchestrator → ops/jira-ops or direct MCP.

---

## 5. Cross-team communication
Never contact another team directly. File Request Ticket to Orchestrator. Wait.

---

## 6. Scope boundary
Task outside your role → STOP · CLARIFICATION ticket · wait.

---

## 7. Error logging
`| YYYY-MM-DD HH:MM | [Agent] | [TYPE] | [one sentence] |` → `.ecosystem/logs/errors.md`

---

## 8. Tool and skill economy
Skills and MCP tools cost tokens. Activate only what this task requires.
Your Team Orchestrator checks `.ecosystem/mcp-map.md` before spawning you.
If a skill was injected into your prompt — use it. If not — don't request one.

---
*Ecosystem v1.0 · web-app
