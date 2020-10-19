using Virgil.FileSystem;

namespace Virgil.Graphics {
    public class Font {
        private SDLTTF.Font _sdl_font;

        public FontStyle style {
            get {
                return style;
            }

            set {
                style = value;
                _sdl_font.font_style = value.to_sdl ();
            }
        }

        public FontHinting hinting {
            get {
                return hinting;
            }

            set {
                hinting = value;
                _sdl_font.hinting = value.to_sdl ();
            }
        }

        public int outline_size {
            get {
                return outline_size;
            }

            set {
                outline_size = value;
                _sdl_font.outline = value;
            }
        }

        public bool size { get; private set; }

        public Font (Asset asset, int size) {
            _sdl_font = new SDLTTF.Font.RW (asset.rwops, 0, size);
            _sdl_font.outline = 1;
        }
    }
}
