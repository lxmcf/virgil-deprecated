project ('virgil', ['vala', 'c'], version: '0.0.1')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

# Variables
vapi_dir = join_paths(meson.current_source_dir(), 'vapi')

# Library Dependencies
library_dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),

    meson.get_compiler('c').find_library('SDL2'),
    meson.get_compiler('c').find_library('SDL2_gfx'),
    meson.get_compiler('c').find_library('SDL2_image')
]

# VAPI Dependencies
vapi = [
    meson.get_compiler('vala').find_library('sdl2', dirs: vapi_dir),
    meson.get_compiler('vala').find_library('sdl2-gfx', dirs: vapi_dir),
    meson.get_compiler('vala').find_library('sdl2-image', dirs: vapi_dir)
]

# subdirectories
subdir ('src')
subdir ('example')

shared_virgil = shared_library (
    'virgil',
    sources_virgil,
    dependencies: [library_dependencies, vapi]
)

example = executable('testing', sources_example, dependencies: [library_dependencies, vapi], link_with: shared_virgil)
