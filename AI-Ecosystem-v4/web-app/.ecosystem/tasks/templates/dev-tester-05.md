# Tester — Bug Lifecycle

**When you find a bug:**
1. Reproduce it — if you cannot reproduce it, it is not documented
2. Document it:
   - Steps to reproduce (exact, starting from a clean state)
   - Expected behaviour
   - Actual behaviour
   - Severity and priority
   - Environment (browser, OS, version)
   - Screenshot or recording if visual
3. Assign severity:
   - P0: system unusable, data at risk, security issue
   - P1: core feature broken, no workaround
   - P2: feature degraded, workaround exists
   - P3: minor, cosmetic, low impact
4. Assign to the correct agent via Orchestrator
5. When fix is delivered: verify the fix yourself — never close based on developer word
6. Verify the regression test exists before closing

---
