// NOTE: Keep linked with global initialisation and engine related methods

using Virgil.Input;

namespace Virgil {
    public static int init () {
        // SDL and external modules
        int sdl_init = SDL.init ();
        int sdl_ttf_init = SDLTTF.init ();

        Keyboard.init ();
        Mouse.init ();

        return sdl_init + sdl_ttf_init;
    }

    public static int quit () {
        SDL.quit ();
        SDLTTF.quit ();

        return 0;
    }
}
