namespace Virgil.Graphics {
    public class Font {
        private SDLTTF.Font* _font;
        private string _file;
        private int _size;
        private int _index;

        internal SDLTTF.Font sdl_font {
            get { return _font; }
        }

        public Font (string file, int size, int index = 0) {
            _file = file;
            _size = size;

            _font = new SDLTTF.Font.index (_file, _size, _index);
        }

        ~Font () {
            delete _font;
        }
    }
}
