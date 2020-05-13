# Virgil

Virgil is a basic 2D game engine built using SDL2 and designed for Linux and directly compatability aimed at [Elementary OS](https://elementary.io)...

### Dependencies

- `glib-2.0`
- `gobject-2.0`
- `libsdl2-dev`
- `libsdl2-image-dev`
- `meson`

> _**Note:** Virgil can run on Mac OS with the use of `brew` but is not officially supported._


### Compiling &amp; running

```sh
meson build
cd build
ninja install

# This is a temporaray executable
./virgil-example
```

> _**Note:** Virgil is not affiliated with the [Elementary OS](https://elementary.io) project, I just love what they are doing!_
