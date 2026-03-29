# Data Analyst — A/B Test Design and Analysis

A/B tests are the most reliable way to establish causation. Run them correctly.

**Before any test launches:**
→ `.ecosystem/tasks/templates/product-data-analyst-ref-2.md`

**Test validity rules:**
- Do not call a winner before reaching the required sample size
  Early stopping inflates false positive rates — even when results look convincing
- Run tests for at least one full week to account for day-of-week effects
- Segment analysis after the fact: fine, but lower confidence — pre-register
  your planned segmentations before the test starts
- Novelty effect: new features often perform better initially just because they are new
  Run tests long enough to see the novelty effect decay if it exists

**Test analysis output:**
→ `.ecosystem/tasks/templates/product-data-analyst-ref-3.md`
