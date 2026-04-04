# Testing Rules

- Every behaviour change needs a test — no exceptions
- Unit tests: 90%+ coverage, no real I/O
- Test names: "should <behaviour> when <condition>"
- No describe.only / it.only in commits
- Tests must be independent — no shared mutable state
- Log tricky patterns to `memory/lessons.md`
