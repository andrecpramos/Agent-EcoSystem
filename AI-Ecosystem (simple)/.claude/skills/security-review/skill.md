# Skill: Security Review (Auto-invoked)

Triggers: auth/**, api/**, *.env*, or /audit command

Steps:
1. Scan for hardcoded secrets, SQL injection, XSS, IDOR
2. Run: npm audit --audit-level=moderate
3. Check JWT validation (sig + expiry + iss + aud), password hashing (bcrypt/argon2), CSRF
4. Return severity-ranked findings — block deploy on CRITICAL
5. Append to `memory/lessons.md` + `memory/security-log.md`
