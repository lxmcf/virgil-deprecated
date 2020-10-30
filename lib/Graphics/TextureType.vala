using SDL.Video;

namespace Virgil.Graphics {
    public enum TextureType {
        STATIC = 0,
        STREAM = 1,
        TARGET = 2;

        public TextureAccess to_sdl () {
            switch (this) {
                case STATIC:
                    return TextureAccess.STATIC;

                case STREAM:
                    return TextureAccess.STREAMING;

                case TARGET:
                    return TextureAccess.TARGET;

                default:
                    return TextureAccess.STATIC;
            }
        }
    }
}
