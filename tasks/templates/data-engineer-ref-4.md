# Data Engineer — Reference 4

```
Completeness   : Are all expected records present? Are required fields populated?
                 Measure: % of records with null values in non-nullable fields
                 Alert threshold: > 0.1% null rate in critical fields

Accuracy       : Does the data reflect reality?
                 Measure: Comparison to source system for key fields
                 Alert threshold: > 0.5% discrepancy rate vs source

Consistency    : Is the same entity represented the same way across tables?
                 Measure: Referential integrity checks, duplicate detection
                 Alert threshold: Any referential integrity violation

Timeliness     : Is the data current enough for its intended use?
                 Measure: Lag between source event and availability in warehouse
                 Alert threshold: Defined per pipeline based on SLA

Uniqueness     : Are records distinct where they should be?
                 Measure: Duplicate detection on primary keys
                 Alert threshold: Any duplicate on a defined unique key
```
