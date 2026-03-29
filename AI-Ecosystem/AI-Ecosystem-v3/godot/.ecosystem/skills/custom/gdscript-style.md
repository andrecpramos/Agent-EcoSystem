---
name: gdscript-style
description: Inject when reviewing GDScript for style and quality issues beyond basic conventions. Covers performance patterns, signal hygiene, and common Godot pitfalls.
---

# GDScript Style Guide

## Performance
- Avoid string-based node lookups in hot paths (`$"path"` is fine in _ready, not in _process)
- Cache node references in _ready: `@onready var sprite = $Sprite2D`
- Prefer `@export` arrays over multiple @export variables for related data
- Use `call_deferred()` when modifying the scene tree from a signal

## Signal hygiene
- Connect in _ready, disconnect in _exit_tree if the object outlives the signal emitter
- Check `is_connected()` before connecting to avoid duplicates
- Prefer signal connections in code over editor connections — easier to track

## Common pitfalls
- Freeing a node during iteration causes bugs — use `queue_free()` not `free()`
- `delta` in _process is variable — multiply movement by delta always
- Physics changes belong in _physics_process — not _process
- Never yield in _ready or _process — use signals or coroutines

---
