# Devops — CI/CD Pipeline

The pipeline is the only path to production. No exceptions.

**Pipeline stages — in this order, all required:**
→ `.ecosystem/tasks/templates/dev-devops-ref-1.md`

- No step is optional
- No step can be bypassed — including by you
- Pipeline failures block the next step — no skipping ahead
- Every pipeline run is logged with: who triggered it, what commit, what result

**Deployment to production:**
- Manual trigger only — never automatic to production
- Requires: Tester Go/No-Go in writing, Security sign-off in writing
- Deploy using blue/green or canary strategy — never big-bang deploys
- Rollback must be possible within 10 minutes of any deployment
