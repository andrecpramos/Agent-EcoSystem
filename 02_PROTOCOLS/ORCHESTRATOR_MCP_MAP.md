# ORCHESTRATOR MCP CONNECTION MAP
## How the Orchestrator sees every tool in the ecosystem

---

## Principle

Orchestrator READS from all connected tools.
Orchestrator WRITES only to the central hub (Notion).
Agents work in their native tools. Orchestrator observes them there.

---

## MCP Connections — Availability

| Tool | MCP Status | Connect via |
|---|---|---|
| Notion | ✅ Native | claude.ai Settings → Integrations |
| Gmail | ✅ Native | claude.ai Settings → Integrations |
| Google Calendar | ✅ Native | claude.ai Settings → Integrations |
| Google Drive/Sheets | ✅ Native | claude.ai Settings → Integrations |
| Figma | ✅ Native | claude.ai Settings → Integrations |
| GitHub | Plugin/API | GitHub MCP server |
| Slack | Plugin | Slack MCP server |
| Jira/Linear | Plugin | Atlassian MCP or API |
| HubSpot | Plugin | HubSpot MCP or API |

---

## Connect in this order (new project)

1. Notion — Orchestrator hub, always first
2. Google Sheets — financial visibility
3. Google Calendar — deadline tracking
4. Gmail — Sales/CS/Legal signals
5. GitHub — Dev Team visibility
6. Figma — Design handoff status
7. Jira/Linear — Product and Dev ticket status
8. Slack — cross-team request signals
9. HubSpot — Sales pipeline (when Sales team active)

Only connect tools for ACTIVE teams (see PROJECT_CONFIG.md).

---

## What Orchestrator Reads (Key Signals)

| Signal | Source | Action |
|---|---|---|
| PR blocked 48h+ | GitHub | File BLOCKER ticket, assign |
| CI failure on main | GitHub | Alert DevOps, flag |
| Ticket labelled "blocked" | Jira/Linear | Route to owner |
| Budget ALERT cell red | Sheets | Alert CFO, flag CEO if >15% |
| Compliance deadline in 14d | Calendar | Alert GC + CEO Layer |
| Pipeline coverage below 3x | HubSpot | Alert Sales Manager, flag CEO |
| Post in #orchestrator-tickets | Slack | Process as Request Ticket |
| Post in #incidents | Slack | Assess severity, escalate P0/P1 |
| Doc draft in Notion | Notion | Review, issue verdict |
| Pass 3 failure | Notion | Auto-escalate, stop loop |

---

## What Orchestrator NEVER Does in Connected Tools

- Push code to GitHub
- Send emails from agent inboxes
- Edit Figma files
- Modify financial spreadsheets
- Post in team Slack channels (only #orchestrator-updates)
- Read Restricted/Confidential financial folders
- Read full agent email inboxes

---
*MCP Map v2.0 · Ecosystem v2.0*
