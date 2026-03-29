#!/bin/bash
# Godot Ecosystem — Interactive Setup
# Usage: bash path/to/godot/guides/setup.sh

ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     Godot Ecosystem — Setup          ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Answer a few questions and you are ready."
echo ""

# ── Project basics ─────────────────────────────────────────────────────
echo "── Project ──────────────────────────────────────────────────────"
read -rp "Project name: " PROJECT_NAME
[ -z "$PROJECT_NAME" ] && PROJECT_NAME="My Godot Project"

read -rp "Godot version (e.g. 4.3): " GODOT_VER
[ -z "$GODOT_VER" ] && GODOT_VER="4.x"

echo ""
echo "Primary platform:"
echo "  1) PC   2) Mobile   3) Web   4) Console   5) Multi-platform"
read -rp "Platform [1-5]: " PLATFORM_NUM
case "$PLATFORM_NUM" in
  1) PLATFORM="PC" ;;
  2) PLATFORM="Mobile" ;;
  3) PLATFORM="Web" ;;
  4) PLATFORM="Console" ;;
  *) PLATFORM="Multi-platform" ;;
esac

read -rp "One sentence — what are you building? " PROJECT_GOAL
[ -z "$PROJECT_GOAL" ] && PROJECT_GOAL="[Fill in .ecosystem/config.md]"

# ── Team selection ─────────────────────────────────────────────────────
echo ""
echo "── Teams ────────────────────────────────────────────────────────"
echo ""
echo "  dev     — Scene Architect, Gameplay Programmer, Shader Dev, Tool Scripter"
echo "  design  — Level Designer, UI Designer, Audio Designer, VFX Designer"
echo "  qa      — Playtester, Performance Analyst"
echo "  ops     — JIRA Ops, Notion Ops"
echo ""
read -rp "Teams to install (space-separated, default: dev): " TEAMS_INPUT
if [ -z "$TEAMS_INPUT" ]; then
  echo "  At least one team is required."
  exit 1
fi
read -ra SELECTED_TEAMS <<< "$TEAMS_INPUT"
TEAM_COUNT=${#SELECTED_TEAMS[@]}

# ── Integrations ───────────────────────────────────────────────────────
echo ""
echo "── Integrations (press Enter to skip) ──────────────────────────"
read -rp "JIRA project key (e.g. MYGAME): " JIRA_KEY
read -rp "Notion database ID: " NOTION_ID

# ── Confirm ────────────────────────────────────────────────────────────
echo ""
echo "── Installing ───────────────────────────────────────────────────"
echo "  Project : $PROJECT_NAME (Godot $GODOT_VER — $PLATFORM)"
echo "  Teams   : ${SELECTED_TEAMS[*]}"
[ -n "$JIRA_KEY" ]  && echo "  JIRA    : $JIRA_KEY"
[ -n "$NOTION_ID" ] && echo "  Notion  : $NOTION_ID"
echo ""
read -rp "Proceed? [Y/n]: " CONFIRM
[[ "$CONFIRM" =~ ^[Nn] ]] && echo "Cancelled." && exit 0
echo ""

# ── Install ────────────────────────────────────────────────────────────
echo "[1/5] Creating .ecosystem/ ..."
mkdir -p .ecosystem/logs .ecosystem/skills/custom .ecosystem/skills/anthropic
mkdir -p .ecosystem/tasks/templates .ecosystem/dormant

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

echo "[2/5] Writing .ecosystem/config.md ..."
cat > .ecosystem/config.md << CONFIGEOF
# Project Config — $PROJECT_NAME
name        : $PROJECT_NAME
type        : godot game
goal        : $PROJECT_GOAL
phase       : production
godot_ver   : $GODOT_VER
platform    : $PLATFORM

## Active teams
$(for t in "${SELECTED_TEAMS[@]}"; do echo "  $t"; done)

## Integrations
jira_project  : ${JIRA_KEY:-# not set}
notion_db_id  : ${NOTION_ID:-# not set}

## Thresholds
token_budget        : 300000
write_verify        : true
jira_auto_update    : $([ -n "$JIRA_KEY" ] && echo "true" || echo "false")
notion_auto_update  : $([ -n "$NOTION_ID" ] && echo "true" || echo "false")
CONFIGEOF
echo "     ✓ config.md written"

echo "[3/5] Prefilling code-conventions skill ..."
sed -i "s/\[Project Name\]/$PROJECT_NAME/g; s/\[4.x\]/$GODOT_VER/g" \
  .ecosystem/skills/custom/code-conventions.md 2>/dev/null || true
echo "     ✓ code-conventions.md ready — add your naming patterns"

echo "[4/5] Installing teams ..."
for team in "${SELECTED_TEAMS[@]}"; do
  src="$ECOSYSTEM_SRC/library/agents/$team"
  if [ ! -d "$src" ]; then
    echo "     ⚠  Unknown team: $team — skipping"
    continue
  fi
  mkdir -p ".claude/agents/$team"
  cp "$src/"*.md ".claude/agents/$team/"
  count=$(ls ".claude/agents/$team/" | wc -l)
  echo "     ✓ $team ($count agents)"
done

echo "[5/5] Installing orchestrator + .gitignore ..."
echo "@.ecosystem/CLAUDE.md" > CLAUDE.md

if [ "$TEAM_COUNT" -gt 1 ]; then
  cp "$ECOSYSTEM_SRC/.ecosystem/CLAUDE.md" .ecosystem/CLAUDE.md
  echo "     ✓ Master Orchestrator → .ecosystem/CLAUDE.md"
else
  team="${SELECTED_TEAMS[0]}"
  agent_file=".claude/agents/$team/orchestrator.md"
  if [ -f "$agent_file" ]; then
    { echo "# ${team^} Team — Single-team mode"; echo ""; cat "$agent_file"; } > .ecosystem/CLAUDE.md
    echo "     ✓ ${team^} Orchestrator → .ecosystem/CLAUDE.md"
  fi
fi

[ ! -f .gitignore ] && touch .gitignore
for entry in ".ecosystem/" ".claude/agents/" "CLAUDE.md"; do
  grep -qxF "$entry" .gitignore 2>/dev/null || echo "$entry" >> .gitignore
done
echo "     ✓ .gitignore updated"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║          Setup complete ✓            ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  $PROJECT_NAME is ready."
echo ""
echo "  What to do now:"
echo "  ① Open .ecosystem/skills/custom/code-conventions.md"
echo "    → Add your naming patterns and autoload structure"
echo "  ② Open .ecosystem/skills/custom/scene-conventions.md"
echo "    → Add your folder layout and node naming rules"
echo ""
echo "  Then open Claude Code and give a task."
echo "  Start with: 'Design a scene contract for [your first scene]'"
echo ""
echo "  To add a team later:"
echo "  bash .ecosystem/add-team.sh [dev|design|qa|ops]"
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
