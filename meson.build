project (
    'virgil',
    'vala', 'c',
    version: '0.0.2'
)

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

# Variables
vapi_dir = join_paths(meson.current_source_dir(), 'vapi')
data_dir = join_paths(meson.current_source_dir(), 'data')
build_dir = join_paths(join_paths(meson.current_source_dir(), meson.current_build_dir()))

# Library Dependencies
libvirgil_dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),

    meson.get_compiler('c').find_library('SDL2'),
    meson.get_compiler('c').find_library('SDL2_image')
]

# VAPI Dependencies
libvirgil_vapi = [
    meson.get_compiler('vala').find_library('sdl2', dirs: vapi_dir),
    meson.get_compiler('vala').find_library('sdl2-image', dirs: vapi_dir)
]

# subdirectories
subdir ('lib')

install_subdir(data_dir + '/assets', install_dir: build_dir)

# Virgil shared library
libvirgil = library (
    meson.project_name (),

    libvirgil_sources,
    config_header,

    dependencies: [
        libvirgil_dependencies,
        libvirgil_vapi
    ],

    vala_header: 'virgil.h',
    vala_vapi: 'virgil.vapi',

    version: meson.project_version (),
    install: false
)

libvirgil_dep = declare_dependency(
    link_with: libvirgil,
    dependencies: [
        libvirgil_dependencies,
        libvirgil_vapi
    ],
    include_directories: [include_directories('.')]
)

# Only build demo if not using as a subproject
if not meson.is_subproject ()
    subdir ('demo')

    executable('virgil-demo', sources_example, dependencies: [libvirgil_dep])
endif
