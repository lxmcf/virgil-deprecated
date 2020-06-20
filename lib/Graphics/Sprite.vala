using Virgil;

using SDL.Video;
using SDLImage;

namespace Virgil.Graphics {
    public class Sprite {
        public Texture? texture;
        public Rect texture_rectangle;

        public int width;
        public int height;

        // TODO: Impliment sprite validation (If file exists on creation, set to false)
        public bool is_valid;

        public double scale_x = 1;
        public double scale_y = 1;

        private unowned Renderer renderer;

        public Sprite (Renderer sprite_renderer, string? sprite_file = null) {
            texture = load_texture (sprite_renderer, sprite_file);
            texture.query (null, null, out width, out height);

            is_valid = true;

            texture_rectangle = Rect () {
                x = 0,
                y = 0,
                w = width,
                h = height
            };

            renderer = sprite_renderer;
        }

        public bool draw (int position_x, int position_y) {
            if (texture != null) {
                Rect destination_rectange = Rect () {
                    x = position_x,
                    y = position_y,
                    w = (int)((double)width * scale_x),
                    h = (int)((double)height * scale_y)
                };

                renderer.copy (texture, texture_rectangle, destination_rectange);
            }

            return (texture != null);
        }

        public int get_width () {
            return width;
        }

        public int get_height () {
            return height;
        }

        public void set_scale (double scale_x, double scale_y) {
            this.scale_x = scale_x;
            this.scale_y = scale_y;
        }
    }
}
