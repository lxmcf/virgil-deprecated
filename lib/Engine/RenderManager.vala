using SDL.Video;

using Virgil.Graphics;

namespace Virgil {
    public class RenderManager {
        public Renderer? render;
        public RendererInfo? render_info;

        public uint32 render_flags;
        public Colour background_colour;

        public RenderManager(SDL.Video.Window window, uint32 flags = 0) {
            render_flags = flags;
            background_colour = new Colour ();

            render = Renderer.create (window, -1, flags);
            render.get_info (out render_info);
        }

        public unowned Renderer get_renderer () {
            return render;
        }

        public Colour get_background_colour () {
            return background_colour;
        }

        public uint32 get_flags () {
            return render_info.flags;
        }

        public int clear (Colour colour = background_colour) {
            render.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);

            return render.clear ();
        }

        public void present () {
            render.present ();
        }

        public bool draw_sprite (Sprite sprite, int x, int y) {
            if (sprite.is_valid) {
                render.copy (sprite.texture, sprite.texture_rectangle, sprite.get_output_rectangle (x, y));

                return true;
            } else {
                return false;
            }
        }
    }
}
