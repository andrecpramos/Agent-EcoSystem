# Devops — Monitoring and Observability

Three pillars — all required:

**Metrics** (numbers over time)
- Application metrics: request rate, error rate, latency (p50/p95/p99)
- Infrastructure metrics: CPU, memory, disk, network per service
- Business metrics: defined with Product Manager — key product events
- Alerting thresholds: defined per metric, reviewed quarterly

**Logs** (what happened and when)
- Structured logging — JSON format, consistent fields across all services
- Required fields: timestamp, service, level, requestId, userId (if applicable)
- Log levels used correctly:
  ERROR: something failed that should not have
  WARN: something unexpected but handled
  INFO: normal significant events (user actions, job completions)
  DEBUG: development only — never in production
- No sensitive data in logs — ever
- Log retention: defined and enforced

**Traces** (how a request moved through the system)
- Distributed tracing implemented across all services
- Every external API call is traced
- Trace IDs are included in error responses for debuggability
- Slow trace alerts defined and actioned

**Alerting rules:**
- Every alert has a runbook — an alert without a runbook is noise
- Alerts are reviewed monthly — remove ones that never fire or always fire
- On-call rotation is defined — who responds when, and how to escalate
