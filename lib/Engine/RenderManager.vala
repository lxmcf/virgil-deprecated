using SDL.Video;

using Virgil.Graphics;

namespace Virgil {
    public class RenderManager {
        public Renderer? render;
        //public RendererInfo? render_info;

        public Colour background_colour;

        public void initialise (WindowManager window, uint32 flags = 0) {
            background_colour = new Colour ();

            render = Renderer.create (window.get_window (), -1, flags);
            //render.get_info (out render_info);
        }

        public unowned Renderer get_renderer () {
            return render;
        }

        public Colour get_background_colour () {
            return background_colour;
        }

        public void set_background_colour (Colour colour) {
            background_colour = colour;
        }

        //  public uint32 get_flags () {
        //      return render_info.flags;
        //  }

        public int clear () {
            set_renderer_colour (background_colour);

            return render.clear ();
        }

        public void present () {
            render.present ();
        }

        public bool draw_sprite (Sprite sprite, int x, int y) {
            if (sprite.is_valid) {
                render.copy (sprite.texture, sprite.get_texture_rectangle (), sprite.get_output_rectangle (x, y));

                return true;
            } else {
                return false;
            }
        }

        public void set_renderer_colour (Colour colour) {
            render.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);
        }
    }
}
