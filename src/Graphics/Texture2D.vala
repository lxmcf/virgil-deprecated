using Stbi;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;
        private string _texture_id;
        private int _channels;

        internal Texture sdl_texture {
            get { return _texture; }
        }

        public string texture_id {
            get { return _texture_id; }
        }

        public int channels {
            get { return _channels; }
        }

        public Texture2D (uint width, uint height, TextureAccess type) {
            Base.Renderer render = Base.Renderer.get_instance ();

            _texture = Texture.create (render._renderer, PixelRAWFormat.ABGR8888, type, (int)width, (int)height);

            _texture.set_blend_mode (BlendMode.BLEND);

            _channels = Stbi.Channels.RGB_ALPHA;
            _texture_id = Uuid.string_random ();
        }

        public Texture2D.from_file (string filename, TextureAccess type) {
            bool file_exists = FileUtils.test (filename, GLib.FileTest.EXISTS);

            if (file_exists) {
                int width, height, channels;
                Base.Renderer render = Base.Renderer.get_instance ();

                uchar* pixels = Stbi.load (filename, out width, out height, out channels);

                _texture = Texture.create (render._renderer, PixelRAWFormat.ABGR8888, type, width, height);

                _texture.update (null, pixels, channels * width);
                _texture.set_blend_mode (BlendMode.BLEND);

                _channels = channels;

                delete pixels;
            }

            _texture_id = Uuid.string_random ();
        }

        public int set_colour (Colour colour) {
            return _texture.set_color_mod (colour.red, colour.green, colour.blue);
        }

        public Colour get_colour () {
            uint8 red, green, blue, alpha;

            _texture.get_color_mod (out red, out green, out blue);
            _texture.get_alpha_mod (out alpha);

            return new Colour (red, green, blue, alpha);
        }

        public void get_size (out int width, out int height) {
            _texture.query (null, null, out width, out height);
        }
    }
}
