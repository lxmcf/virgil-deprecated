<h1 align="center">Virgil</h1>

Virgil is a basic 2D game engine built using [SDL2](https://www.libsdl.org/index.php) and [Vala](https://wiki.gnome.org/Projects/Vala); designed for Linux and directly built for [elementary OS](https://elementary.io)...

### What is Virgil?
---

The Vala Game Library (VGL), or formally known as 'Virgil' is my answer to 'if I can't find it, I'll make it'. I grew tired of installing Windows VM's to use common 2D game engines and having to run around in circles finding a Linux compatible engine I can use to fruitlessly make simple games.

Virgil is built from the ground up using Vala and the SDL2 library and it's sister libraries such as SDL2Image, this is my first major project as well as my first dip into 'proper development' using a new language.

### Dependencies
---

- `glib-2.0`
- `libsdl2-image-dev`
- `libsdl2-dev`
- `meson`

> _**Note:** Virgil can run on Mac OS with the use of `brew` but is not 100% supported at this stage._


### Compiling &amp; running
---

```sh
meson build
cd build
ninja

# Demo app
demo/virgil-demo
```

> _**Note:** Virgil is not affiliated with the [elementary OS](https://elementary.io) project, I just love what they are doing!_

### Operating System Support
---

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

### FAQ
---

**Q: Why is Windows not supported? Do you hate Windows?**

A: I don't hate Windows at all, it is a great OS for what it does, however Virgil was a birthed from me not wanting switching to Linux a few years ago and not having access to my then preferred game engine ([GMS2](https://www.yoyogames.com/)) and the tools I found were not what I wanted, so Linux/UNIX is my target.

**Q: Will Virgil ever officially support Windows?**

A: Nope, Virgil will always be officially exclusive to Linux and UNIX systems, however if you wish to create a Windows compatible fork of Virgil, I encourage you to do it!

**Q: Will Virgil ever cost money?**

A: Never, Virgil will remain a FOSS piece of software and I will NEVER charge for use of Virgil, however if enough interest is gathered, I may consider donations but have no plans at this stage!
