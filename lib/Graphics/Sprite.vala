using Virgil;

using SDL.Video;
using SDLImage;

namespace Virgil.Graphics {
    public class Sprite {
        public Texture? texture;
        public Rect texture_rectangle;

        public int width;
        public int height;

        public int output_width;
        public int output_height;

        // TODO: Impliment sprite validation (If file exists on creation, set to false)
        public bool is_valid;

        public double scale_x;
        public double scale_y;

        private unowned Renderer renderer;

        public Sprite (Renderer sprite_renderer, string? sprite_file = null) {
            texture = load_texture (sprite_renderer, sprite_file);
            texture.query (null, null, out width, out height);

            is_valid = true;

            set_scale (1, 1);

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

        public int get_output_width () {
            return output_width;
        }

        public int get_output_height () {
            return output_height;
        }

        public void set_scale (double scale_x, double scale_y) {
            this.scale_x = scale_x;
            this.scale_y = scale_y;

            this.output_width = (int)((double)width * scale_x);
            this.output_height = (int)((double)height * scale_y);
        }

        public Rect get_output_rectangle (int position_x, int position_y) {
            return Rect () {
                x = position_x,
                y = position_y,
                w = output_width,
                h = output_height
            };
        }
    }
}
