#!/bin/bash
# Ecosystem v1.0 — Web App
# Usage: cd your-project && bash path/to/AI-Ecosystem/web-app/guides/setup.sh

ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"
PROJECT_ROOT="$(pwd)"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║      Web App Ecosystem — Setup       ║"
echo "╚══════════════════════════════════════╝"
echo ""

# ─────────────────────────────────────────────────────────────────────
# STEP 1 — Project basics
# ─────────────────────────────────────────────────────────────────────
echo "── Project ──────────────────────────────────────────────────────"
read -rp "Project name: " PROJECT_NAME
[ -z "$PROJECT_NAME" ] && { echo "Project name required."; exit 1; }

read -rp "One sentence — what are you building? " PROJECT_GOAL
[ -z "$PROJECT_GOAL" ] && PROJECT_GOAL="[fill in .ecosystem/config.md]"

# ─────────────────────────────────────────────────────────────────────
# STEP 2 — Tech stack (fills code-conventions skill)
# ─────────────────────────────────────────────────────────────────────
echo ""
echo "── Tech stack ───────────────────────────────────────────────────"
read -rp "Language + framework (e.g. TypeScript/React, Python/FastAPI): " STACK
read -rp "Styling (e.g. Tailwind, CSS Modules — or: n/a): " STYLING
read -rp "Package manager (npm / yarn / pnpm / pip): " PKG_MANAGER
[ -z "$PKG_MANAGER" ] && PKG_MANAGER="npm"

# ─────────────────────────────────────────────────────────────────────
# STEP 3 — Team selection (EXPLICIT — no silent defaults)
# ─────────────────────────────────────────────────────────────────────
echo ""
echo "── Teams ────────────────────────────────────────────────────────"
echo ""
echo "  dev     — Frontend · Backend · Tester · Security · DevOps"
echo "  design  — Designer · UX Researcher · Brand · Accessibility · Content"
echo "  product — Product Manager · Data Analyst"
echo "  office  — Doc Writer · Slide Maker · Spreadsheet"
echo "  ops     — JIRA Ops · Notion Ops"
echo ""
echo "Enter the teams you want. Separate with spaces."
echo "Example: dev design"
echo "Minimum: at least one team required."
echo ""

while true; do
  read -rp "Teams to install: " TEAMS_INPUT
  [ -z "$TEAMS_INPUT" ] && { echo "  At least one team is required."; continue; }
  read -ra SELECTED_TEAMS <<< "$TEAMS_INPUT"
  # Validate each team
  VALID=true
  for t in "${SELECTED_TEAMS[@]}"; do
    if [ ! -d "$ECOSYSTEM_SRC/library/agents/$t" ]; then
      echo "  Unknown team: '$t'. Valid: dev design product office ops"
      VALID=false
      break
    fi
  done
  [ "$VALID" = true ] && break
done

TEAM_COUNT=${#SELECTED_TEAMS[@]}

# ─────────────────────────────────────────────────────────────────────
# STEP 4 — Integrations
# ─────────────────────────────────────────────────────────────────────
echo ""
echo "── Integrations (Enter to skip) ─────────────────────────────────"
read -rp "JIRA project key (e.g. MYAPP): " JIRA_KEY
read -rp "Notion database ID: " NOTION_ID

# ─────────────────────────────────────────────────────────────────────
# CONFIRM
# ─────────────────────────────────────────────────────────────────────
echo ""
echo "── Summary ──────────────────────────────────────────────────────"
echo "  Project : $PROJECT_NAME"
echo "  Stack   : $STACK"
echo "  Teams   : ${SELECTED_TEAMS[*]}"
[ -n "$JIRA_KEY" ]  && echo "  JIRA    : $JIRA_KEY"
[ -n "$NOTION_ID" ] && echo "  Notion  : $NOTION_ID"
[ "$TEAM_COUNT" -gt 1 ] && echo "  Mode    : Multi-team (Master Orchestrator)" \
                        || echo "  Mode    : Single team (${SELECTED_TEAMS[0]^} Orchestrator direct)"
echo ""
read -rp "Proceed? [Y/n]: " CONFIRM
[[ "$CONFIRM" =~ ^[Nn] ]] && echo "Cancelled." && exit 0
echo ""

# ─────────────────────────────────────────────────────────────────────
# INSTALL [1/5] — Core .ecosystem/
# ─────────────────────────────────────────────────────────────────────
echo "[1/5] Creating .ecosystem/ ..."
mkdir -p .ecosystem/logs .ecosystem/skills/custom .ecosystem/tasks/templates

cp "$ECOSYSTEM_SRC/.ecosystem/AGENT_STANDARDS.md" .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/mcp-map.md"         .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/add-team.sh"        .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/skills/SKILLS.md"   .ecosystem/skills/

# Runtime state
printf "| When | team/Agent | Status | Task |\n|---|---|---|---|\n"   > .ecosystem/agent-sessions.md
printf "| When | Agent | Type | What happened |\n|---|---|---|---|\n" > .ecosystem/logs/errors.md
printf "SESSION LEDGER\nBudget    : 300,000t\nUsed      : 0t\nRemaining : 300,000t\n" > .ecosystem/logs/token-ledger.md
printf "| # | Type | Priority | From | Need | Status |\n|---|---|---|---|---|---|\n" > .ecosystem/tickets.md
printf "# Lessons\n## Read at every session start. Apply relevant patterns before planning.\n\n| Date | What happened | Rule |\n|---|---|---|\n" > .ecosystem/tasks/lessons.md

echo "     ✓ .ecosystem/ ready"

# ─────────────────────────────────────────────────────────────────────
# INSTALL [2/5] — Config
# ─────────────────────────────────────────────────────────────────────
echo "[2/5] Writing config.md ..."
cat > .ecosystem/config.md << CONFIGEOF
# Project Config — $PROJECT_NAME
name    : $PROJECT_NAME
type    : web app
goal    : $PROJECT_GOAL
phase   : building

## Stack
language  : $STACK
styling   : $STYLING
pkg_mgr   : $PKG_MANAGER

## Active teams
$(for t in "${SELECTED_TEAMS[@]}"; do echo "  $t"; done)

## Integrations
jira_project  : ${JIRA_KEY:-# not set}
notion_db_id  : ${NOTION_ID:-# not set}
jira_auto_update  : $([ -n "$JIRA_KEY" ] && echo "true" || echo "false")
notion_auto_update: $([ -n "$NOTION_ID" ] && echo "true" || echo "false")
CONFIGEOF
echo "     ✓ config.md written"

# ─────────────────────────────────────────────────────────────────────
# INSTALL [3/5] — Skills (prefilled from project info)
# ─────────────────────────────────────────────────────────────────────
echo "[3/5] Installing skills ..."

# Primary skill: code-conventions (prefilled with project stack)
cat > .ecosystem/skills/custom/code-conventions.md << SKILLEOF
---
name: code-conventions
description: Apply when writing or reviewing code for this project.
---

# Code Conventions — $PROJECT_NAME

## Stack
- Language / framework : $STACK
- Styling              : $STYLING
- Package manager      : $PKG_MANAGER

## Naming
| Thing | Convention | Example |
|---|---|---|
| Components | PascalCase | UserCard.tsx |
| Hooks | camelCase + use prefix | useAuthState |
| Utilities | camelCase | formatDate |
| Constants | UPPER_SNAKE | MAX_RETRIES |

## Patterns we use
- [Add your patterns: state management, service layer, etc.]

## Patterns we never use
- [Add anti-patterns]

## File structure
\`\`\`
[Paste your folder structure here]
\`\`\`
SKILLEOF

# Copy remaining custom skills for the selected teams
declare -A TEAM_SKILLS
TEAM_SKILLS[design]="design-system brand-voice"
TEAM_SKILLS[dev]="api-conventions"
TEAM_SKILLS[product]=""
TEAM_SKILLS[office]="brand-voice"
TEAM_SKILLS[ops]="notion-sync"

for team in "${SELECTED_TEAMS[@]}"; do
  for skill in ${TEAM_SKILLS[$team]:-}; do
    src="$ECOSYSTEM_SRC/.ecosystem/skills/custom/$skill.md"
    [ -f "$src" ] && cp "$src" ".ecosystem/skills/custom/$skill.md"
  done
done

echo "     ✓ code-conventions.md prefilled → edit to complete"
echo "       .ecosystem/skills/custom/ — your agents read these every spawn"

# ─────────────────────────────────────────────────────────────────────
# INSTALL [4/5] — Agents + templates for selected teams only
# ─────────────────────────────────────────────────────────────────────
echo "[4/5] Installing teams and templates ..."

# Collect templates needed by selected teams only
NEEDED_TEMPLATES=""
declare -A TEAM_TEMPLATES
TEAM_TEMPLATES[dev]="dev-backend-ref-1.md dev-backend-ref-2.md dev-frontend-ref-1.md dev-frontend-ref-2.md dev-frontend-comp-arch-01.md dev-security-01.md dev-security-02.md dev-security-03.md dev-security-04.md dev-security-05.md dev-security-06.md dev-security-07.md dev-tester-01.md dev-tester-02.md dev-tester-03.md dev-tester-04.md dev-tester-05.md dev-devops-01.md dev-devops-02.md dev-devops-03.md dev-devops-04.md dev-devops-05.md codebase-snapshot-template.md"
TEAM_TEMPLATES[design]="design-accessibility-01.md design-accessibility-02.md design-accessibility-03.md design-accessibility-04.md design-accessibility-05.md design-accessibility-06.md design-accessibility-07.md design-accessibility-ref-1.md design-accessibility-ref-2.md design-brand-designer-01.md design-brand-designer-02.md design-brand-designer-03.md design-brand-designer-04.md design-brand-designer-05.md design-brand-designer-06.md design-brand-designer-07.md design-brand-designer-ref-1.md design-content-designer-01.md design-content-designer-02.md design-content-designer-03.md design-content-designer-04.md design-content-designer-05.md design-content-designer-06.md design-content-designer-ref-1.md design-design-docs-01.md design-design-docs-02.md design-design-docs-03.md design-design-docs-05.md design-design-docs-06.md design-design-docs-07.md design-design-docs-08.md design-design-docs-09.md design-design-docs-10.md design-design-docs-11.md design-designer-ref-1.md design-motion-designer-01.md design-motion-designer-02.md design-motion-designer-03.md design-motion-designer-04.md design-motion-designer-05.md design-motion-designer-ref-1.md design-ux-researcher-02.md design-ux-researcher-03.md design-ux-researcher-04.md design-ux-researcher-ref-1.md"
TEAM_TEMPLATES[product]="prd-template.md product-data-analyst-01.md product-data-analyst-02.md product-data-analyst-03.md product-data-analyst-04.md product-data-analyst-05.md product-product-docs-ref-1.md product-product-manager-ref-1.md product-decision-log-ref-1.md"
TEAM_TEMPLATES[office]="office-docs-ref.md"
TEAM_TEMPLATES[ops]=""

for team in "${SELECTED_TEAMS[@]}"; do
  # Install agents
  src="$ECOSYSTEM_SRC/library/agents/$team"
  mkdir -p ".claude/agents/$team"
  cp "$src/"*.md ".claude/agents/$team/"
  echo "     ✓ $team ($(ls .claude/agents/$team/ | wc -l) agents)"

  # Copy only this team's templates
  for tpl in ${TEAM_TEMPLATES[$team]:-}; do
    src_tpl="$ECOSYSTEM_SRC/.ecosystem/tasks/templates/$tpl"
    [ -f "$src_tpl" ] && cp "$src_tpl" ".ecosystem/tasks/templates/$tpl"
  done
done

echo "     ✓ templates installed for selected teams only"

# ─────────────────────────────────────────────────────────────────────
# INSTALL [5/5] — Orchestrator + gitignore
# ─────────────────────────────────────────────────────────────────────
echo "[5/5] Installing orchestrator ..."
echo "@.ecosystem/CLAUDE.md" > CLAUDE.md

if [ "$TEAM_COUNT" -gt 1 ]; then
  cp "$ECOSYSTEM_SRC/.ecosystem/CLAUDE.md" .ecosystem/CLAUDE.md
  echo "     ✓ Master Orchestrator → .ecosystem/CLAUDE.md"
else
  team="${SELECTED_TEAMS[0]}"
  # Wrap single-team orchestrator with triage header
  cat > .ecosystem/CLAUDE.md << ORCHEOF
---
name: ${team}-orchestrator
description: Entry point for this project. Routes tasks to agents. Never executes directly.
model: claude-opus-4-6
---

# ${team^} Team — Single-team mode
# You are the router for this project. Every task flows through you.
# You do not produce deliverables. You spawn agents.

## FIRST RULE — YOU DO NOT EXECUTE
For every task: identify the correct agent, spawn it, review output.
There is no option to execute the task yourself.

## TASK TRIAGE
Assess before every task:
- Trivial (single file/agent) → spawn that agent directly
- Multi-agent → spawn agents in parallel or sequence
- Out of scope → tell user which team handles it

ORCHEOF
  cat ".claude/agents/$team/orchestrator.md" >> .ecosystem/CLAUDE.md
  echo "     ✓ ${team^} Orchestrator → .ecosystem/CLAUDE.md (with triage header)"
fi

[ ! -f .gitignore ] && touch .gitignore
for entry in ".ecosystem/" ".claude/agents/" "CLAUDE.md"; do
  grep -qxF "$entry" .gitignore 2>/dev/null || echo "$entry" >> .gitignore
done
echo "     ✓ .gitignore updated"

# ─────────────────────────────────────────────────────────────────────
# DONE — Summary + optional source cleanup
# ─────────────────────────────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════╗"
echo "║          Setup complete ✓            ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  $PROJECT_NAME · Teams: ${SELECTED_TEAMS[*]}"
echo ""
echo "  Before you start:"
echo "  ① Edit .ecosystem/skills/custom/code-conventions.md"
echo "     → Add your naming patterns and folder structure (5 min)"
echo "  ② Open Claude Code and give a task"
echo ""
echo "  Add a team later:  bash .ecosystem/add-team.sh [team]"
echo ""

# ── Optional: remove AI-Ecosystem source folder ──────────────────────
echo "────────────────────────────────────────────────────────────────"
echo "  The AI-Ecosystem source folder is no longer needed."
echo "  Removing it keeps your project clean."
echo ""
echo "  Source: $ECOSYSTEM_SRC"
echo ""
read -rp "  Delete AI-Ecosystem source folder? [y/N]: " DELETE_SRC
if [[ "$DELETE_SRC" =~ ^[Yy] ]]; then
  rm -rf "$ECOSYSTEM_SRC"
  echo "  ✓ Source folder deleted."
else
  echo "  Source folder kept."
fi
echo ""
