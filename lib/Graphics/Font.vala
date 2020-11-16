using Virgil.Engine;
using Virgil.FileSystem;

using SDL;

namespace Virgil.Graphics {

    public class Font {
        private SDLTTF.Font _font;

        public int size;

        public FontStyle style {
            get {
                return style;
            }

            set {
                _font.font_style = value.to_sdl ();
                style = value;
            }
        }

        public FontHinting hinting {
            get {
                return hinting;
            }

            set {
                _font.hinting = value.to_sdl ();
                hinting = value;
            }
        }

        public int outline_size {
            get {
                return outline_size;
            }

            set {
                _font.outline = value;
                outline_size = value;
            }
        }

        public Font (string file, int size = 16) {
            _font = new SDLTTF.Font (file, size);

            if (_font == null) {
                Game.log.error (@"Font creation with file ??$file?? failed!");
            }
        }

        public Font.from_rwops (RWops rwops, int size = 16) {
            _font = new SDLTTF.Font.RW (rwops, 0, size);

            if (_font == null) {
                Game.log.error ("Font creation with rwops failed!");
            }
        }

        public Font.from_asset (Asset asset, int size = 16) {
            uint8[] data = asset.get_data ();

            Game.log.message (data.length.to_string ());

            SDL.RWops rwops = new SDL.RWops.from_mem (data, data.length);

            _font = new SDLTTF.Font.RW (rwops, 0, size);

            if (_font == null) {
                Game.log.error ("Font creation with asset ??" + asset.filename + "?? failed!");
            }
        }

        public unowned SDLTTF.Font? get_sdl_font () {
            return _font;
        }
    }
}
