using Virgil.Engine;
using Virgil.FileSystem;

using SDL;

namespace Virgil.Graphics {
    public class Font {
        private uint8[] _data;
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

        public Font () { }
    }
}
