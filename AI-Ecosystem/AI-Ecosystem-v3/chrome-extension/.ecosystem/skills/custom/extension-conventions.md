---
name: extension-conventions
description: Inject when any agent writes or reviews Chrome extension code for this project.
---

# Extension Conventions — [Project Name]

## Stack
JavaScript/TypeScript · Manifest V3

## Rules

| Convention | Value |
|---|---|
| Naming | Files: kebab-case · Classes: PascalCase · Variables: camelCase |
| Storage | chrome.storage.local for persistence · chrome.storage.session for tab-scoped |
| Messaging | [document your message types here] |
| Patterns we avoid | eval() · inline scripts · external CDN links |

---
*Edit this file with your project conventions.*
