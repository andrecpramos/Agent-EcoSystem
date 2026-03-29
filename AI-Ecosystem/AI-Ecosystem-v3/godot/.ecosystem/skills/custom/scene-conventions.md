---
name: scene-conventions
description: Inject when any agent designs or reviews scene structure. Enforces project-specific scene organisation and node naming patterns.
---

# Scene Conventions — [Project Name]

## Scene structure
- [e.g. All enemy scenes inherit from base_enemy.tscn]
- [e.g. UI scenes in res://ui/, levels in res://levels/]
- [e.g. Reusable components in res://components/]

## Node naming rules
| Layer | Naming | Example |
|---|---|---|
| Root node | Matches scene filename | Player (in player.tscn) |
| Collision shapes | CollisionShape2D/3D | CollisionShape2D |
| Visual nodes | Sprite2D, MeshInstance3D | Sprite2D |
| Audio | AudioStreamPlayer suffix | FootstepAudio |

## Folder structure
```
res://
├── scenes/
│   ├── player/
│   ├── enemies/
│   ├── levels/
│   └── ui/
├── scripts/       [autoloads and utilities]
├── assets/
└── resources/     [.tres resource files]
```

---
*Edit this file — it teaches agents your project's scene organisation.*
