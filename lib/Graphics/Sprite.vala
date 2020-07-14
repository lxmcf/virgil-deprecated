using Virgil;
using Virgil.IO;

using SDL.Video;
using SDLImage;

namespace Virgil.Graphics {
    public class Sprite {
        public Texture? texture;
        public Rect? texture_rectangle;

        public int? width;
        public int? height;

        public bool is_valid;

        public double scale_x = 1;
        public double scale_y = 1;

        public Sprite (string? sprite_file = null) {
            unowned Renderer render = GameState.get_render_state ().get_renderer ();

            IO.File file = new IO.File.from_gresource ("/com/github/lxmcf/virgil/image/default.png");

            texture = load_texture_rw (render, file.get_rwops (), false);
            texture.query (null, null, out width, out height);

            is_valid = true;

            set_scale (1.0, 1.0);

            texture_rectangle = Rect () {
                x = 0,
                y = 0,
                w = width,
                h = height
            };
        }

        public Sprite.from_gresource (string sprite = "/com/github/lxmcf/virgil/image/default.png") {
            if (FileUtility.file_exists (sprite)) {
                unowned Renderer render = GameState.get_render_state ().get_renderer ();

                IO.File file = new IO.File.from_gresource (sprite);

                texture = load_texture_rw (render, file.get_rwops (), false);
                texture.query (null, null, out width, out height);

                
            }
        }

        public Sprite.from_file (string? sprite = null) {

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

        public Rect get_output_rectangle (int position_x, int position_y) {
            return Rect () {
                x = position_x,
                y = position_y,
                w = (int)((double)width * scale_x),
                h = (int)((double)height * scale_y)
            };
        }

        public Rect get_texture_rectangle () {
            return texture_rectangle;
        }

        private void nullify () {
            texture = null;
            texture_rectangle = null;

            width = null;
            height = null;
        }
    }
}
