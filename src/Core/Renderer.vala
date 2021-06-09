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
            uint32 renderer_flags = Video.RendererFlags.ACCELERATED | Video.RendererFlags.TARGETTEXTURE;

            _renderer = Video.Renderer.create (window.sdl_window, -1, renderer_flags);
        }

        public int clear () {
            return _renderer.clear ();
        }

        public int clear_colour (Colour colour) {
            Colour* old = get_render_colour ();
            set_render_colour (colour);

            int clear_code = clear ();

            set_render_colour (old);

            delete old;

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

        public int render_texture (Texture2D texture, int x, int y) {
            Rectangle quad = texture.get_bounds ();

            return _renderer.copy (
                texture.sdl_texture,
                null, { x, y, quad.width, quad.height }
            );
        }

        public int render_texture_point (Texture2D texture, Point point) {
            return render_texture (texture, point.x, point.y);
        }

        // TODO: Impliment primitives

        public void reset_target () {
            _renderer.render_target = null;
        }

        public int set_target (Surface surface) {
            if (_renderer.is_supported ()) {
                _renderer.render_target = surface.sdl_texture;

                return EXIT_SUCCESS;
            } else {
                print_error ("Target textures not supported!");

                return EXIT_FAIL;
            }
        }

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
