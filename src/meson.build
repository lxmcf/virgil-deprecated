# Config data
config_data = configuration_data ()
config_data.set ('PROJECT_NAME', meson.project_name ())
config_data.set ('VERSION', meson.project_version ())

config_header = configure_file (
    input: 'config.vala.in',
    output: 'config.vala',
    configuration: config_data
)

# Virgil library
sources_virgil = files (
    'Virgil/Game.vala',
    'Virgil/GameObject.vala',

    'Virgil/Math/Vector2D.vala',

    'Virgil/Graphics/Sprite.vala',
    'Virgil/Graphics/Colour.vala',

    'Virgil/Engine/Resource.vala'
)
