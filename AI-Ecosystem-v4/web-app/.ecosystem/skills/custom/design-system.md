---
name: design-system
description: Apply when designer, frontend, or brand-designer agents create UI components or visual designs. Enforces project-specific design tokens, component patterns, and brand visual identity.
---

# Design System

## Tokens
<!-- Your actual token values - paste from Figma or token file -->

### Colours
```
color.brand.primary    : [hex]   — [usage: CTAs, links]
color.brand.secondary  : [hex]   — [usage: accents]
color.feedback.error   : [hex]   — [usage: error states]
color.feedback.success : [hex]   — [usage: success states]
color.surface.default  : [hex]   — [usage: page background]
color.surface.raised   : [hex]   — [usage: cards, modals]
color.text.primary     : [hex]   — [usage: body text]
color.text.secondary   : [hex]   — [usage: labels, captions]
```

### Typography
```
font.display  : [family] — [weight] — [usage: headings]
font.body     : [family] — [weight] — [usage: body text]
font.mono     : [family] — [usage: code]
```

### Spacing scale
```
space.xs  : 4px
space.sm  : 8px
space.md  : 16px
space.lg  : 24px
space.xl  : 32px
space.2xl : 48px
space.3xl : 64px
```

## Component rules
- [e.g. All buttons use the Button component — never raw <button>]
- [e.g. Cards always have 16px padding and 8px border-radius]
- [e.g. Form inputs always show error message below — never as tooltip]

## What we never do visually
- [e.g. Never use shadows above elevation.mid for UI elements]
- [e.g. Never place text directly on the brand primary colour]
- [e.g. Never use animation durations above 300ms for UI responses]

---
*Fill in with your actual design system values.*
*Remove this note when the template is complete.*
