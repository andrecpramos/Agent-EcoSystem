---
name: playwright-conventions
description: Inject when any agent writes or reviews Playwright/Puppeteer automation code for this project.
---

# Playwright Conventions — [Project Name]

## Stack
Playwright · TypeScript

## Rules

| Convention | Value |
|---|---|
| Test structure | Page Object Model — always |
| Selectors | Prefer: data-testid > aria > semantic HTML > CSS |
| Waits | waitForSelector · waitForResponse — never waitForTimeout |
| Parallelism | [workers: N — fill in based on machine/CI] |

---
*Edit this file with your project conventions.*
