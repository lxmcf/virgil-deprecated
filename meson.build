project (
    'virgil',
    'vala', 'c',
    version: '0.0.2'
)

add_project_arguments (['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = join_paths (source_dir, 'vapi')
data_dir = join_paths (source_dir, 'data')
build_dir = join_paths (join_paths(source_dir, meson.current_build_dir ()))

gnome = import ('gnome')

# Library Dependencies
libvirgil_dependencies = [
    dependency ('glib-2.0'),
    dependency ('gio-2.0'),
    dependency ('vvfs', fallback: ['libvvfs', 'libvvfs_dep']),

    meson.get_compiler ('c').find_library ('SDL2_image')
]

# VAPI Dependencies
libvirgil_vapi = [
    meson.get_compiler ('vala').find_library ('sdl2-image', dirs: vapi_dir)
]

# Subdirectories
subdir ('lib')

# Use vala-lint if installed
vala_lint = find_program ('io.elementary.vala-lint', required : false)
if vala_lint.found ()
    test (
        'Vala lint',
        vala_lint,
        args: ['-d', source_dir]
    )
else
    warning ('vala-lint was not found!')
endif

# Compile assets
libvirgil_resources = gnome.compile_resources (
    'as-resources', 'data/virgil.gresource.xml',
    source_dir: 'data/assets',
    c_name: 'as'
)

# Virgil shared library
libvirgil = library (
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
    dependencies: [
        libvirgil_dependencies,
        libvirgil_vapi
    ],
    include_directories: [ include_directories ('.') ]
)

# Only build demo if not using as a subproject
if not meson.is_subproject ()
    subdir ('demo')

    executable('virgil-demo', sources_example, dependencies: [libvirgil_dep])
endif
