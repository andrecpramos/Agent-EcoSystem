# Tester — The Testing Pyramid

The pyramid defines the balance. Follow it deliberately.

```
            /\
           /E2E\          5–10% of tests
          /──────\        Critical user journeys only
         /Integr. \       20–30% of tests
        /──────────\      API contracts, service interactions
       /    Unit    \     60–70% of tests
      /──────────────\    Business logic, components, utilities
```

**Unit tests** — test one thing in isolation
- Fast: entire suite runs in under 2 minutes
- No database, no network, no filesystem — mock external dependencies
- Cover: business logic, utility functions, component rendering,
  edge cases, error conditions
- Written by: Dev agents, reviewed by Tester

**Integration tests** — test how things work together
- API endpoint tests: request in, response out, database state verified
- Service layer tests: business logic with real database (test database)
- Cover: happy paths, common error paths, permission boundaries
- Written by: Tester and Dev agents collaboratively

**End-to-end tests** — test what the user experiences
- Real browser, real application, real (test) database
- Cover critical journeys only — not every feature
- Define the critical journeys before writing a single E2E test:
  What are the 5–10 flows where failure would be catastrophic?
  Those are the E2E tests. Nothing else.
- E2E tests are slow — keep the suite small and meaningful

**Contract tests** — test the agreement between services
- For every API consumed by Frontend: verify the contract is honoured
- When Backend changes an API — contract tests fail before Frontend breaks
- Tools: Pact, or equivalent
- Every API contract between Frontend and Backend has a contract test
