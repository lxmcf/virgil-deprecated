project ('virgil', [ 'vala', 'c' ], version: '1.0')

# Variables
source_dir  = meson.current_source_dir ()
vapi_dir    = source_dir /'vapi'

# Compilers
valac   = meson.get_compiler ('vala')
cc      = meson.get_compiler ('c')

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
project_dependencies = [
    dependency ('glib-2.0'),
    dependency ('gobject-2.0'),

    cc.find_library ('SDL2'),
    cc.find_library ('m')
]

project_vapi = [
    valac.find_library ('sdl2', dirs: vapi_dir),
    valac.find_library ('stb_image', dirs: vapi_dir)
]

subdir ('src')

# Vala lint
vala_lint = find_program ('io.elementary.vala-lint', required : false)
if vala_lint.found ()
    test ('Vala lint', vala_lint, args: [ '-d', source_dir ])
endif

# Library
project_library = static_library (
    meson.project_name (),

    project_sources,

    dependencies: [
        project_dependencies,
        project_vapi
    ],

    include_directories: [
        include_directories ('include')
    ],

    vala_header: 'virgil.h',
    vala_vapi: 'virgil.vapi',

    # install: true,
    # install_dir: [ true, true, true]
)

virgil_dep = declare_dependency (
    link_with: project_library,
    version: meson.project_version (),

    dependencies: [
        project_dependencies,
        project_vapi
    ],

    include_directories: [
        include_directories ('.')
    ]
)
