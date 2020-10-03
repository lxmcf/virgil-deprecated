<h1 align="center">Changelog</h1>

### Version 0.0.4 `(Current)`
---
#### Added:
- `check_key_pressed` & `check_key_released` methods in the KeyboardHandler
- `check_button_pressed` & `check_button_released` methods in the MouseHandler
- Vector2 & Vector3 data types
- Rectangle data type
- Font data type
- Colour can now be made from stanard `uint32` colour code
- `RenderQueue` is now used to draw sprites
- `RenderQueue` can be used to draw strings
- Changelog history


#### Changed:
- Complete ground up code re-write
- Framerate manager now works

#### Removed:
- VVFS (Replaced by `Virgil.FileSystem.Asset`)
- Vector2f
- Vector2i



### Version 0.0.3
---
#### Added:
- Implemented VVFS to bridge between GResource
- Implemented [vala lint](https://github.com/vala-lang/vala-lint)

#### Changed:
- Updated README
- Updated code format

#### Removed:
- Removed File.vala in favour of VVFS



### Version 0.0.2
---
#### Added:
- New GameState class to allow easy access to all managers
- New Keyboard and Mouse input managers

#### Changed:
- Code cleanup
- Begun preparations for building VVFS
- Migrated to a new project layout

#### Removed:



### Version 0.0.1
---
#### Added:
- Basic implimentation of sprite rendering
- Skeleton framework for events
- Basic framerate manager

#### Changed:
- N/A

#### Removed:
- N/A
