using SDL;

using Virgil;
using Virgil.Graphics;

namespace Virgil.Core {
    public class Renderer {
        private static Renderer? _instance = null;

        public static Renderer? instance {
            get { return _instance; }
        }

        private Video.Renderer _renderer;
        private Window _window;

        internal Video.Renderer sdl_renderer {
            get { return _renderer; }
        }

        public Renderer (Window window) {
            _window = window;

            uint32 renderer_flags = Video.RendererFlags.ACCELERATED | Video.RendererFlags.TARGETTEXTURE;

            _renderer = Video.Renderer.create (window.sdl_window, -1, renderer_flags);

            _instance = this;
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

        public int clear_colour_rgba (uint8 red, uint8 green, uint8 blue, uint8 alpha) {
            uint8 current_red, current_green, current_blue, current_alpha;

            _renderer.get_draw_color (out current_red, out current_green, out current_blue, out current_alpha);
            _renderer.set_draw_color (red, green, blue, current_alpha);

            int clear_code = _renderer.clear ();

            _renderer.set_draw_color (current_red, current_green, current_blue, current_alpha);

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

        public int render_texture_vector2 (Texture2D texture, Vector2 vector) {
            return render_texture (texture, (int)vector.x, (int)vector.y);
        }

        // TODO: Impliment primitives

        public void reset_target () {
            _renderer.render_target = null;
        }

        public int set_viewport (int x, int y, uint width = 0, uint height = 0) {
            uint temp_width = width;
            uint temp_height = height;

            if (width == 0) temp_width = _window.width;
            if (height == 0) temp_height = _window.height;

            return _renderer.set_viewport ({ x, y, temp_width, temp_height });
        }

        public int set_target (Surface surface) {
            if (_renderer.is_supported ()) {
                _renderer.render_target = surface.sdl_texture;

                return EXIT_SUCCESS;
            } else {
                print ("Target textures are not supported!");

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
