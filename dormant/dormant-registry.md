# Dormant Agent Registry
## Complete — all teams

---

## How this works

Every agent here is built and ready. They sit in `.ecosystem/dormant/`
until activated. Activation requires:

1. The active agent files a CAPACITY ticket
2. Orchestrator assesses and recommends
3. CEO Layer approves
4. Orchestrator runs the activation checklist

The signal types that justify activation:
- **COMPLEXITY** — tasks requiring deeper expertise than the active agent has
- **SCOPE CREEP** — active agent absorbing work that belongs here

Volume alone never justifies activation.

---

---

# DEV TEAM

---

## 🗄️ Database Administrator (DBA)
**File:** `dormant/dba.md` · **Model:** claude-opus-4-5 · **Splits from:** Backend

### Activate when Backend reports any of these
- [ ] Query performance issues recurring across 2+ sprints without resolution
- [ ] A migration caused or nearly caused a production incident
- [ ] Data model has grown beyond 15 tables with complex relationships
- [ ] Backend spending 30%+ of time on data layer vs API and service logic
- [ ] Data integrity bugs of the same type appearing more than twice

### Takes over from Backend
Schema design, query optimisation, index strategy, migration review,
data integrity rules, backup procedures, database security

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy dba.md to .ecosystem/agents/
[ ] Brief DBA on current schema and recent migrations
[ ] Define handoff — which open tasks move to DBA
[ ] Backend and DBA confirm boundary
[ ] Update this registry — mark active
```

---

## 🔌 API Designer
**File:** `dormant/api-designer.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Backend

### Activate when Backend reports any of these
- [ ] API surface exceeds 30 endpoints and consistency is degrading
- [ ] Frontend reports unclear or incomplete contracts in 2+ consecutive sprints
- [ ] Contract design is crowding out implementation work

### Takes over from Backend
Contract-first API design, OpenAPI spec ownership, versioning strategy,
endpoint naming conventions, breaking change management

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy api-designer.md to .ecosystem/agents/
[ ] Hand all existing OpenAPI specs to API Designer
[ ] Backend and API Designer confirm boundary
[ ] Update this registry
```

---

## 🏗️ Platform / Infrastructure Engineer
**File:** `dormant/platform-engineer.md` · **Model:** claude-sonnet-4-5 · **Splits from:** DevOps

### Activate when DevOps reports any of these
- [ ] Infrastructure spans multiple cloud services with complex dependencies
- [ ] A platform incident caused by infrastructure complexity DevOps could not prevent
- [ ] Multiple teams depend on shared infrastructure and conflicts are arising
- [ ] Infrastructure work is crowding out CI/CD and operations quality

### Takes over from DevOps
Infrastructure architecture, IaC ownership, cloud config, networking,
secrets management architecture, capacity planning

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy platform-engineer.md to .ecosystem/agents/
[ ] Transfer IaC ownership
[ ] DevOps and Platform Engineer confirm boundary
[ ] Update this registry
```

---

---

# DESIGN TEAM

---

## 🧩 Design Technologist
**File:** `dormant/design-technologist.md` · **Model:** claude-sonnet-4-5
**Splits from:** UI/UX Designer + Brand Designer

### Activate when Design Team reports any of these
- [ ] Figma-to-code translation causing regular discrepancies requiring rework
- [ ] Token system too complex for manual sync — errors appearing
- [ ] Frontend interpreting specs instead of implementing them
- [ ] Storybook out of sync with Figma and neither team has capacity to fix it

### Takes over
Design token implementation, component spec translation,
Storybook ownership, design-to-dev handoff tooling

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy design-technologist.md to .ecosystem/agents/
[ ] Transfer token files and Storybook ownership
[ ] Design and Frontend confirm boundary
[ ] Update this registry
```

---

---

# PRODUCT TEAM

---

## 📊 Product Analyst
**File:** `dormant/product-analyst.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Product Manager

### Activate when Product Manager reports any of these
- [ ] Spending more time in data and metrics than in strategy and direction
- [ ] Feature validation is being skipped because there is no capacity to analyse results
- [ ] A/B test analysis is blocking product decisions — backlog of unanalysed experiments
- [ ] Product metrics reporting is inconsistent or delayed

### Takes over from Product Manager
Product metrics framework, experiment design and analysis,
funnel analysis, feature validation reports, user behaviour analysis

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy product-analyst.md to .ecosystem/agents/
[ ] Transfer metrics ownership and dashboard access
[ ] Product Manager and Analyst confirm boundary
[ ] Update this registry
```

---

---

# SALES TEAM

---

## 📞 Sales Development Representative (SDR)
**File:** `dormant/sdr.md` · **Model:** claude-haiku-4-5 · **Splits from:** Account Executive

### Activate when Sales Manager reports any of these
- [ ] Outbound prospecting is consistently being deprioritised for active deal work
- [ ] Pipeline coverage drops below 3x and inbound alone cannot fill it
- [ ] AE is spending significant time on prospecting instead of advancing qualified deals
- [ ] Time-to-first-meeting from a new prospect is too long

### Takes over from Account Executive
Outbound prospecting, lead qualification, meeting booking,
pipeline top-of-funnel contribution

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy sdr.md to .ecosystem/agents/
[ ] Brief SDR on ICP criteria and qualification standards
[ ] AE and SDR confirm handoff process
[ ] Update this registry
```

---

---

# MARKETING TEAM

---

## 📈 Growth / Paid Acquisition Specialist
**File:** `dormant/growth-paid.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Marketing Strategist

### Activate when Marketing Strategist reports any of these
- [ ] Paid channels are a significant budget line and cannot be managed alongside strategy
- [ ] Campaign optimisation is being skipped because Strategist lacks capacity
- [ ] CAC is not being tracked by channel — budget allocation is guesswork

### Takes over from Marketing Strategist
Paid channel management, growth experimentation,
landing page optimisation, attribution by channel

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy growth-paid.md to .ecosystem/agents/
[ ] Transfer paid channel account access and budget ownership
[ ] Strategist and Growth confirm boundary
[ ] Update this registry
```

---

## 🔎 SEO Specialist
**File:** `dormant/seo-specialist.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Marketing Strategist

### Activate when Marketing Strategist reports any of these
- [ ] Organic search is a primary acquisition channel and technical SEO is being neglected
- [ ] Site health issues (crawl errors, indexation problems) are unaddressed
- [ ] Keyword strategy and content planning for SEO is not happening due to capacity

### Takes over from Marketing Strategist
Technical SEO audits, keyword research, content SEO briefing,
search performance measurement, competitive SEO analysis

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy seo-specialist.md to .ecosystem/agents/
[ ] Transfer search console and SEO tool access
[ ] Strategist and SEO confirm boundary
[ ] Update this registry
```

---

---

# CUSTOMER SUCCESS TEAM

---

## 🚀 Customer Onboarding Specialist
**File:** `dormant/onboarding-specialist.md` · **Model:** claude-sonnet-4-5 · **Splits from:** CS Manager

### Activate when CS Manager reports any of these
- [ ] New customer onboarding quality is degrading because CS Manager cannot give it full attention
- [ ] Time-to-first-value is increasing — customers taking longer to see value
- [ ] Onboarding is being rushed due to CS Manager managing renewals simultaneously

### Takes over from CS Manager
All new customer onboarding (Day 1 to graduation),
onboarding programme design, onboarding analytics

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy onboarding-specialist.md to .ecosystem/agents/
[ ] Transfer all customers currently in onboarding phase
[ ] CS Manager and Specialist confirm graduation handoff process
[ ] Update this registry
```

---

## 🔧 Technical Support Engineer
**File:** `dormant/technical-support.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Support Agent

### Activate when Support Agent reports any of these
- [ ] Technical tickets (requiring code or API knowledge) represent 30%+ of volume
- [ ] Technical tickets are taking 3x longer to resolve than standard tickets
- [ ] Technical issues are being closed without proper resolution due to skill gap

### Takes over from Support Agent
All Tier 2 technical issues — API debugging, integration troubleshooting,
bug triage, technical knowledge base

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy technical-support.md to .ecosystem/agents/
[ ] Define Tier 1 / Tier 2 escalation criteria
[ ] Support Agent and Technical Support confirm boundary
[ ] Update this registry
```

---

---

# HR TEAM

---

## 🎓 Learning & Development (L&D)
**File:** `dormant/learning-development.md` · **Model:** claude-sonnet-4-5 · **Splits from:** HR Manager

### Activate when HR Manager reports any of these
- [ ] Onboarding is taking too long or new members are not reaching productivity
- [ ] Skills gaps are identified but there is no capacity to address them
- [ ] Compliance training coordination is consuming HR Manager time

### Takes over from HR Manager
Onboarding programme design, skills development,
training coordination, career development framework

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy learning-development.md to .ecosystem/agents/
[ ] Transfer onboarding programme ownership
[ ] HR Manager and L&D confirm boundary
[ ] Update this registry
```

---

## 🎯 Senior Recruiter / Sourcing Specialist
**File:** `dormant/senior-recruiter.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Recruitment Agent

### Activate when Recruitment Agent reports any of these
- [ ] Multiple senior or specialist roles open simultaneously and quality is degrading
- [ ] Time-to-fill for senior roles is unacceptable — standard sourcing not working
- [ ] Recruitment Agent cannot manage volume across both senior and junior roles

### Takes over from Recruitment Agent
Senior and specialist role sourcing, passive candidate engagement,
talent mapping, long-cycle candidate relationships

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy senior-recruiter.md to .ecosystem/agents/
[ ] Define role tier split — which roles go to each agent
[ ] Recruitment and Senior Recruiter confirm boundary
[ ] Update this registry
```

---

---

# FINANCIAL TEAM

---

## 🧾 Controller / Accounting
**File:** `dormant/controller.md` · **Model:** claude-haiku-4-5 · **Splits from:** CFO

### Activate when CFO reports any of these
- [ ] Day-to-day bookkeeping is consuming CFO time that should go to strategy
- [ ] Month-end close is being delayed due to operational accounting volume
- [ ] AR or AP management is falling behind

### Takes over from CFO
Bookkeeping, reconciliation, accounts payable,
accounts receivable, payroll coordination, month-end close execution

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy controller.md to .ecosystem/agents/
[ ] Transfer accounting system access
[ ] CFO and Controller confirm month-end close process
[ ] Update this registry
```

---

## 📐 FP&A Specialist
**File:** `dormant/fpa-specialist.md` · **Model:** claude-sonnet-4-5 · **Splits from:** Financial Analyst

### Activate when Financial Analyst or CFO reports any of these
- [ ] Strategic modelling demands exceed what standard analysis can provide
- [ ] Investor or board reporting requires dedicated financial modelling
- [ ] Annual budget process is too complex for the Analyst to manage alone
- [ ] Unit economics modelling is needed and not being done due to capacity

### Takes over from Financial Analyst
Strategic financial models, investor/board reporting,
business case development, budget process ownership

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy fpa-specialist.md to .ecosystem/agents/
[ ] Define model ownership split
[ ] Financial Analyst and FP&A confirm boundary
[ ] Update this registry
```

---

---

# LEGAL TEAM

---

## ⚖️ IP Specialist
**File:** `dormant/ip-specialist.md` · **Model:** claude-opus-4-5 · **Splits from:** General Counsel

### Activate when General Counsel reports any of these
- [ ] IP portfolio has grown complex enough to require dedicated management
- [ ] Patent or trademark filings are being delayed due to GC capacity
- [ ] Open source compliance is not being managed systematically
- [ ] IP due diligence is required for a transaction

### Takes over from General Counsel
IP portfolio management, patent strategy, trademark strategy,
IP licensing, open source compliance

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy ip-specialist.md to .ecosystem/agents/
[ ] Transfer IP register and all IP files
[ ] GC and IP Specialist confirm boundary on IP contract clauses
[ ] Update this registry
```

---

## 👔 Employment Counsel
**File:** `dormant/employment-counsel.md` · **Model:** claude-opus-4-5 · **Splits from:** General Counsel

### Activate when General Counsel reports any of these
- [ ] Employment law questions are arising with a frequency that affects GC capacity for commercial work
- [ ] Termination or dispute complexity has reached a level requiring specialist knowledge
- [ ] Team size has grown to a threshold where employment compliance is a full-time concern
- [ ] Employment law in multiple jurisdictions is required

### Takes over from General Counsel
All employment law — contracts, terminations, disputes,
workplace policy legal review, employment regulatory compliance

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy employment-counsel.md to .ecosystem/agents/
[ ] Transfer all employment contract templates
[ ] GC and Employment Counsel confirm escalation boundary
[ ] Update this registry
```

---

---

# SPECIALISTS

---

## 🤖 ML Engineer
**File:** `dormant/ml-engineer.md` · **Model:** claude-opus-4-5 · **Splits from:** Data Team

### Activate when Data Analyst or Data Engineer reports any of these
- [ ] A trained model needs to be deployed to production and neither agent has the skills
- [ ] Model serving infrastructure is needed beyond what Backend can build
- [ ] Model monitoring and retraining pipelines are required

### Takes over
Model productionisation, ML pipeline development,
model monitoring, feature store infrastructure, ML security

### Activation checklist
```
[ ] CEO Layer approved
[ ] Copy ml-engineer.md to .ecosystem/agents/
[ ] Brief ML Engineer on existing models and data infrastructure
[ ] Data Team and ML Engineer confirm boundary
[ ] Backend and ML Engineer confirm API integration process
[ ] Update this registry
```

---

---

## Registry Status

| Agent | Team | Status | Activated | Date |
|---|---|---|---|---|
| Database Administrator | Dev | 🔴 Dormant | — | — |
| API Designer | Dev | 🔴 Dormant | — | — |
| Platform Engineer | Dev | 🔴 Dormant | — | — |
| Design Technologist | Design | 🔴 Dormant | — | — |
| Product Analyst | Product | 🔴 Dormant | — | — |
| SDR | Sales | 🔴 Dormant | — | — |
| Growth / Paid Acquisition | Marketing | 🔴 Dormant | — | — |
| SEO Specialist | Marketing | 🔴 Dormant | — | — |
| Onboarding Specialist | CS | 🔴 Dormant | — | — |
| Technical Support Engineer | CS | 🔴 Dormant | — | — |
| L&D | HR | 🔴 Dormant | — | — |
| Senior Recruiter | HR | 🔴 Dormant | — | — |
| Controller | Financial | 🔴 Dormant | — | — |
| FP&A Specialist | Financial | 🔴 Dormant | — | — |
| IP Specialist | Legal | 🔴 Dormant | — | — |
| Employment Counsel | Legal | 🔴 Dormant | — | — |
| ML Engineer | Specialists | 🔴 Dormant | — | — |

**Total dormant: 17 agents across 9 teams**

---
*Dormant Registry v2.0 · Ecosystem v1.1 · Updated by Orchestrator on each activation*
