#!/bin/bash
# Add a team to an existing Ecosystem v1.0 · web-app
project
# Usage: bash .ecosystem/add-team.sh [team]
# Run from your project root.

ECOSYSTEM_SRC="${ECOSYSTEM_SRC:-}"
TEAM="$1"

VALID_TEAMS="dev design product office ops"

# ── Find the ecosystem library ─────────────────────────────────────────
if [ -z "$ECOSYSTEM_SRC" ]; then
  # Try common locations
  for candidate in \
    "$HOME/Ecosystem_v8" \
    "$HOME/ecosystem" \
    "$(dirname "$0")/.." \
    "/opt/ecosystem"; do
    if [ -d "$candidate/library/agents" ]; then
      ECOSYSTEM_SRC="$candidate"
      break
    fi
  done
fi

if [ -z "$ECOSYSTEM_SRC" ] || [ ! -d "$ECOSYSTEM_SRC/library/agents" ]; then
  echo ""
  echo "⚠  Cannot find the Ecosystem library."
  echo "   Set ECOSYSTEM_SRC to its path and retry:"
  echo "   ECOSYSTEM_SRC=/path/to/Ecosystem_v8 bash .ecosystem/add-team.sh $TEAM"
  echo ""
  exit 1
fi

# ── Validate team ──────────────────────────────────────────────────────
if [ -z "$TEAM" ]; then
  echo ""
  echo "Usage: bash .ecosystem/add-team.sh [team]"
  echo ""
  echo "Available teams: $VALID_TEAMS"
  echo ""
  exit 1
fi

if ! echo "$VALID_TEAMS" | grep -qw "$TEAM"; then
  echo "Unknown team: $TEAM"
  echo "Available: $VALID_TEAMS"
  exit 1
fi

if [ -d ".claude/agents/$TEAM" ]; then
  echo "Team '$TEAM' is already installed."
  exit 0
fi

echo ""
echo "Adding team: $TEAM"
echo ""

# ── Install team agents ────────────────────────────────────────────────
src="$ECOSYSTEM_SRC/library/agents/$TEAM"
if [ ! -d "$src" ]; then
  echo "⚠  No agent library found for '$TEAM' at $src"
  exit 1
fi

mkdir -p ".claude/agents/$TEAM"
cp "$src/"*.md ".claude/agents/$TEAM/"
count=$(ls ".claude/agents/$TEAM/" | wc -l)
echo "  ✓ $TEAM — $count agents installed → .claude/agents/$TEAM/"

# ── Update config.md ──────────────────────────────────────────────────
if [ -f ".ecosystem/config.md" ]; then
  if ! grep -q "^  $TEAM$" .ecosystem/config.md 2>/dev/null; then
    # Append to the active teams section
    sed -i "/^## Active teams/a\\  $TEAM" .ecosystem/config.md 2>/dev/null || true
    echo "  ✓ config.md updated"
  fi
fi

# ── Switch to Master Orchestrator if now multi-team ───────────────────
ACTIVE_TEAMS=$(grep -A20 "^## Active teams" .ecosystem/config.md 2>/dev/null \
  | grep "^  " | grep -v "^  #" | wc -l)

if [ "$ACTIVE_TEAMS" -gt 1 ]; then
  # Root CLAUDE.md is always the 1-line pointer — update .ecosystem/CLAUDE.md
  echo "@.ecosystem/CLAUDE.md" > CLAUDE.md  # ensure pointer exists
  if grep -q "Single-team mode" .ecosystem/CLAUDE.md 2>/dev/null; then
    cp "$ECOSYSTEM_SRC/.ecosystem/CLAUDE.md" .ecosystem/CLAUDE.md
    echo "  ✓ Switched to Master Orchestrator → .ecosystem/CLAUDE.md ($ACTIVE_TEAMS teams)"
  elif [ ! -f .ecosystem/CLAUDE.md ]; then
    cp "$ECOSYSTEM_SRC/.ecosystem/CLAUDE.md" .ecosystem/CLAUDE.md
    echo "  ✓ Master Orchestrator → .ecosystem/CLAUDE.md"
  else
    echo "  ✓ Master Orchestrator already active"
  fi
fi

echo ""
echo "✓ Done. '$TEAM' team is ready."
echo ""
echo "  Give Claude Code a task — the orchestrator will route to $TEAM automatically."
echo ""
