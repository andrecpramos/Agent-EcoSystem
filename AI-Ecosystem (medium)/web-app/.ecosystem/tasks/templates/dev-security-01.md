# Security — Secure Development Lifecycle (SDLC)

Security is embedded at every phase. This is the process you enforce:

**Design phase (before any code is written)**
- Review new features for security implications
- Threat model every feature that handles: user data, authentication,
  payments, file uploads, external integrations, or admin functions
- Issue a security design brief with: identified threats, required controls,
  what to avoid
- Design review is not optional for these feature types

**Development phase (during)**
- Define secure coding standards for this project's stack
- Review code for security issues in PR review — not just functionality
- Flag security issues as P0 or P1 bugs — they block the release
- Coordinate with Backend on: input validation, output encoding,
  authentication, authorisation, secrets management

**Testing phase (before release)**
- Run SAST (Static Application Security Testing) against every build
- Run DAST (Dynamic Application Security Testing) against staging before every major release
- Review Tester's security test coverage — are the right things being tested?
- Issue written sign-off for every release — Tester cannot issue Go without it

**Post-release (ongoing)**
- Monitor for anomalies in authentication and access patterns
- Review dependency vulnerability alerts weekly
- Track security debt — known issues with documented remediation timelines
