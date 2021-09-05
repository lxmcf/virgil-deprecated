using SDL;

using Virgil.Core;

namespace Virgil.Graphics {
    public class Font {
        private SDLTTF.Font _font;
        private string _font_id;
        private string _file;
        private int _size;

        public int size {
            get { return _size; }
        }

        public string font_id {
            get { return _font_id; }
        }

        internal SDLTTF.Font sdl_font {
            get { return _font; }
        }

        public Font (string file, int size) {
            _file = file;
            _size = size;

            _font = new SDLTTF.Font (_file, _size);
            _font_id = Uuid.string_random ();
        }

        public int get_string_size (string text, out int width, out int height) {
            return _font.get_size (text, out width, out height);
        }

        public int get_string_width (string text) {
            int width;

            get_string_size (text, out width, null);

            return width;
        }

        public int get_string_height (string text) {
            int height;

            get_string_size (text, null, out height);

            return height;
        }

        public StaticTexture2D render (string text, Colour colour) {
            StaticTexture2D texture = new StaticTexture2D (0, 0);

            Video.Texture sdl_texture = Video.Texture.create_from_surface (
                Renderer.instance.sdl_renderer, _font.render (text, colour.get_sdl_colour ())
            );

            texture.set_sdl_texture ((owned)sdl_texture);

            return texture;
        }
    }
}
