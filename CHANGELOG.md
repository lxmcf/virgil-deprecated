<h1 align="center">Changelog</h1>

### Version 0.0.5 `(Current)`
---
#### Added:
- `Font` data type
- `stb_image` to load images from memory and files
- New static `Log` class

#### Changed:
- `Vector2` and `Vector3` now use `double` rather than `float`
- `Rectangle` width and height are now uint as no need for negative sizes.
- Updated `SDL2_ttf.vapi` to latest
- `GameWindow` will now correctly update the width and height variables on creation

#### Removed:
- `Texture2D.from_data`
- `Asset` (Replaced with `from_file` and `from_resource` creation methods)
- Dependency on `SDL2_image`


 ### Version 0.0.4
---
#### Added:
- `check_key_pressed` & `check_key_released` methods in the KeyboardHandler
- `check_button_pressed` & `check_button_released` methods in the MouseHandler
- Vector2 & Vector3 data types
- Rectangle data type
- Texture2D data type
- `RenderQueue` is now used to draw sprites
- Changelog history (What you're reading)
- Beginnings of dynamic textures

#### Changed:
- Complete ground up code re-write
- Framerate manager now works

#### Removed:
- VVFS (Replaced by `Virgil.FileSystem.Asset`)
- Vector2f
- Vector2i
- `Sprite` class



### Version 0.0.3
---
#### Added:
- Basic implimentation of sprite rendering
- Skeleton framework for events
- Basic framerate manager

#### Changed:
- N/A

#### Removed:
- N/A



### Version 0.0.2
---
#### Added:
- Basic implimentation of sprite rendering
- Skeleton framework for events
- Basic framerate manager

#### Changed:
- N/A

#### Removed:
- N/A



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
