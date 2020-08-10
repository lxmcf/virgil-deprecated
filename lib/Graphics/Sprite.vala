using Virgil;

using SDL.Video;
using SDLImage;

namespace Virgil.Graphics {
    public class Sprite {
        private Texture? _texture;
        private Rect? _texture_rectangle;

        private int? _width;
        private int? _height;

        private double _scale_x = 1.0;
        private double _scale_y = 1.0;

        public Sprite (string sprite_file = "") {
            VVFS.File file = new VVFS.File (sprite_file);

            _initialise (file);
        }

        public Sprite.from_gresource (string sprite_file = "") {
            VVFS.File file = new VVFS.File.from_gresource (sprite_file);

            _initialise (file);
        }

        public void get_size (out int? width, out int? height) {
            width = _width;
            height = _height;
        }

        public void set_scale (double scale_x, double scale_y) {
            _scale_x = scale_x;
            _scale_y = scale_y;
        }

        public Rect get_output_rectangle (int position_x, int position_y) {
            return Rect () {
                x = position_x,
                y = position_y,
                w = (int)(_width * _scale_x),
                h = (int)(_height * _scale_y)
            };
        }

        public Rect get_texture_rectangle () {
            return _texture_rectangle;
        }

        public unowned Texture get_texture () {
            return _texture;
        }

        private void _nullify () {
            _texture = null;
            _texture_rectangle = null;

            _width = null;
            _height = null;
        }

        private void _initialise (VVFS.File file) {
            int file_size = file.size;

            if (file_size != 0) {
                unowned Renderer render = GameState.get_render_state ().get_renderer ();

                _texture = load_texture_rw (render, file.get_rwops (), false);
                _texture.query (null, null, out _width, out _height);

                _texture_rectangle = Rect () {
                    x = 0,
                    y = 0,
                    w = _width,
                    h = _height
                };
            } else {
                _nullify ();
            }
        }
    }
}
