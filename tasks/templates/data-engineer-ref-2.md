# Data Engineer — Reference 2

```
Every pipeline has:
  — A success alert: confirms the pipeline completed with expected record counts
  — A failure alert: fires within 5 minutes of failure
  — A latency alert: fires if the pipeline runs longer than 2x its normal duration
  — A data volume alert: fires if the record count is outside expected range
    (both too few and too many — both signal a problem)

Alert thresholds reviewed quarterly:
  — Thresholds that fire too often are adjusted (alert fatigue kills monitoring)
  — Thresholds that never fire are verified — is the alert even working?
```
