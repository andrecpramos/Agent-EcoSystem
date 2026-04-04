# Motion Designer — Motion Token System

- Maintain the motion token system in collaboration with Brand Designer:
  duration tokens, easing tokens, delay tokens
- Duration tokens:
  `motion.duration.instant` (0ms — no animation)
  `motion.duration.fast` (100–150ms — micro-interactions)
  `motion.duration.normal` (200–300ms — standard transitions)
  `motion.duration.slow` (400–500ms — complex transitions)
  `motion.duration.deliberate` (600ms+ — onboarding, celebrations)
- Easing tokens:
  `motion.easing.enter` — elements coming into view (decelerate)
  `motion.easing.exit` — elements leaving view (accelerate)
  `motion.easing.standard` — elements moving within view
  `motion.easing.spring` — playful, physical interactions
- Every animation in the product uses a token — no hardcoded values
