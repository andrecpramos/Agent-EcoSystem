# Game State Architecture

**Project:** [name]
**Owner:** gameplay-programmer

---

## State structure
```
GameState (autoload)
├── current_level : String
├── player_health : int
├── inventory     : Array[ItemResource]
└── save_version  : int
```

## Persistence rules
- Saved to disk: [what is persisted]
- Session only: [what resets on restart]
- Never persisted: [what is always runtime-computed]

## State transitions
| From | To | Trigger |
|---|---|---|
| MainMenu | Gameplay | "start_game" signal |
| Gameplay | Paused | pause button |
| Gameplay | GameOver | player_health == 0 |

## Save/load
- Format: [JSON / binary Resource]
- Path: `user://save.dat`
- Version check: compare save_version before loading
