using SDL;

using Virgil;
using Virgil.Graphics;
using Virgil.Debug;

namespace Virgil.Core {
    public class Renderer {
        private Video.Renderer _renderer;

        internal Video.Renderer sdl_renderer {
            get { return _renderer; }
        }

        public Renderer (Window window) {
            _renderer = Video.Renderer.create (window.sdl_window, -1, 0);
        }

        public int clear () {
            return _renderer.clear ();
        }

        public int clear_colour (Colour colour) {
            Colour old = new Colour ();

            _renderer.get_draw_color (out old.red, out old.green, out old.blue, out old.alpha);
            _renderer.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);

            int clear_code = clear ();

            _renderer.set_draw_color (old.red, old.green, old.blue, old.alpha);

            return clear_code;
        }

        public int clear_colour_rgb (uint8 red, uint8 green, uint8 blue) {
            uint8 current_red, current_green, current_blue;

            _renderer.get_draw_color (out current_red, out current_green, out current_blue, null);
            _renderer.set_draw_color (red, green, blue, uint8.MAX);

            int clear_code = _renderer.clear ();

            _renderer.set_draw_color (current_red, current_green, current_blue, uint8.MAX);

            return clear_code;
        }

        public void present () {
            _renderer.present ();
        }

        public void render_texture (Texture2D texture, int x, int y) {
            Rectangle quad = texture.get_bounds ();

            _renderer.copy (
                texture.sdl_texture,
                null, { x, y, quad.width, quad.height }
            );
        }

        public void render_texture_point (Texture2D texture, Point point) {
            Rectangle quad = texture.get_bounds ();

            _renderer.copy (
                texture.sdl_texture,
                null, { point.x, point.y, quad.width, quad.height }
            );
        }

        //  public void render_texture_rotate (Texture2D texture) {
        //      _renderer.copyex (texture, null, )
        //  }

        public int set_render_colour (Colour colour) {
            return _renderer.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);
        }

        public Colour get_render_colour () {
            uint8 red, green, blue, alpha;

            _renderer.get_draw_color (out red, out green, out blue, out alpha);

            return new Colour (red, green, blue, alpha);
        }
    }
}
