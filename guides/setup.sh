#!/bin/bash
# Ecosystem + Skills setup — run once from your project root
# Usage: bash path/to/Ecosystem_Skills_v3/guides/setup.sh

ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"

echo ""
echo "Setting up Ecosystem + Skills..."
echo ""

# 1. .claude/agents — Claude Code reads subagents from here
echo "1/5  Installing subagents..."
mkdir -p .claude/agents
cp "$ECOSYSTEM_SRC/.claude/agents/"*.md .claude/agents/
echo "     $(ls .claude/agents/ | wc -l) agents installed → .claude/agents/"

# 2. CLAUDE.md — Orchestrator instructions (project root)
echo "2/5  Installing Orchestrator instructions..."
cp "$ECOSYSTEM_SRC/CLAUDE.md" ./CLAUDE.md
echo "     CLAUDE.md → project root"

# 3. .skills — skills library
echo "3/5  Setting up skills library..."
mkdir -p .skills/custom
mkdir -p .skills/anthropic
cp "$ECOSYSTEM_SRC/.skills/SKILLS.md" .skills/
cp "$ECOSYSTEM_SRC/.skills/custom/"*.md .skills/custom/
for skill in docx pdf pptx xlsx frontend-design product-self-knowledge; do
  [ -d "/mnt/skills/public/$skill" ] && \
    ln -sf "/mnt/skills/public/$skill" ".skills/anthropic/$skill"
done
echo "     $(ls .skills/anthropic/ | wc -l) Anthropic + $(ls .skills/custom/ | wc -l) custom templates → .skills/"

# 4. .ecosystem — runtime state
echo "4/5  Creating runtime state folder..."
mkdir -p .ecosystem/logs
cp "$ECOSYSTEM_SRC/guides/PROJECT_CONFIG_TEMPLATE.md" .ecosystem/config.md
printf "| When | Agent | Status | Task |\n|---|---|---|---|\n" > .ecosystem/agent-sessions.md
printf "| When | Agent | Type | What happened |\n|---|---|---|---|\n" > .ecosystem/logs/errors.md
printf "| When | Service | Cooldown |\n|---|---|---|\n" > .ecosystem/logs/rate-limits.md
printf "SESSION LEDGER\nBudget    : 300,000t\nUsed      : 0t\nRemaining : 300,000t\n" > .ecosystem/logs/token-ledger.md
printf "| # | Type | Priority | From | Need | Status |\n|---|---|---|---|---|---|\n" > .ecosystem/tickets.md
echo "     .ecosystem/ created"

# 5. dormant agents (available but not loaded)
echo "5/5  Creating task files..."
mkdir -p tasks
cp "$ECOSYSTEM_SRC/tasks/todo.md" tasks/
cp "$ECOSYSTEM_SRC/tasks/lessons.md" tasks/
mkdir -p tasks/templates
cp "$ECOSYSTEM_SRC/tasks/templates/"*.md tasks/templates/ 2>/dev/null || true
echo "     tasks/todo.md + tasks/lessons.md created"

echo "6/6  Staging dormant agents..."
mkdir -p .dormant
cp "$ECOSYSTEM_SRC/dormant/"*.md .dormant/
echo "     $(ls .dormant/ | wc -l) dormant agents → .dormant/"

echo ""
echo "✅ Done."
echo ""
echo "Next steps:"
echo "  1. Fill in .ecosystem/config.md"
echo "  2. Fill in .skills/custom/ with your project conventions"
echo "  3. Open Claude Code — give a task"
echo ""
echo "To activate a dormant agent when needed:"
echo "  cp .dormant/[agent-name].md .claude/agents/"
echo ""
