project ('virgil', [ 'vala', 'c' ], version: '1.0.0')

# Variables
source_dir = meson.current_source_dir ()
vapi_dir = source_dir / 'vapi'

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

# Programs
vala_lint = find_program ('io.elementary.vala-lint', required : false)

# Compiler arguments
valac_arguments = [ ]

cc_arguments = [
    '-DSTB_IMAGE_IMPLEMENTATION'
]

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

# Files
project_source = []

# Dependencies and VAPI
project_dependency_libs = [
    dependency ('gobject-2.0'),
    dependency ('sdl2')
]

project_dependency_external = [
    cc.find_library ('m')
]

project_dependency_vapi = [
    valac.find_library ('stb_image', dirs: vapi_dir)
]

subdir ('src')

executable (
    meson.project_name (),
    project_source,

    dependencies: [
        project_dependency_libs,
        project_dependency_external,
        project_dependency_vapi
    ],

    include_directories: [
        include_directories ('include')
    ],
)
