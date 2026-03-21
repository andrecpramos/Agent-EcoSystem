---
name: api-conventions
description: Apply when backend agent designs or implements API endpoints. Enforces project-specific API patterns, error codes, response shapes, versioning strategy, and authentication conventions.
---

# API Conventions

## Response envelope
<!-- Every endpoint returns this exact shape -->
```json
{
  "success": true,
  "data": {},
  "error": null,
  "meta": {
    "timestamp": "ISO8601",
    "version": "v1",
    "requestId": "uuid"
  }
}
```

## Error codes
<!-- Project-specific error codes - add as you build -->
| Code | Meaning | HTTP status |
|---|---|---|
| `AUTH_REQUIRED` | No valid auth token | 401 |
| `AUTH_EXPIRED` | Token expired | 401 |
| `FORBIDDEN` | Valid auth but insufficient permission | 403 |
| `NOT_FOUND` | Resource does not exist | 404 |
| `VALIDATION_FAILED` | Input validation error | 422 |
| `RATE_LIMITED` | Too many requests | 429 |
| [ADD YOUR OWN] | | |

## Endpoint naming
- [e.g. RESTful, kebab-case: GET /api/user-profiles/:id]
- [e.g. Versioned: /api/v1/...]
- [e.g. Plural nouns for collections: /users, /orders]

## Authentication
- [e.g. JWT Bearer token in Authorization header]
- [e.g. Refresh token in httpOnly cookie]
- [e.g. API keys for service-to-service: X-API-Key header]

## Pagination
```json
{
  "data": [...],
  "meta": {
    "page": 1,
    "perPage": 20,
    "total": 143,
    "hasMore": true
  }
}
```

## Rate limiting headers
```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 87
X-RateLimit-Reset: 1714000000
```

---
*Fill in before activating api-conventions as a skill.*
*Remove this note when the template is complete.*
