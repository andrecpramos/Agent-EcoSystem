# /deploy — Deployment

1. Master reads `skills/deploy/skill.md` workflow
2. Escalates to Opus: validate readiness
3. Run pre-deploy checklist — block if anything fails
4. Ask user: "Confirm deploy to <env>? (yes/no)"
5. Execute on confirmation
6. Log outcome to `memory/lessons.md`
