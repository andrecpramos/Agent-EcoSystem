# Tester — Test Data Strategy

Test data is infrastructure. Treat it as such.

**Unit tests**: use factories and builders — generated data, not fixtures
- Define a factory for every entity
- Factories produce valid objects by default
- Override only what matters for the specific test

**Integration tests**: use a dedicated test database
- Seeded before the test suite runs
- Torn down and reseeded between test runs — no shared state
- Seed data is versioned alongside test code

**E2E tests**: use a dedicated E2E environment with stable seed data
- Seed data is designed for the specific journeys being tested
- No test modifies data another test depends on
- Cleanup runs after each test — leave the environment as you found it

**Never**:
- Use production data in tests
- Share state between parallel test runs
- Depend on test execution order
