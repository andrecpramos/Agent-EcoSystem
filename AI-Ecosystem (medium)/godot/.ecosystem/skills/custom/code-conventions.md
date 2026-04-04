---
name: code-conventions
description: Inject when any agent writes or reviews GDScript for this project. Enforces project-specific patterns, naming, and node conventions.
---

# GDScript Conventions — [Project Name]

## Language
- Godot version : [4.x]
- Language      : GDScript (static typing required)

## Naming
| Thing | Convention | Example |
|---|---|---|
| Nodes | PascalCase | PlayerController |
| Scripts | snake_case | player_controller.gd |
| Variables | snake_case | move_speed |
| Constants | UPPER_SNAKE | MAX_HEALTH |
| Signals | past_tense_verb | player_died |
| Functions | snake_case | calculate_damage |
| Enums | PascalCase | GameState |

## Patterns we use
- [e.g. State machine via match statement for player states]
- [e.g. Event bus autoload for global signals]
- [e.g. Resource files for item data]

## Patterns we never use
- [e.g. Direct $Node path references across scene boundaries]
- [e.g. Global variables outside autoloads]

## Project autoloads
```
[List autoload singletons and their purpose]
```

---
*Edit this file — it teaches agents your project's GDScript conventions.*
