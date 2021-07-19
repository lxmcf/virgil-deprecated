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

        public StaticTexture2D render (string text, Colour colour) {
            SDL.Video.Surface* surface = _font->render (text, { colour.red, colour.green, colour.blue, colour.alpha });

            TextureRaw* raw = render_raw (text, colour);

            delete surface;

            StaticTexture2D new_texture = new StaticTexture2D.from_texture_raw (raw);

            delete raw;

            return new_texture;
        }

        public TextureRaw render_raw (string text, Colour colour) {
            SDL.Video.Surface* surface = _font->render (text, { colour.red, colour.green, colour.blue, colour.alpha });

            TextureRaw raw = new TextureRaw (surface->w, surface->h);
            raw.set_pixels (surface->pixels);

            delete surface;

            return raw;
        }
    }
}
