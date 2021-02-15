using SDL;

using Virgil;

namespace Virgil.Core {
    public class GameRenderer {
        private Video.Renderer _renderer;

        public Video.Renderer sdl_renderer {
            get { return _renderer; }
        }

        public GameRenderer (GameWindow window) {
            _renderer = Video.Renderer.create (window.sdl_window, -1, 0);
        }

        public int clear () {
            return _renderer.clear ();
        }

        public int clear_colour (Colour colour) {
            Colour old_colour = new Colour ();

            _renderer.get_draw_color (out old_colour.red, out old_colour.green, out old_colour.blue, out old_colour.alpha);
            _renderer.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);

            int clear_code = clear ();

            _renderer.set_draw_color (old_colour.red, old_colour.green, old_colour.blue, old_colour.alpha);

            return clear_code;
        }

        public int clear_colour_rgb (uint8 red, uint8 green, uint8 blue) {
            uint8 r, g, b;

            _renderer.get_draw_color (out r, out g, out b, null);
            _renderer.set_draw_color (red, green, blue, uint8.MAX);

            int clear_code = _renderer.clear ();

            _renderer.set_draw_color (r, g, b, uint8.MAX);

            return clear_code;
        }

        public void present () {
            _renderer.present ();
        }
    }
}
