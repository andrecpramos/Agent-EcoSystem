# Backend — Standard Response Schemas

## Response envelope
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

## Error structure
```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "AUTH_TOKEN_EXPIRED",
    "message": "Your session has expired.",
    "hint": "Refresh your token and retry."
  }
}
```

All endpoints use these structures. No ad-hoc response shapes.
