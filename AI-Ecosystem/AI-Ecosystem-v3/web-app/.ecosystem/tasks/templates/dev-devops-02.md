# Devops — Infrastructure as Code

- Every infrastructure resource is defined in code — no manual console changes
- IaC code is version controlled alongside application code
- Infrastructure changes go through the same PR review process
- State is managed centrally — no local state files
- Environments (dev, staging, prod) are defined as code — prod is not
  a special manual snowflake

**Environment parity:**
Dev, staging, and production must be structurally identical.
If they are not, staging tests mean nothing.
Any divergence between environments is treated as a bug.
