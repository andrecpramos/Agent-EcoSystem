---
name: vendor-evaluation
description: Inject when any agent evaluates technology vendors, third-party services, SaaS tools, APIs, or infrastructure providers. Ensures consistent evaluation framework across all architecture and procurement decisions.
---

# Vendor Evaluation Framework

Use this template for every service or vendor evaluated. Complete all fields.
Never evaluate a vendor with fewer than 5 fields populated.

## Evaluation template

```
VENDOR EVALUATION
─────────────────────────────────────────
Service       : [name + URL]
Category      : [auth / database / payments / email / analytics / infra / other]
What it does  : [one sentence]
Why it fits   : [specific reason for this project, not generic]

Pricing
  Free tier   : [what's included, limits]
  Paid tier   : [cost, what unlocks]
  At scale    : [cost projection at 10x current usage]

Compatibility
  Region/GDPR : [EU data residency? GDPR compliant? DPA available?]
  Stack fit   : [works with current stack? any conflicts?]
  Integration : [SDK available? API quality? existing community examples?]

Risk
  Lock-in     : [how hard to migrate away? proprietary formats?]
  Maturity    : [founded, funding, customer base, uptime SLA]
  Alternatives: [2-3 alternatives with one-line comparison]

Effort
  Setup       : [hours to integrate]
  Maintenance : [ongoing effort per month]
  Dependencies: [what else must exist first]

Decision
  Verdict     : RECOMMENDED / ACCEPTABLE / NOT RECOMMENDED
  Reason      : [one sentence]
─────────────────────────────────────────
```

## Scoring guidance

- RECOMMENDED: fits well, low risk, reasonable cost, clear migration path
- ACCEPTABLE: fits with caveats noted above, CEO Layer should review
- NOT RECOMMENDED: lock-in risk, GDPR gap, cost at scale, or poor stack fit

## Rules

- One template per vendor — never compare two vendors in one template
- Pricing must be verified from the vendor's current pricing page — no estimates from memory
- GDPR field is mandatory for any service handling personal data
- Alternatives must be named specifically — "other options exist" is not acceptable

---
*Ecosystem v7.1*
