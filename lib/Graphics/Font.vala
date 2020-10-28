using Virgil.Engine;
using Virgil.FileSystem;

using SDL;

namespace Virgil.Graphics {
    public class Font {
        private Bytes _data;
        private SDLTTF.Font _font;

        public int size;

        public FontStyle style {
            get {
                return style;
            }

            set {
                style = value;
            }
        }

        public FontHinting hinting {
            get {
                return hinting;
            }

            set {
                hinting = value;
            }
        }

        public int outline_size {
            get {
                return outline_size;
            }

            set {
                outline_size = value;
            }
        }

        public Font (int size = 16) {
            
        }

        public Font.from_rwops (RWops rwops, int size = 16, bool free_source = false) {
            base.from_rwops (rwops, free_source);

            this.size = size;
        }

        public Font.from_data (uint8[]? data, int size = 16) {
            base.from_data (data);

            this.size = size;
        }

        public Font.from_asset (Asset asset, int size = 16) {
            base.from_asset (asset);

            _data = new Bytes (asset.get_data ());
        }

        private void _create_sdl (uint8[] data) {
            _font = new SDLTTF.Font.RW (
                new RWops.from_mem (data, data.length),
                1,
                size
            );
        }

        public override void set_data () {

        }

        public SDLTTF.Font? to_sdl () {
            if (get_data () == null) {
                return null;
            }

            return new SDLTTF.Font.RW (new SDL.RWops.from_mem (get_data (), length), 0, size) {
                font_style = style.to_sdl (),
                hinting = hinting.to_sdl (),
                outline = outline_size
            };
        }
    }
}
