project ('virgil', ['vala', 'c'], version: '0.0.4')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = join_paths (source_dir, 'vapi')
data_dir = join_paths (source_dir, 'data')
build_dir = join_paths (join_paths(source_dir, meson.current_build_dir ()))

vala_version = meson.get_compiler('vala').version()

if vala_version.version_compare ('<=0.43.90')
    add_project_arguments (['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')
endif

# Dependencies
libvirgil_dependencies = [
    dependency ('glib-2.0'),
    dependency ('gio-2.0'),

    meson.get_compiler ('c').find_library ('SDL2'),
    meson.get_compiler ('c').find_library ('SDL2_image'),
    meson.get_compiler ('c').find_library ('SDL2_ttf')
]

libvirgil_vapi = [
    meson.get_compiler('vala').find_library('sdl2', dirs: vapi_dir),
    meson.get_compiler('vala').find_library('SDL2_image', dirs: vapi_dir),
    meson.get_compiler('vala').find_library('SDL2_ttf', dirs: vapi_dir)
]

# Vala lint
vala_lint = find_program ('io.elementary.vala-lint', required : false)
if vala_lint.found ()
    test (
        'Vala lint',
        vala_lint,
        args: [ '-d', source_dir ]
    )
endif

subdir ('lib')
subdir ('data')

# Virgil Shared Library
libvirgil = shared_library (
    meson.project_name (),

    libvirgil_sources,
    libvirgil_resources,
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

libvirgil_dep = declare_dependency (
    link_with: libvirgil,
    version: meson.project_version (),

    dependencies: [
        libvirgil_dependencies,
        libvirgil_vapi
    ],

    include_directories: [
        include_directories ('.')
    ]
)

if not meson.is_subproject ()
    subdir ('demo')
endif
