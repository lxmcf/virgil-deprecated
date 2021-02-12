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

        public TextureType from_sdl (TextureAccess access) {
            switch (access) {
                case TextureAccess.STATIC:
                    return TextureType.STATIC;

                case TextureAccess.STREAMING:
                    return TextureType.STREAM;

                case TextureAccess.TARGET:
                    return TextureType.TARGET;

                default:
                    return TextureType.STATIC;
            }
        }
    }
}
