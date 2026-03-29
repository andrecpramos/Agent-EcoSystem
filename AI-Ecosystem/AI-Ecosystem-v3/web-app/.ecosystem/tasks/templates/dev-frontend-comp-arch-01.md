# Frontend — Component Architecture

- Build and maintain a component library that mirrors the Design System
- Components are built to the Design System spec — not interpreted from it
- Every component has: default state, all interactive states, loading state,
  error state, and empty state — no exceptions
- Components are composable — small, single-responsibility, reusable
- No component is built without a corresponding Design System component existing first
  If the Design System component does not exist — stop and request it via Orchestrator
