# Dormant Agent Registry — Web App Ecosystem

Agents here activate when an active agent files a CAPACITY ticket
and the Team Orchestrator approves. Volume alone never justifies activation.
Trigger: active agent's work is being distorted by a complexity mismatch.

---

## 🗄️ Database Administrator (DBA)
**File:** `dormant/dba.md` · **Model:** claude-opus-4-6 · **Splits from:** Backend

### Activate when Backend reports
- [ ] Query performance issues recurring across 2+ sprints without resolution
- [ ] A migration caused or nearly caused a production incident
- [ ] Data model has grown beyond 15 tables with complex relationships
- [ ] Backend spending 30%+ of time on data layer vs API logic

### Takes over from Backend
Schema design · query optimisation · index strategy · migration review ·
data integrity rules · backup procedures

### Activation
```
[ ] Team Orchestrator approved
[ ] Copy dba.md to .claude/agents/dev/
[ ] Brief on current schema and recent migrations
[ ] Backend and DBA confirm boundary
[ ] Update this registry — mark active
```

---

## 🔌 API Designer
**File:** `dormant/api-designer.md` · **Model:** claude-sonnet-4-6 · **Splits from:** Backend

### Activate when Backend reports
- [ ] API surface exceeds 30 endpoints and consistency is degrading
- [ ] Multiple clients consuming the API with conflicting needs
- [ ] Versioning strategy needed

### Takes over from Backend
API contract design · versioning strategy · endpoint naming conventions ·
OpenAPI/Swagger documentation · breaking change analysis

### Activation
```
[ ] Team Orchestrator approved
[ ] Copy api-designer.md to .claude/agents/dev/
[ ] Brief on current API surface and client consumers
[ ] Backend and API Designer confirm boundary
```

---

## 🤖 ML Engineer
**File:** `dormant/ml-engineer.md` · **Model:** claude-opus-4-6 · **Splits from:** Backend

### Activate when
- [ ] ML feature confirmed for the product roadmap
- [ ] Model training, evaluation, or serving infrastructure needed
- [ ] Backend spending significant time on ML concerns vs API logic

### Takes over
Model selection · training pipeline · serving infrastructure ·
feature engineering · evaluation metrics · A/B test design for models

### Activation
```
[ ] Team Orchestrator approved
[ ] Copy ml-engineer.md to .claude/agents/dev/
[ ] Brief on ML requirements and data availability
```

---
*web-app v1.0*
