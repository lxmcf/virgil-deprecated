using Virgil;
using Virgil.Debug;
using Virgil.Stb;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;
        private string _texture_id;
        private int _channels;
        private TextureType _texture_type;
        private BlendMode _blend_mode;

        internal Texture sdl_texture {
            get { return _texture; }
        }

        public string texture_id {
            get { return _texture_id; }
        }

        public int channels {
            get { return _channels; }
        }

        public TextureType texture_type {
            get { return _texture_type; }
        }

        public Texture2D (uint width, uint height, TextureType type) {
            GameState state = Game.get_state ();
            _blend_mode = BlendMode.BLEND;

            _texture = Texture.create (
                state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, type.to_sdl (), (int)width, (int)height
            );

            _texture.set_blend_mode (_blend_mode.to_sdl ());

            _channels = Image.Channels.RGB_ALPHA;
            _texture_id = Uuid.string_random ();
            _texture_type = type;
        }

        public Texture2D.from_file (string filename, TextureType type) {
            bool file_exists = FileUtils.test (filename, GLib.FileTest.EXISTS);
            GameState state = Game.get_state ();
            _blend_mode = BlendMode.BLEND;

            if (file_exists) {
                int width, height, channels;

                uchar* pixels = Image.load (filename, out width, out height, out channels);

                _texture = Texture.create (
                    state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, type, width, height
                );

                _texture.update (null, pixels, channels * width);
                _texture.set_blend_mode (_blend_mode.to_sdl ());

                _channels = channels;

                delete pixels;
            }

            _texture_id = Uuid.string_random ();
            _texture_type = type;
        }

        public Texture2D.from_texture_raw (TextureRaw raw, TextureType type) {
            GameState state = Game.get_state ();
            _blend_mode = BlendMode.BLEND;

            _channels = (int)raw.channels;

            _texture = Texture.create (
                state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, type, (int)raw.width, (int)raw.height
            );

            _texture.update (null, raw.get_pixels (), (int)raw.pitch);
            _texture.set_blend_mode (_blend_mode.to_sdl ());

            _texture_id = Uuid.string_random ();
            _texture_type = type;
        }

        public int set_colour (Colour colour) {
            return _texture.set_color_mod (colour.red, colour.green, colour.blue);
        }

        public void set_blend_mode (BlendMode mode) {
            _blend_mode = mode;

            _texture.set_blend_mode (mode.to_sdl ());
        }

        public Colour get_colour () {
            uint8 red, green, blue, alpha;

            _texture.get_color_mod (out red, out green, out blue);
            _texture.get_alpha_mod (out alpha);

            return new Colour (red, green, blue, alpha);
        }

        public BlendMode get_blend_mode () {
            return _blend_mode;
        }

        public Rectangle get_bounds () {
            int width, height;

            _texture.query (null, null, out width, out height);

            return new Rectangle (0, 0, width, height);
        }

        public void get_size (out int width, out int height) {
            _texture.query (null, null, out width, out height);
        }

        public string to_string () {
            int _width, _height;

            _texture.query (null, null, out _width, out _height);

            string id = _texture_id;
            string width = _width.to_string ();
            string height = _height.to_string ();
            string channels = _channels.to_string ();
            string type = texture_type.to_string ();

            return @"{ id: $(id), width: $(width), height: $(height), channels: $(channels), type: $(type) }";
        }
    }
}
