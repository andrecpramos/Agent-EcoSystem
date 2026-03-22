---
name: notion-sync
description: Inject when any agent needs to update Notion after completing a task. Provides structured Notion update payload format and the three standard databases to always update. Use for any task that produces output worth tracking in the project workspace.
---

# Notion Sync

After completing a task, produce a structured update payload and apply it to all three Notion databases.

## Standard update payload

```
NOTION UPDATE
─────────────────────────────────────────
Task name     : [task title]
Status        : Completed / In Progress / Blocked
Agents used   : [comma-separated agent names]
Tokens used   : [estimated tokens]
Summary       : [2-3 sentences — what was done and what changed]
Output files  : [paths to any files created or modified]
Next actions  : [what should happen next, if anything]
─────────────────────────────────────────
```

## The three databases to update every time

1. **Roadmap / Tasks DB** — update the status of the task that was completed
2. **Session Log** — append a new entry with the payload above
3. **Docs page** — if the task produced a document, add or update the link

## Field naming (use exact names — no variations)

| Database | Key fields |
|---|---|
| Roadmap | Name, Status, Agents, Token Cost, Date Completed |
| Session Log | Task, Agents, Tokens, Summary, Output Files, Date |
| Docs | Title, Path, Agent, Last Updated, Type |

## Rules

- Update all three databases in a single COS operational pass
- Never update only one — all three or none
- If a database ID is missing from config.md, log the gap and continue with the others
- Use the exact field names above — inconsistent naming breaks automation

---
*Ecosystem v7.1*
