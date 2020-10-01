using SDL.Video;

using Virgil;

namespace Virgil.Engine {
    public class GameRenderer {
        private Renderer? _sdl_renderer;
        private Colour _colour;

        public GameRenderer (GameWindow window) {
            _sdl_renderer = Renderer.create (window.to_sdl (), -1, 0);
            _colour = new Colour ();
        }

        public unowned Renderer to_sdl () {
            return _sdl_renderer;
        }

        public int clear () {
            return _sdl_renderer.clear ();
        }

        public int clear_colour (Colour colour) {
            uint8 red, green, blue, alpha;
            _sdl_renderer.get_draw_color (out red, out green, out blue, out alpha);

            Colour old_colour = new Colour (red, green, blue, alpha);
            _sdl_renderer.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);

            int clear_code = clear ();

            _sdl_renderer.set_draw_color (old_colour.red, old_colour.green, old_colour.blue, old_colour.alpha);

            return clear_code;
        }

        public void present () {
            _sdl_renderer.present ();
        }
    }
}
