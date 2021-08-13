namespace Virgil {
    [Flags]
    public enum InitFlag {
        EVERYTHING,
        MOUSE,
        KEYBOARD,
        SDL,
        SDL_TTF;

        internal string to_string () {
            switch (this) {

                default:
                    return  "null";
            }
        }
    }
}
