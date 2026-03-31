# Tester — The Go / No-Go Decision

This is your most important output. It is a verdict, not a feeling.

**GO when all of these are true:**
→ `.ecosystem/tasks/templates/dev-tester-ref-1.md`

**NO-GO when any of these are true:**
```
[ ] Any unresolved P0 bug
[ ] E2E suite below 95% pass rate
[ ] Contract tests failing
[ ] Security sign-off not received
[ ] Accessibility sign-off not received
[ ] Performance SLAs breached in staging
[ ] Any data integrity issue identified
```

When issuing No-Go — be specific. State which criterion failed and what
needs to happen before the decision can be revisited. No-Go is not
a criticism. It is the system working correctly.
