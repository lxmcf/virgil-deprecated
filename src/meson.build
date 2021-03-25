config_data = configuration_data ()
config_data.set ('PROJECT_NAME', meson.project_name ())
config_data.set ('PROJECT_VERSION', meson.project_version ())
config_data.set ('PROJECT_TYPE', build_type)
config_data.set ('PROJECT_PROFILE', profile)

config_header = configure_file (
    input: 'Config.vala.conf',
    output: 'Config.vala',
    configuration: config_data
)

project_sources = files (
    'Game.vala',
    'GameState.vala',
    'Point.vala',
    'Vector2.vala',
    'Rectangle.vala',
    'Colour.vala',
    'InitFlags.vala',

    'Core/EventHandler.vala',
    'Core/GameWindow.vala',
    'Core/GameRenderer.vala',
    'Core/FramerateHandler.vala',

    'Debug/Print.vala',
    'Debug/PrintLevel.vala',

    'Graphics/Texture2D.vala',
    'Graphics/DynamicTexture2D.vala',
    'Graphics/StaticTexture2D.vala',
    'Graphics/TiledTexture2D.vala',
    'Graphics/TextureRaw.vala',
    'Graphics/RenderQueue.vala',
    'Graphics/RenderQueueCall.vala',

    'Graphics/BlendMode.vala',
    'Graphics/TextureType.vala',

    'Stb/Image.vala',

    'Input/Key.vala',
    'Input/KeyState.vala',
    'Input/Keyboard.vala'
)
