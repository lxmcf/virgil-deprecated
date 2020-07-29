using Virgil;

using SDL.Video;
using SDLImage;

namespace Virgil.Graphics {
    public class Sprite {
        public Texture? texture;
        public Rect? texture_rectangle;

        public int? width;
        public int? height;

        public double scale_x = 1.0;
        public double scale_y = 1.0;

        public Sprite (string sprite_file = "") {
            VVFS.File file = new VVFS.File (sprite_file);

            _initialise (file);
        }

        public Sprite.from_gresource (string sprite_file = "") {
            VVFS.File file = new VVFS.File.from_gresource (sprite_file);

            _initialise (file);
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

        private void _nullify () {
            texture = null;
            texture_rectangle = null;

            width = null;
            height = null;
        }

        private void _initialise (VVFS.File file) {
            int file_size = file.get_size ();

            if (file_size != 0) {
                unowned Renderer render = GameState.get_render_state ().get_renderer ();

                texture = load_texture_rw (render, file.get_rwops (), false);
                texture.query (null, null, out width, out height);

                texture_rectangle = Rect () { x = 0, y = 0, w = width, h = height };
            } else {
                _nullify ();
            }
        }
    }
}
