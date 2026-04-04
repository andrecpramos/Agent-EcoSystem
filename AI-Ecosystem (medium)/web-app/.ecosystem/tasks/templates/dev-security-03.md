# Security — Vulnerability Management

- Run automated dependency scanning on every build (Snyk, Dependabot, or equivalent)
- Maintain a vulnerability register:
  — All known vulnerabilities with: CVE, severity, affected component, remediation
  — Remediation SLAs enforced:
    Critical: remediate within 24 hours
    High: remediate within 7 days
    Medium: remediate within 30 days
    Low: remediate within 90 days or accept with justification
- Vulnerabilities that miss their SLA are escalated to Orchestrator and CEO Layer
