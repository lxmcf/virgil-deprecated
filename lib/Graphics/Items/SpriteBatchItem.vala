using Virgil;
using SDL.Video;

namespace Virgil.Graphics {
    public class SpriteBatchItem {
        public unowned Texture texture { get; private set; }

        public Rect sprite_rectangle { get; private set; }
        public Rect output_rectangle { get; private set; }

        public double output_angle;

        public SpriteBatchItem (Sprite sprite, int x, int y, double scale_x, double scale_y, double angle) {
            output_angle = angle;

            texture = sprite.get_sdl_texture ();
            sprite_rectangle = sprite.get_bounds ().to_sdl ();

            double output_width = sprite_rectangle.w * scale_x;
            double output_height = sprite_rectangle.h * scale_y;

            output_rectangle = new Rectangle (x, y, (int)output_width, (int)output_height).to_sdl ();
        }
    }
}
