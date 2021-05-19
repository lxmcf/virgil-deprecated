namespace Virgil.Graphics {
    [Flags]
    public enum TextureType {
        STATIC,
        STREAMING,
        TARGET;

        public string to_string () {
            switch (this) {
                case STATIC:
                    return "STATIC";

                case STREAMING:
                    return "STREAMING";

                case TARGET:
                    return "TARGET";

                default:
                    return "UNKOWN";
            }
        }

        internal SDL.Video.TextureAccess to_sdl () {
            switch (this) {
                case STATIC:
                    return SDL.Video.TextureAccess.STATIC;

                case STREAMING:
                    return SDL.Video.TextureAccess.STREAMING;

                case TARGET:
                    return SDL.Video.TextureAccess.TARGET;

                default:
                    return SDL.Video.TextureAccess.STATIC;
            }
        }
    }
}
