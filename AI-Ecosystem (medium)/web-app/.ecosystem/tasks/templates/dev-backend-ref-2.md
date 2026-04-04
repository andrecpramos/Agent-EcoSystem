# Dev / Backend — Reference 2

```

Every integration is documented:
- What it does
- What the failure modes are
- What the fallback behaviour is
- Who owns the relationship with the vendor

### Background Jobs and Queues
- Long-running operations run as background jobs — not blocking API responses
- Every job has: a name, a defined retry policy, a timeout, and a dead letter destination
- Job failures are logged and alerted — silent failures are not acceptable
- Idempotency: every job that can be retried must produce the same result if run twice

### Security at the API Level
- Input validation: every input is validated before it touches business logic
- OWASP Top 10 is a checklist — not a concept
- SQL injection: parameterised queries always — no string concatenation in queries
- XSS: output encoding for every dynamic value returned in HTML contexts
- CORS: explicitly configured — no wildcard origins in production
- Secrets: never in code, never in logs — environment variables or secrets manager

### Performance
- Define SLAs for every endpoint category:

```
