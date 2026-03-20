# START HERE — Agent Ecosystem v2.0
## 32 active agents · 17 dormant · 10 teams · 1 Orchestrator · 1 Chief of Staff

---

## Read first (in this order)

1. `02_PROTOCOLS/AGENT_STANDARDS.md` — rules every agent follows
2. `02_PROTOCOLS/ECO-PROTO-01.md` — how cross-team requests work
3. `02_PROTOCOLS/capacity-protocol.md` — how dormant agents activate
4. `01_COMMAND/orchestrator.md` — how everything is coordinated

Then open the team folder relevant to your project.

---

## Folder structure

```
00_START_HERE/       ← Start here
01_COMMAND/          ← orchestrator.md + chief-of-staff.md
02_PROTOCOLS/        ← AGENT_STANDARDS + ECO-PROTO-01 + capacity + MCP map
03_DORMANT/          ← dormant-registry.md + 17 dormant agent files
teams/
  design/   7 agents  designer, ux-researcher, brand-designer, motion-designer,
                       accessibility, content-designer, design-docs
  dev/      6 agents  frontend, backend, tester, devops, security, dev-docs
  product/  2 agents  product-manager, product-docs
  sales/    3 agents  sales-manager, account-executive, sales-docs
  marketing/3 agents  marketing-strategist, content-agent, marketing-docs
  cs/       3 agents  cs-manager, support-agent, cs-docs
  hr/       3 agents  hr-manager, recruitment, hr-docs
  financial/3 agents  cfo, financial-analyst, financial-docs
  legal/    3 agents  general-counsel, compliance, legal-docs
  specialists/3 agents data-analyst, data-engineer, vendor-procurement
```

---

## New project setup (15 minutes)

```bash
# 1. Copy this entire folder into your project as .ecosystem/
cp -r . /your-project/.ecosystem/

# 2. Fill in config
open /your-project/.ecosystem/00_START_HERE/PROJECT_CONFIG_TEMPLATE.md
# Save as .ecosystem/config.md

# 3. Copy only active team agents to .ecosystem/agents/
mkdir -p /your-project/.ecosystem/agents
cp 01_COMMAND/*.md /your-project/.ecosystem/agents/
cp teams/dev/*.md /your-project/.ecosystem/agents/        # if Dev active
cp teams/design/*.md /your-project/.ecosystem/agents/     # if Design active
# ... copy only the teams in your config

# 4. Copy protocols
cp 02_PROTOCOLS/AGENT_STANDARDS.md /your-project/.ecosystem/
cp 02_PROTOCOLS/ECO-PROTO-01.md /your-project/.ecosystem/

# 5. Set up dormant registry
mkdir -p /your-project/.ecosystem/dormant
cp 03_DORMANT/* /your-project/.ecosystem/dormant/

# 6. Create logs folder
mkdir -p /your-project/.ecosystem/logs
echo "| When | Agent | What happened |" > /your-project/.ecosystem/logs/errors.md

# 7. Start the Orchestrator
claude --system-prompt "$(cat /your-project/.ecosystem/AGENT_STANDARDS.md \
  /your-project/.ecosystem/agents/orchestrator.md)"

# 8. First message
# "Hello. Read .ecosystem/config.md. Tell me:
#  1. Which agents are active for this project
#  2. What the first task should be
#  3. If anything is missing"
```

---

## Token efficiency — load agents correctly

Each agent file contains only what is unique to that role.
All shared rules live in AGENT_STANDARDS.md.

**Always combine both files when loading an agent:**
```bash
# In VS Code Claude Code terminal:
claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md \
  .ecosystem/agents/frontend.md)"
```

---

## The three rules

1. **Stay in your lane** — work outside skill boundary = file ticket, not do
2. **Never contact another team directly** — all requests via Orchestrator (ECO-PROTO-01)
3. **Orchestrator thinks, never produces** — gaps are assigned, never filled by Orchestrator

---

## Reusing for a new project

```
[ ] Copy .ecosystem/ folder to new project
[ ] Update config.md (project name, active teams, tools)
[ ] Copy only active team agent files
[ ] Brief Orchestrator: "Read config.md. Active agents and first priorities?"
[ ] Done — under 15 minutes
```

---
*Ecosystem v2.0 · Token-efficient · 32 active agents · 17 dormant*
