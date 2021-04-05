project ('virgil', [ 'vala', 'c' ], version: '0.1.0')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir / 'vapi'
is_subproject = meson.is_subproject ()
build_type = get_option ('build-type')
profile = get_option ('profile')

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Programs
vala_lint = find_program ('io.elementary.vala-lint', required : false)

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir
]

if build_type == 'development'
    valac_arguments += [ '-D', 'DEVELOPMENT' ]
else
    valac_arguments += [ '-D', 'RELEASE' ]
endif

cc_arguments = [
    '-DSTB_IMAGE_IMPLEMENTATION'
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
    dependencies_external += [ meson.get_compiler ('c').find_library ('SDL2') ]
    dependencies_vapi += [ meson.get_compiler('vala').find_library('sdl2', dirs: vapi_dir) ]

    libvirgil_dep_dependencies = [ dependencies, dependencies_external, dependencies_vapi ]
else
    dependencies += [ dependency ('SDL2') ]
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

    virgil_pkg = pkgconfig.generate(
        libvirgil,
        name: 'virgil',
        requires: dependencies,
        # subdirs: [ 'virgil' ],
        description: 'A basic game engine!',
        version: meson.project_version(),
        url: 'https://github.com/lxmcf/virgil',
)
endif
