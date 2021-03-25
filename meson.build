project ('virgil', [ 'vala', 'c' ], version: '1.0')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir /'vapi'
is_subproject = meson.is_subproject ()
build_type = get_option ('build_type')
profile = get_option ('profile')

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Programs
pkgconfig = import ('pkgconfig')
# gir_compiler = find_program ('g-ir-compiler', required: false)
vala_lint = find_program ('io.elementary.vala-lint', required : false)

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir
]

cc_arguments = [
    '-DSTB_IMAGE_IMPLEMENTATION'
]

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

# Dependencies and VAPI
dependencies = [
    dependency ('glib-2.0'),
    dependency ('gobject-2.0'),
    dependency ('SDL2')
]

dependencies_external = [
    cc.find_library ('m')
]

dependencies_vapi = [
    valac.find_library ('stb_image', dirs: vapi_dir)
]

subdir ('src')

# Vala lint
if vala_lint.found ()
    test ('Vala lint', vala_lint, args: [ '-d', source_dir ])
endif

# Library
libvirgil = library (
    meson.project_name (),

    project_sources,
    config_header,

    dependencies: [
        dependencies,
        dependencies_vapi,
        dependencies_external
    ],

    include_directories: [
        include_directories ('include')
    ],

    # BUG: This sets the vapi header to GameState.h?
    # vala_header: 'virgil.h',
    # vala_vapi: 'virgil.vapi',

    install: true,
    install_dir: [ true, true, true]
)

libvirgil_dep = declare_dependency (
    link_with: libvirgil,
    version: meson.project_version (),

    dependencies: [
        dependencies
    ],

    include_directories: [
        include_directories ('.')
    ]
)

virgil_pkg = pkgconfig.generate(
    libvirgil,
    name: 'virgil',
    requires: dependencies,
    # subdirs: [ 'virgil' ],
    description: 'elementary\'s Application Framework',
    version: meson.project_version(),
    url: 'https://github.com/elementary/granite',
)
