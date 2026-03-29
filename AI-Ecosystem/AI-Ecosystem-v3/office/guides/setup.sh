#!/bin/bash
# Office Ecosystem — Interactive Setup
ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║    Office Ecosystem — Setup          ║"
echo "╚══════════════════════════════════════╝"
echo ""

echo "── Organisation ─────────────────────────────────────────────────"
read -rp "Organisation name: " ORG_NAME
[ -z "$ORG_NAME" ] && ORG_NAME="My Organisation"

read -rp "One sentence — what does your team produce? " ORG_GOAL
[ -z "$ORG_GOAL" ] && ORG_GOAL="[Fill in .ecosystem/config.md]"

echo ""
echo "── Teams ────────────────────────────────────────────────────────"
echo ""
echo "  writing      — Doc Writer, Copy Editor, Researcher"
echo "  presentation — Slide Maker, Visual Designer"
echo "  data         — Spreadsheet, Data Visualiser"
echo "  ops          — Notion Ops, Gmail Ops, Calendar Ops"
echo ""
read -rp "Teams to install (default: writing): " TEAMS_INPUT
if [ -z "$TEAMS_INPUT" ]; then
  echo "  At least one team is required."
  exit 1
fi
read -ra SELECTED_TEAMS <<< "$TEAMS_INPUT"
TEAM_COUNT=${#SELECTED_TEAMS[@]}

echo ""
echo "── Integrations (Enter to skip) ─────────────────────────────────"
read -rp "Notion database ID: " NOTION_ID
read -rp "JIRA project key: " JIRA_KEY

echo ""
echo "Installing: ${SELECTED_TEAMS[*]}"
read -rp "Proceed? [Y/n]: " CONFIRM
[[ "$CONFIRM" =~ ^[Nn] ]] && echo "Cancelled." && exit 0
echo ""

echo "[1/5] Creating .ecosystem/ ..."
mkdir -p .ecosystem/logs .ecosystem/skills/custom .ecosystem/skills/anthropic
mkdir -p .ecosystem/tasks/templates .ecosystem/dormant

cp "$ECOSYSTEM_SRC/.ecosystem/AGENT_STANDARDS.md" .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/mcp-map.md" .ecosystem/
cp "$ECOSYSTEM_SRC/.ecosystem/skills/SKILLS.md" .ecosystem/skills/
cp "$ECOSYSTEM_SRC/.ecosystem/skills/custom/"*.md .ecosystem/skills/custom/ 2>/dev/null || true
for skill in docx pptx xlsx; do
  [ -d "$ECOSYSTEM_SRC/.ecosystem/skills/anthropic/$skill" ] && \
    cp -r "$ECOSYSTEM_SRC/.ecosystem/skills/anthropic/$skill" ".ecosystem/skills/anthropic/$skill"
done
cp "$ECOSYSTEM_SRC/.ecosystem/tasks/templates/"*.md .ecosystem/tasks/templates/ 2>/dev/null || true
cp "$ECOSYSTEM_SRC/.ecosystem/add-team.sh" .ecosystem/ 2>/dev/null || true

printf "| When | team/Agent | Status | Task |\n|---|---|---|---|\n" > .ecosystem/agent-sessions.md
printf "| When | Agent | Type | What happened |\n|---|---|---|---|\n" > .ecosystem/logs/errors.md
printf "SESSION LEDGER\nBudget    : 300,000t\nUsed      : 0t\nRemaining : 300,000t\n" > .ecosystem/logs/token-ledger.md
echo "     ✓ .ecosystem/ ready"

echo "[2/5] Writing .ecosystem/config.md ..."
cat > .ecosystem/config.md << CONFIGEOF
# Config — $ORG_NAME
name        : $ORG_NAME
type        : office
goal        : $ORG_GOAL

## Active teams
$(for t in "${SELECTED_TEAMS[@]}"; do echo "  $t"; done)

## Integrations
notion_db_id  : ${NOTION_ID:-# not set}
jira_project  : ${JIRA_KEY:-# not set}

## Thresholds
token_budget        : 300000
notion_auto_update  : $([ -n "$NOTION_ID" ] && echo "true" || echo "false")
CONFIGEOF
echo "     ✓ config.md written"

echo "[3/5] Prefilling brand-voice skill ..."
sed -i "s/\[Organisation Name\]/$ORG_NAME/g" .ecosystem/skills/custom/brand-voice.md 2>/dev/null
sed -i "s/\[Organisation Name\]/$ORG_NAME/g" .ecosystem/skills/custom/style-guide.md 2>/dev/null
echo "     ✓ brand-voice.md + style-guide.md ready — add your tone guidelines"

echo "[4/5] Installing teams ..."
for team in "${SELECTED_TEAMS[@]}"; do
  src="$ECOSYSTEM_SRC/library/agents/$team"
  [ ! -d "$src" ] && echo "     ⚠  Unknown: $team — skipping" && continue
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
  agent_file=".claude/agents/$team/orchestrator.md"
  [ -f "$agent_file" ] && { echo "# ${team^} Team — Single-team mode"; echo ""; cat "$agent_file"; } > .ecosystem/CLAUDE.md
  echo "     ✓ ${team^} Orchestrator → .ecosystem/CLAUDE.md"
fi

[ ! -f .gitignore ] && touch .gitignore
for entry in ".ecosystem/" ".claude/agents/" "CLAUDE.md"; do
  grep -qxF "$entry" .gitignore || echo "$entry" >> .gitignore
done

echo ""
echo "╔══════════════════════════════════════╗"
echo "║          Setup complete ✓            ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  $ORG_NAME is ready."
echo ""
echo "  ① Fill in .ecosystem/skills/custom/brand-voice.md"
echo "  ② Fill in .ecosystem/skills/custom/style-guide.md"
echo ""
echo "  Then open Claude Code: 'Write a briefing doc on [topic]'"
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
