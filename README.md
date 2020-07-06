# Virgil

Virgil is a basic 2D game engine built using [SDL2](https://www.libsdl.org/index.php) and [Vala](https://wiki.gnome.org/Projects/Vala); designed for Linux and directly built for [elementary OS](https://elementary.io)...

### What is Virgil?

The Vala Game Library (VGL), or formally known as 'Virgi' is my answer to 'if I can't find it, I'll make it'. I grew tired of installing Windows VM's to use common 2D game engines and having to run around in circles finding a Linux compatible engine I can use to fruitlessly make simple games.

Virgil is built from the ground up using Vala and the SDL2 library and it's sister libraries such as SDL2Image, this is my first major project as well as my first dip into 'proper development' using a new language.

### Dependencies

- `glib-2.0`
- `gobject-2.0`
- `libsdl2-dev`
- `libsdl2-image-dev`
- `meson`

> _**Note:** Virgil can run on Mac OS with the use of `brew` but is not officially supported._


### Compiling &amp; running

```sh
meson build --prefix=/usr
cd build
ninja

# Demo app
./virgil-demo
```

> _**Note:** Virgil is not affiliated with the [elementary OS](https://elementary.io) project, I just love what they are doing!_

### Operating System Support

If you are interested in using Virgil and want some help, the below table is an up to date place you can find what platforms are officially supported by Virgil, please keep in mind this is not set in stone and community members are encouragede to fork and build your own port for a new platform.

| OS | Architecture | Support Level |
|:-:|:-:|:-:|
| Linux | x86_64 | Full |
| Linux | armhf | Full |
| Linux | aarch64 | Full |
| Linux | RISC-V | Planned |
| MacOS | x86_64 | Partial |
| MacOS | aarch64 | Partial |
| BSD | x86_64 | Minimal |
| Windows | x86_64 | None |
| Windows | aarch64 | None |
| WSL | x86_64 | None |
| WSL | aarch64 | None |
