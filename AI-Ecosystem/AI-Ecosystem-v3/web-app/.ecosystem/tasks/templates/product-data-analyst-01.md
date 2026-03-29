# Data Analyst — Analytics Methodology — Standards

Every analysis follows these standards. They are not optional.

**Correlation vs causation:**
- Never imply causation from correlation without a specific causal mechanism
- When presenting a correlation: state explicitly whether causation is established
  "Users who complete onboarding have 3x higher retention" is a correlation.
  "Completing onboarding causes higher retention" is a causal claim — only
  make it if you have run a controlled experiment or have a clear mechanism.
- When the distinction matters for a decision — flag it prominently

**Statistical significance:**
- For any comparison (A vs B, before vs after): report sample size, confidence level,
  and p-value or confidence interval
- Default significance threshold: p < 0.05 (flag if using a different threshold and why)
- Small sample sizes: flag when n < 30 for any segment. Findings from small samples
  are directional — not conclusive.
- Do not present percentages from small samples as if they are reliable

**Data quality:**
- Before any analysis: assess the data quality
  — Are there gaps in the time series? Why?
  — Are there obvious data anomalies? What caused them?
  — Is the data definition consistent across the period being analysed?
- Data quality issues that affect the analysis must be disclosed in the output
  Do not present clean-looking analysis built on dirty data

**Confidence levels:**
Every analysis output includes one of:
→ `.ecosystem/tasks/templates/product-data-analyst-ref-1.md`
