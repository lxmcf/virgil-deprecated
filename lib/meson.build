# Config data
config_data = configuration_data ()
config_data.set ('PROJECT_NAME', meson.project_name ())
config_data.set ('PROJECT_VERSION', meson.project_version ())

config_header = configure_file (
    input: 'Config.vala.in',
    output: 'Config.vala',
    configuration: config_data
)

# Virgil Library Source Files
libvirgil_sources = files (
    'Game.vala',
    'Constants.vala',
    'Colour.vala',
    'Rectangle.vala',
    'Vector2.vala',
    'Vector3.vala',

    'Engine/GameWindow.vala',
    'Engine/GameRenderer.vala',
    'Engine/EventHandler.vala',
    'Engine/KeyboardHandler.vala',
    'Engine/MouseHandler.vala',

    'FileSystem/Asset.vala',

    'Graphics/Sprite.vala',

    'Input/KeyState.vala',
    'Input/MouseButton.vala',
    'Input/Items/KeyItem.vala',
    'Input/Items/MouseItem.vala'
)
