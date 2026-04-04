# Skill: Deploy Workflow

Pre-flight:
- [ ] git status clean
- [ ] tests passing
- [ ] build succeeds
- [ ] env vars verified
- [ ] security review clear

Steps: tag release → push tag → trigger CI/CD → monitor 5min → smoke test

Rollback: git revert <commit> && redeploy previous tag

Log to memory/lessons.md with version + env + outcome.
