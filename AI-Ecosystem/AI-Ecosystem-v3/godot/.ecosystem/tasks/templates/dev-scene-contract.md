# Scene Contract Template

**Scene name:** [filename.tscn]
**Owner:** scene-architect
**Status:** Draft / Approved

---

## Purpose
[One sentence: what this scene represents in the game]

## Root node
- **Type:** [Node2D / Node3D / Control / etc.]
- **Name:** [PascalCase matching filename]

## Node hierarchy
```
[SceneName] (Node2D)
├── [ChildNode] ([Type]) — [purpose]
│   └── [GrandchildNode] ([Type]) — [purpose]
└── [ChildNode] ([Type]) — [purpose]
```

## Exported variables (public API)
| Variable | Type | Default | Purpose |
|---|---|---|---|
| `move_speed` | float | 200.0 | Movement speed in px/s |

## Signals emitted
| Signal | Data | Trigger |
|---|---|---|
| `player_died` | none | health reaches zero |
| `item_collected` | item_id: String | collision with item |

## Physics layers / masks
| Property | Value | Reason |
|---|---|---|
| collision_layer | [bits] | [what this scene IS] |
| collision_mask | [bits] | [what this scene DETECTS] |

## Dependencies
- Requires: [list any autoloads or scenes this must exist alongside]
- Provides: [what other scenes can safely reference from this one]

## Notes
[Any implementation constraints for gameplay-programmer]
