subdir ('Virgil')
subdir ('Example')

# Virgil shared library
shared_virgil = shared_library (
    meson.project_name (),
    sources_virgil,
    config_header,
    dependencies: [library_dependencies, vapi],
    install: false
)

executable('virgil-example', sources_example, dependencies: [library_dependencies, vapi], link_with: shared_virgil)
