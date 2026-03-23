#!/usr/bin/env node
/**
 * Ecosystem Session Hook
 * Lightweight session state helper — no external dependencies.
 *
 * Commands:
 *   restore  — SessionStart: print last summary as context (if < 72h old)
 *   compact  — PreCompact:   remind Orchestrator to save summary before compaction
 *   remind   — Stop:         light reminder if summary is stale
 */

'use strict';

const fs   = require('fs');
const path = require('path');

const ROOT         = process.env.CLAUDE_PROJECT_DIR || process.cwd();
const SUMMARY_PATH = path.join(ROOT, '.ecosystem', 'logs', 'session-summary.md');
const MAX_AGE_H    = 72; // restore summaries up to 72 h old

const cmd = process.argv[2] || 'status';

function ageHours(filePath) {
  try {
    return (Date.now() - fs.statSync(filePath).mtimeMs) / 3_600_000;
  } catch {
    return Infinity;
  }
}

switch (cmd) {

  case 'restore': {
    const age = ageHours(SUMMARY_PATH);
    if (age < MAX_AGE_H) {
      const content = fs.readFileSync(SUMMARY_PATH, 'utf8').trim();
      if (content) {
        console.log(`\n[SESSION RESTORE — ${Math.round(age)}h ago]\n${content}\n`);
      }
    }
    break;
  }

  case 'compact': {
    // Output is injected into context before compaction — remind Orchestrator
    console.log(
      '\n[PRE-COMPACT] Save session state now.\n' +
      'Orchestrator: before context is trimmed, write SESSION SUMMARY to ' +
      '.ecosystem/logs/session-summary.md\n'
    );
    break;
  }

  case 'remind': {
    const age = ageHours(SUMMARY_PATH);
    if (age > 4) {
      // Only nag if summary is older than 4 h (i.e. likely not saved this session)
      console.log(
        '\n[SESSION END] No recent summary found. ' +
        'If this session had meaningful work, ask Orchestrator to write a SESSION SUMMARY.\n'
      );
    }
    break;
  }

}

// Hooks must always exit 0 — never crash Claude Code
process.exit(0);
