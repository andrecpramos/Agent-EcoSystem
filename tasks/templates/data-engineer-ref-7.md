# Data Engineer — Reference 7

```
Raw (bronze)    : Exact copy of source data — never modified
                  Retained: per retention schedule
                  Purpose: source of truth, reprocessing

Transformed (silver): Cleaned, joined, standardised
                  Business logic applied
                  Purpose: foundation for analytics tables

Aggregated (gold): Summarised, business-ready metrics
                  What the Data Analyst primarily queries
                  Purpose: fast, reliable reporting
```
