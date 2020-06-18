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

    'Math/Vector2f.vala',
    'Math/Vector2i.vala',

    'Input/Key.vala',
    'Input/MouseButton.vala',

    'Graphics/Sprite.vala',
    'Graphics/Colour.vala',

    'Engine/EventManager.vala',
    'Engine/FramerateManager.vala',
    'Engine/WindowManager.vala',
    'Engine/KeyboardManager.vala'
)
