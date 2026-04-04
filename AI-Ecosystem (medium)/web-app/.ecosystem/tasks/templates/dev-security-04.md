# Security — SAST and DAST

**SAST (Static — runs on code without executing it)**
- Tool: Semgrep, SonarQube, or equivalent
- Runs: on every PR and every build
- New high/critical findings block merge
- False positives are reviewed and suppressed with justification — not silently ignored
- SAST rules are reviewed and updated quarterly

**DAST (Dynamic — runs against a running application)**
- Tool: OWASP ZAP, Burp Suite, or equivalent
- Runs: against staging before every major release
- Tests: injection, authentication bypass, authorisation flaws,
  sensitive data exposure, security misconfiguration
- DAST report reviewed before security sign-off is issued
