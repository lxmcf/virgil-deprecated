project ('virgil', [ 'vala', 'c' ], version: '0.1.0', license: 'MIT')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir / 'vapi'
is_subproject = meson.is_subproject ()

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Programs
vala_lint = find_program ('io.elementary.vala-lint', required : false)

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir
]

cc_arguments = [
    '-DSTB_IMAGE_IMPLEMENTATION',

    # Temporarily remove some aspects of STBI
    '-DSTBI_NO_GIF',
    '-DSTBI_NO_LINEAR',
    '-DSTBI_NO_HDR',
    '-DSTBI_NO_LINEAR'
]

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

# Dependencies and VAPI
dependencies = [
    dependency ('glib-2.0'),
    dependency ('gobject-2.0'),
]

dependencies_external = [
    cc.find_library ('m')
]

dependencies_vapi = [
    valac.find_library ('stb_image', dirs: vapi_dir)
]

if is_subproject
    dependencies_external += [
        meson.get_compiler ('c').find_library ('SDL2'),
        meson.get_compiler ('c').find_library ('SDL2_ttf')
    ]

    dependencies_vapi += [
        meson.get_compiler ('vala').find_library ('sdl2', dirs: vapi_dir),
        meson.get_compiler ('vala').find_library ('SDL2_ttf', dirs: vapi_dir)
    ]

    libvirgil_dep_dependencies = [ dependencies, dependencies_external, dependencies_vapi ]
else
    dependencies += [ dependency ('SDL2'), dependency ('SDL2_ttf') ]
endif

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

    vala_header: 'virgil.h',
    vala_vapi: 'virgil.vapi',

    install: true,
    install_dir: [ true, true, true ]
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

if not is_subproject
    pkgconfig = import ('pkgconfig')

    virgil_pkg = pkgconfig.generate (
        libvirgil,
        name: 'virgil',
        requires: dependencies,
        description: 'A basic game engine!',
        version: meson.project_version(),
        url: 'https://github.com/lxmcf/virgil',
    )
endif
