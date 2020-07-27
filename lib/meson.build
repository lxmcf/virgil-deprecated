# Config data
config_data = configuration_data ()
config_data.set ('PROJECT_NAME', meson.project_name ())
config_data.set ('PROJECT_VERSION', meson.project_version ())

config_header = configure_file (
    input: 'Config.vala.in',
    output: 'Config.vala',
    configuration: config_data
)

# Virgil library
libvirgil_sources = files (
    'Game.vala',
    'GameObject.vala',
    'GameState.vala',

    'Constants.vala',

    'IO/Asset.vala',
    'IO/FileUtility.vala',
    'IO/AssetType.vala',

    'Math/Vector2f.vala',
    'Math/Vector2i.vala',

    'Input/Items/KeyItem.vala',
    'Input/Items/MouseItem.vala',
    'Input/MouseButton.vala',
    'Input/KeyState.vala',
    'Input/Key.vala',

    'Graphics/Sprite.vala',
    'Graphics/Colour.vala',
    'Graphics/Surface.vala',

    'Engine/EventManager.vala',
    'Engine/FramerateManager.vala',
    'Engine/WindowManager.vala',
    'Engine/KeyboardManager.vala',
    'Engine/MouseManager.vala',
    'Engine/RenderManager.vala'
)
