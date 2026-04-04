# API Conventions

- Routes: plural nouns, /api/v1/ prefix
- Response: { data: {...}, meta: { requestId } } or { error: { code, message } }
- Auth: JWT in Authorization: Bearer header only
- Always return X-RateLimit-Remaining, 429 + Retry-After when exceeded
- Never expose internal numeric IDs — use UUIDs
