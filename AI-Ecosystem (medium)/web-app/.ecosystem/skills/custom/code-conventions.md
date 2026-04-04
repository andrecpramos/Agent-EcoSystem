---
name: code-conventions
description: Apply when any agent writes or reviews code for this project. Enforces project-specific patterns, naming conventions, file structure, and architectural decisions already established in the codebase.
---

# Code Conventions

## Stack
<!-- What this project actually uses -->
- Language: [e.g. TypeScript 5.x strict mode]
- Framework: [e.g. Next.js 14, App Router]
- Styling: [e.g. Tailwind CSS with project tokens]
- State: [e.g. Zustand for global, React Query for server state]
- Testing: [e.g. Vitest + Testing Library]

## Naming

| Thing | Convention | Example |
|---|---|---|
| Components | PascalCase | `UserAuthForm.tsx` |
| Hooks | camelCase with `use` prefix | `useAuthState.ts` |
| Utilities | camelCase | `formatCurrency.ts` |
| Constants | UPPER_SNAKE_CASE | `MAX_RETRY_COUNT` |
| CSS classes | [e.g. kebab-case / BEM / Tailwind] | |
| DB tables | [e.g. snake_case plural] | `user_sessions` |
| API endpoints | [e.g. kebab-case] | `/api/user-sessions` |

## File structure
```
[Paste your actual project structure here]
src/
  components/   ← [rule: what goes here]
  hooks/        ← [rule: what goes here]
  lib/          ← [rule: what goes here]
  types/        ← [rule: what goes here]
```

## Patterns we always use
- [e.g. Service layer pattern — business logic never in controllers]
- [e.g. All API calls through a central client in lib/api/]
- [e.g. Error handling: always use Result type, never throw in services]
- [e.g. Imports: absolute paths only (@/components/...), no relative ../]

## Patterns we never use
- [e.g. No any in TypeScript — use unknown and narrow]
- [e.g. No direct fetch() in components — always through hooks]
- [e.g. No default exports — named exports only]

## ADR references
<!-- Link to key architecture decisions already made -->
- [ADR-001: Why we chose X over Y]
- [ADR-002: State management decision]

---
*Fill in this template at project start. Update when new conventions are established.*
*Remove this note when the template is complete.*
