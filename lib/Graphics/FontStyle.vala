namespace Virgil.Graphics {
    public enum FontStyle {
        NORMAL = 0,
        BOLD = 1,
        ITALIC = 2,
        STRIKETHROUGH = 3,
        UNDERLINE = 4;

        public SDLTTF.FontStyle to_sdl () {
            switch (this) {
                case NORMAL:
                    return SDLTTF.FontStyle.NORMAL;

                case BOLD:
                    return SDLTTF.FontStyle.BOLD;

                case ITALIC:
                    return SDLTTF.FontStyle.ITALIC;

                case STRIKETHROUGH:
                    return SDLTTF.FontStyle.STRIKETHROUGH;

                case UNDERLINE:
                    return SDLTTF.FontStyle.UNDERLINE;

                default:
                    return SDLTTF.FontStyle.NORMAL;
            }
        }
    }
}