#!/bin/bash
# Mobile App Ecosystem — Setup
ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║        Mobile App Ecosystem        ║"
echo "╚══════════════════════════════════════╝"
echo ""

echo "── Project ──────────────────────────────────────────────────────"
read -rp "Project name: " PROJECT_NAME
[ -z "$PROJECT_NAME" ] && PROJECT_NAME="My Project"
read -rp "Primary platform (ios/android/both/rn): " PLATFORM
[ -z "$PLATFORM" ] && PLATFORM="both"
read -rp "Min iOS version (e.g. 16): " IOS_MIN
read -rp "Min Android API level (e.g. 28): " ANDROID_MIN
read -rp "Goal (one sentence): " PROJECT_GOAL

echo ""
echo "── Teams ────────────────────────────────────────────────────────"
echo "Available: dev design qa ops"
read -rp "Teams to install (default: dev): " TEAMS_INPUT
if [ -z "$TEAMS_INPUT" ]; then
  echo "  At least one team is required."
  exit 1
fi
read -ra SELECTED_TEAMS <<< "$TEAMS_INPUT"
TEAM_COUNT=${#SELECTED_TEAMS[@]}

echo ""
echo "── Integrations (Enter to skip) ─────────────────────────────────"
read -rp "JIRA project key: " JIRA_KEY
read -rp "Notion database ID: " NOTION_ID

echo ""
read -rp "Proceed? [Y/n]: " CONFIRM
[[ "$CONFIRM" =~ ^[Nn] ]] && echo "Cancelled." && exit 0
echo ""

echo "[1/5] Creating .ecosystem/ ..."
mkdir -p .ecosystem/logs .ecosystem/skills/custom .ecosystem/tasks/templates .ecosystem/dormant
cp "$ECOSYSTEM_SRC/.ecosystem/AGENT_STANDARDS.md" .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/mcp-map.md" .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/skills/SKILLS.md" .ecosystem/skills/
cp "$ECOSYSTEM_SRC/.ecosystem/skills/custom/"*.md .ecosystem/skills/custom/ 2>/dev/null || true
cp "$ECOSYSTEM_SRC/.ecosystem/tasks/templates/"*.md .ecosystem/tasks/templates/ 2>/dev/null || true
cp "$ECOSYSTEM_SRC/.ecosystem/dormant/"*.md .ecosystem/dormant/ 2>/dev/null || true
cp "$ECOSYSTEM_SRC/.ecosystem/add-team.sh" .ecosystem/ 2>/dev/null || true
printf "| When | team/Agent | Status | Task |\n|---|---|---|---|\n" > .ecosystem/agent-sessions.md
printf "| When | Agent | Type | What happened |\n|---|---|---|---|\n" > .ecosystem/logs/errors.md
printf "SESSION LEDGER\nBudget    : 300,000t\nUsed      : 0t\nRemaining : 300,000t\n" > .ecosystem/logs/token-ledger.md
printf "| # | Type | Priority | From | Need | Status |\n|---|---|---|---|---|---|\n" > .ecosystem/tickets.md
echo "     ✓ .ecosystem/ ready"

echo "[2/5] Writing config.md ..."
cat > .ecosystem/config.md << CONFIGEOF
name        : $PROJECT_NAME
type        : mobile
goal        : ${PROJECT_GOAL:-[fill in]}
platform    : ${PLATFORM:-both}
ios_min     : ${IOS_MIN:-16}
android_min : ${ANDROID_MIN:-28}

## Active teams
$(for t in "${SELECTED_TEAMS[@]}"; do echo "  $t"; done)

## Integrations
jira_project  : ${JIRA_KEY:-# not set}
notion_db_id  : ${NOTION_ID:-# not set}
jira_auto_update : $([ -n "$JIRA_KEY" ] && echo "true" || echo "false")
CONFIGEOF
echo "     ✓ config.md written"

echo "[3/5] Prefilling skills ..."
sed -i "s/\[Project Name\]/$PROJECT_NAME/g" .ecosystem/skills/custom/*.md 2>/dev/null
echo "     ✓ swift-conventions.md + kotlin-conventions.md — add your naming patterns"

echo "[4/5] Installing teams ..."
for team in "${SELECTED_TEAMS[@]}"; do
  src="$ECOSYSTEM_SRC/library/agents/$team"
  [ ! -d "$src" ] && echo "     ⚠  Unknown: $team" && continue
  mkdir -p ".claude/agents/$team"
  cp "$src/"*.md ".claude/agents/$team/"
  echo "     ✓ $team ($(ls .claude/agents/$team/ | wc -l) agents)"
done

echo "[5/5] Installing orchestrator + .gitignore ..."
echo "@.ecosystem/CLAUDE.md" > CLAUDE.md
if [ "$TEAM_COUNT" -gt 1 ]; then
  cp "$ECOSYSTEM_SRC/.ecosystem/CLAUDE.md" .ecosystem/CLAUDE.md
  echo "     ✓ Master Orchestrator → .ecosystem/CLAUDE.md"
else
  team="${SELECTED_TEAMS[0]}"
  [ -f ".claude/agents/$team/orchestrator.md" ] && \
    { echo "# ${team^} — Single-team mode"; echo ""; cat ".claude/agents/$team/orchestrator.md"; } > .ecosystem/CLAUDE.md
  echo "     ✓ ${team^} Orchestrator → .ecosystem/CLAUDE.md"
fi
[ ! -f .gitignore ] && touch .gitignore
for entry in ".ecosystem/" ".claude/agents/" "CLAUDE.md"; do
  grep -qxF "$entry" .gitignore || echo "$entry" >> .gitignore
done
echo "     ✓ .gitignore updated"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║          Setup complete ✓            ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  $PROJECT_NAME is ready."
echo "  ① Edit .ecosystem/skills/custom/ — fill in your conventions"
echo "  ② Open Claude Code and give a task"
echo "  ③ Add a team later: bash .ecosystem/add-team.sh [team]"
echo ""

# ── Optional: remove AI-Ecosystem source folder ──────────────────────
echo "────────────────────────────────────────────────────────────────"
echo "  The AI-Ecosystem source folder is no longer needed."
read -rp "  Delete AI-Ecosystem source folder? [y/N]: " DELETE_SRC
if [[ "$DELETE_SRC" =~ ^[Yy] ]]; then
  rm -rf "$ECOSYSTEM_SRC"
  echo "  ✓ Source folder deleted."
fi
echo ""
