#!/bin/bash
# Ecosystem v2.0 setup — run once from your project root
# Usage: bash path/to/ECOSYSTEM_V2/00_START_HERE/setup.sh

ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"
PROJECT_ROOT="$(pwd)"

echo ""
echo "Setting up Agent Ecosystem v2.0..."
echo ""

echo "1/5  Creating .ecosystem folder..."
mkdir -p .ecosystem/logs
mkdir -p .ecosystem/docs/decisions
mkdir -p .ecosystem/docs/runbooks

echo "2/5  Copying protocols..."
cp "$ECOSYSTEM_SRC/02_PROTOCOLS/AGENT_STANDARDS.md" .ecosystem/
cp "$ECOSYSTEM_SRC/02_PROTOCOLS/ECO-PROTO-01.md" .ecosystem/
cp "$ECOSYSTEM_SRC/02_PROTOCOLS/SESSION-PROTOCOL.md" .ecosystem/

echo "3/5  Installing subagents into .claude/agents/..."
mkdir -p .claude/agents
cp "$ECOSYSTEM_SRC/.claude/agents/"*.md .claude/agents/
echo "     $(ls .claude/agents/ | wc -l) subagents installed."

echo "4/5  Installing CLAUDE.md (Orchestrator instructions)..."
cp "$ECOSYSTEM_SRC/CLAUDE.md" ./CLAUDE.md

echo "5/5  Creating config, session registry, logs..."
cp "$ECOSYSTEM_SRC/00_START_HERE/PROJECT_CONFIG_TEMPLATE.md" .ecosystem/config.md

cat > .ecosystem/agent-sessions.md << 'SESSEOF'
# Agent Session Registry
# Updated by Chief of Staff when agents are spawned and complete.

| When | Agent | Status | Task |
|---|---|---|---|
SESSEOF

cat > .ecosystem/logs/errors.md << 'ERROREOF'
# Error Log — newest first

| When | Agent | Type | What happened |
|---|---|---|---|
ERROREOF

cat > .ecosystem/tickets.md << 'TICKETEOF'
# Request Tickets

| # | Type | Priority | From | Need | Status |
|---|---|---|---|---|---|
TICKETEOF

echo ""
echo "✅ Setup complete."
echo ""
echo "Next steps:"
echo "  1. Fill in .ecosystem/config.md (project name, active teams)"
echo "  2. Open Claude Code in this project"
echo "  3. Give a task — agents spawn automatically"
echo ""
echo "That's it. No terminals. No manual agent loading."
echo ""
