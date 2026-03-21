# Project Config
## Fill in and save as .ecosystem/config.md

---

## Project

```
Name    : ___________________________________
Type    : web app / mobile / API / VS Code extension / other
Phase   : planning / building / testing / launching / maintaining
Goal    : [one sentence — what you are building and why]
```

---

## Active agents

Delete the agents you are not using. Keep the ones you are.

```
Command layer (always keep both):
  orchestrator
  chief-of-staff

Teams (delete entire team if not needed):
  design:     designer, ux-researcher, brand-designer, motion-designer,
              accessibility, content-designer, design-docs
  dev:        frontend, backend, tester, devops, security, dev-docs
  product:    product-manager, product-docs
  sales:      sales-manager, account-executive, sales-docs
  marketing:  marketing-strategist, content-agent, marketing-docs
  cs:         cs-manager, support-agent, cs-docs
  hr:         hr-manager, recruitment, hr-docs
  financial:  cfo, financial-analyst, financial-docs
  legal:      general-counsel, compliance, legal-docs
  specialists: data-analyst, data-engineer, vendor-procurement
```

---

## Tools

```
Code editor     : VS Code
Version control : GitHub / GitLab / Bitbucket
Task tracker    : Jira / Linear / Notion / GitHub Issues
Docs            : Notion / Confluence / GitHub Wiki
Deploy          : GitHub Actions / Vercel / AWS / other
Comms           : Slack / Teams / email
CRM             : HubSpot / Salesforce / other (if Sales active)
```

---

## Model overrides

Leave blank to use each agent's default model.
Fill in only what you want to change.

```
orchestrator      : (default: claude-opus-4-6)
chief-of-staff    : (default: claude-opus-4-6)
frontend          : (default: claude-sonnet-4-6)
backend           : (default: claude-sonnet-4-6)
tester            : (default: claude-sonnet-4-6)
devops            : (default: claude-sonnet-4-6)
security          : (default: claude-opus-4-6)
dev-docs          : (default: claude-haiku-4-5)
designer          : (default: claude-opus-4-6)
ux-researcher     : (default: claude-opus-4-6)
brand-designer    : (default: claude-sonnet-4-6)
general-counsel   : (default: claude-opus-4-6)
```

---

## Project thresholds

```
Expenditure self-approve  : $500     (default)
Contract review threshold : $5,000   (default)
Pipeline coverage minimum : 3x quota (default)
Doc loop max passes       : 3        (default)
Agent non-response alert  : 24h      (default)
Renewal start             : 90 days before expiry (default)
```

---

## Communication

```
Request Ticket filing : ___________________________________
Orchestrator hub      : ___________________________________
CEO Layer escalation  : ___________________________________
Weekly Health Report  : ___________________________________
P0 emergency contact  : ___________________________________
```

---

## Special rules for this project

```
1.
2.
3.
```

---
*Save this file as .ecosystem/config.md*
