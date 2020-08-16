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
    'GameState.vala',

    'Constants.vala',

    'Interface/IGameObject.vala',

    'Input/Items/KeyItem.vala',
    'Input/Items/MouseItem.vala',
    'Input/MouseButton.vala',
    'Input/KeyState.vala',
    # 'Input/Key.vala',

    'Graphics/Sprite.vala',
    'Graphics/Colour.vala',

    'Core/EventManager.vala',
    'Core/FramerateManager.vala',
    'Core/WindowManager.vala',
    'Core/KeyboardManager.vala',
    'Core/MouseManager.vala',
    'Core/RenderManager.vala',

    'Core/Data Type/Vector2f.vala',
    'Core/Data Type/Vector2i.vala',
    'Core/Data Type/Vector3i.vala',
    'Core/Data Type/Vector3f.vala',
    'Core/Data Type/Rectangle.vala'
)
