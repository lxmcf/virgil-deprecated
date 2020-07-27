using Virgil.Graphics;

namespace Virgil {
    public class RenderManager {
        public SDL.Video.Renderer? render;
        public Surface? target;

        public Colour background_colour;

        public void initialise (WindowManager window, uint32 flags = 0) {
            background_colour = new Colour ();

            render = SDL.Video.Renderer.create (window.get_window (), -1, flags);
        }

        public unowned SDL.Video.Renderer get_renderer () {
            return render;
        }

        public Colour get_background_colour () {
            return background_colour;
        }

        public void set_background_colour (Colour colour) {
            background_colour = colour;
        }

        public int set_target (Surface new_target) {
            target = new_target;

            return 0;
        }

        public Surface? get_target () {
            return target;
        }

        public int clear () {
            set_renderer_colour (background_colour);

            return render.clear ();
        }

        public void present () {
            render.present ();
        }

        public int draw_sprite (Sprite sprite, int x, int y) {
            return render.copy (sprite.texture, sprite.get_texture_rectangle (), sprite.get_output_rectangle (x, y));
        }

        public void set_renderer_colour (Colour colour) {
            render.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);
        }
    }
}
