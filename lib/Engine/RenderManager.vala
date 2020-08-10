using Virgil.Graphics;

namespace Virgil {
    public class RenderManager {
        private SDL.Video.Renderer? _render;

        private Colour background_colour;

        public void initialise (WindowManager window, uint32 flags = 0) {
            background_colour = new Colour ();

            _render = SDL.Video.Renderer.create (window.get_window (), -1, flags);

            int window_width;
            int window_height;

            window.get_window_size (out window_width, out window_height);
        }

        public unowned SDL.Video.Renderer get_renderer () {
            return _render;
        }

        public Colour get_background_colour () {
            return background_colour;
        }

        public void set_background_colour (Colour colour) {
            background_colour = colour;
        }

        public int clear () {
            set_renderer_colour (background_colour);

            return _render.clear ();
        }

        public void present () {
            _render.present ();
        }

        public int draw_sprite (Sprite sprite, int x, int y) {
            return _render.copy (sprite.get_texture (), sprite.get_texture_rectangle (), sprite.get_output_rectangle (x, y));
        }

        public void set_renderer_colour (Colour colour) {
            _render.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);
        }
    }
}
