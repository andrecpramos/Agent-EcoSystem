---
name: scraping-conventions
description: Inject when any agent writes or reviews Web scraping code for this project.
---

# Scraping Conventions — [Project Name]

## Stack
Playwright · BeautifulSoup · Scrapy

## Rules

| Convention | Value |
|---|---|
| Rate limiting | Max [N] req/sec — fill in · respect Retry-After |
| User-Agent | [Your project user-agent string — fill in] |
| Storage | [PostgreSQL / CSV / JSON — fill in] |
| Retry strategy | Exponential backoff · max 3 retries |

---
*Edit this file with your project conventions.*
