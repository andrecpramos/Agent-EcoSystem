#!/bin/bash
# setup.sh — Run once from your project root
# Usage: bash /path/to/ECOSYSTEM_V2/00_START_HERE/setup.sh

ECOSYSTEM_SRC="$(cd "$(dirname "$0")/.." && pwd)"
PROJECT_ROOT="$(pwd)"

echo ""
echo "Setting up Agent Ecosystem v2.0..."
echo ""

echo "1/5  Creating .ecosystem folder structure..."
mkdir -p .ecosystem/agents
mkdir -p .ecosystem/dormant
mkdir -p .ecosystem/logs
mkdir -p .ecosystem/docs/decisions
mkdir -p .ecosystem/docs/runbooks

echo "2/5  Copying protocols..."
cp "$ECOSYSTEM_SRC/02_PROTOCOLS/AGENT_STANDARDS.md" .ecosystem/
cp "$ECOSYSTEM_SRC/02_PROTOCOLS/ECO-PROTO-01.md" .ecosystem/

echo "3/5  Copying command agents..."
cp "$ECOSYSTEM_SRC/01_COMMAND/"*.md .ecosystem/agents/

echo "4/5  Copying dormant registry..."
cp "$ECOSYSTEM_SRC/03_DORMANT/"*.md .ecosystem/dormant/

echo "5/5  Creating error log and tickets file..."
cat > .ecosystem/logs/errors.md << 'ERROREOF'
# Error Log
Newest entries at the top. Never delete entries.

| When | Agent | What happened |
|---|---|---|
ERROREOF

cat > .ecosystem/tickets.md << 'TICKETEOF'
# Request Tickets
All cross-team requests logged here. Orchestrator manages this file.

| # | Type | Priority | From | Need | Status |
|---|---|---|---|---|---|
TICKETEOF

cp "$ECOSYSTEM_SRC/00_START_HERE/PROJECT_CONFIG_TEMPLATE.md" .ecosystem/config.md

echo ""
echo "✅ Done. Your ecosystem is ready."
echo ""
echo "Next steps:"
echo "  1. Open .ecosystem/config.md — fill in your project name and active agents"
echo "  2. Copy team agents you need:"
echo "     cp $ECOSYSTEM_SRC/teams/dev/*.md .ecosystem/agents/"
echo "     cp $ECOSYSTEM_SRC/teams/design/*.md .ecosystem/agents/"
echo "  3. Start the Orchestrator:"
echo '     claude --system-prompt "$(cat .ecosystem/AGENT_STANDARDS.md .ecosystem/agents/orchestrator.md)"'
echo ""
