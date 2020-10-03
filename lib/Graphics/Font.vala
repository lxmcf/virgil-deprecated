using Virgil.FileSystem;

using SDLTTF;

namespace Virgil.Graphics {
    public class Font {
        private SDLTTF.Font _sdl_font;

        public bool size { get; private set; }

        public Font (Asset asset, int size) {
            _sdl_font = new SDLTTF.Font.RW (asset.rwops, 0, size);
        }
    }

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
