using Virgil;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;
        private int _channels;

        public Texture sdl_texture {
            get { return _texture; }
        }

        public Texture2D (int width, int height) {
            GameState state = Game.get_state ();

            _texture = Texture.create (
                state.renderer.sdl_renderer, PixelRAWFormat.ARGB8888, TextureAccess.STATIC, width, height
            );

            _channels = Stbi.Channels.RGB_ALPHA;
        }

        public Texture2D.from_file (string filename) {
            bool file_exists = FileUtils.test (filename, GLib.FileTest.EXISTS);
            GameState state = Game.get_state ();

            if (file_exists) {
                int width, height, channels;

                void* pixels = Stbi.load (filename, out width, out height, out channels);

                _texture = Texture.create (
                    state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, TextureAccess.STATIC, width, height
                );

                _texture.update (null, pixels, channels * width);

                _channels = channels;

                Stbi.image_free (pixels);
            }
        }

        public Rectangle get_bounds () {
            int width, height;

            _texture.query (null, null, out width, out height);

            return new Rectangle (0, 0, width, height);
        }

        public int set_pixels (Rectangle quad, void* pixels) {
            int width, height;

            _texture.query (null, null, out width, out height);

            print ("[WARNING]:\tConsider using DynamicTexture2D if you require multiple changes to Texture2D pixel data!\n");

            return _texture.update (
                { 0, 0, (uint)width, (uint)height },
                pixels,
                width * _channels
            );
        }
    }
}
