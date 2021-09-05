version = meson.project_version ().split ('.')

config_data = configuration_data ()
config_data.set ('PROJECT_VERSION', meson.project_version ())
config_data.set ('PROJECT_MAJOR', version[0].to_int ())
config_data.set ('PROJECT_MINOR', version[1].to_int ())
config_data.set ('PROJECT_MICRO', version[2].to_int ())

config_header = configure_file (
    input: 'Config.vala.conf',
    output: 'Config.vala',
    configuration: config_data
)

project_sources = files (
    'Virgil.vala',
    'Game.vala',
    'Point.vala',
    'Vector2.vala',
    'Rectangle.vala',
    'Colour.vala',
    'Grid.vala',
    'Constants.vala',

    'Core/EventHandler.vala',
    'Core/Window.vala',
    'Core/Renderer.vala',
    'Core/FramerateHandler.vala',

    'Debug/BlockTimer.vala',
    # 'Debug/Print.vala',

    'Graphics/Texture2D.vala',
    'Graphics/DynamicTexture2D.vala',
    'Graphics/StaticTexture2D.vala',
    'Graphics/TextureRaw.vala',
    'Graphics/RenderQueue.vala',
    'Graphics/RenderQueueCall.vala',
    'Graphics/RenderSortMode.vala',
    'Graphics/Surface.vala',
    'Graphics/Font.vala',

    'Graphics/Cache/FontTexture.vala',

    'Graphics/BlendMode.vala',
    'Graphics/TextureType.vala',

    'Scenes/Scene.vala',
    'Scenes/SceneManager.vala',

    'Stb/Image.vala',

    'Math/PerlinGenerator.vala',
    'Math/Math.vala',

    'Input/KeyboardKey.vala',
    'Input/KeyState.vala',
    'Input/Keyboard.vala',

    'Input/Button.vala',
    'Input/MouseButton.vala',
    'Input/Mouse.vala',

    # Don't compile the gamepad stuff... I haven't even started it

    # 'Input/Controller.vala',
    # 'Input/Gamepad.vala'
)
