namespace Virgil.Graphics {
    public enum FontHinting {
        NORMAL = 0,
        LIGHT = 1,
        MONO = 2,
        NONE = 3;

        public SDLTTF.FontHinting to_sdl () {
            switch (this) {
                case NORMAL:
                    return SDLTTF.FontHinting.NORMAL;

                case LIGHT:
                    return SDLTTF.FontHinting.LIGHT;

                case MONO:
                    return SDLTTF.FontHinting.MONO;

                case NONE:
                    return SDLTTF.FontHinting.NONE;

                default:
                    return SDLTTF.FontHinting.NORMAL;
            }
        }
    }
}
