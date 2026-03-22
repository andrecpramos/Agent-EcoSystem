# Data Engineer — Reference 1

```
Idempotency     : Running the pipeline twice produces the same result as running it once.
                  No duplicate records created by a re-run.

Observability   : Every pipeline has logging, metrics, and alerting.
                  A pipeline that fails silently is worse than no pipeline.

Recoverability  : Every pipeline can be restarted from a checkpoint.
                  Full re-runs from scratch are acceptable for small pipelines only.

Testability     : Every transformation has a test.
                  Pipeline logic is unit-testable without running the full pipeline.

Documentation   : Every pipeline has a README:
                  — What data it processes
                  — Where the data comes from
                  — What transformations are applied
                  — Where the data goes
                  — How often it runs
                  — How to debug common failures
```
