using Virgil;
using Virgil.Debug;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;
        private string _texture_id;
        private int _channels;

        public Texture sdl_texture {
            get { return _texture; }
        }

        public string texture_id {
            get { return _texture_id; }
        }

        public Texture2D (uint width, uint height, TextureAccess type) {
            GameState state = Game.get_state ();

            _texture = Texture.create (
                state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, type, (int)width, (int)height
            );

            _texture.set_blend_mode (BlendMode.BLEND);

            _channels = Stbi.Channels.RGB_ALPHA;
            _texture_id = Uuid.string_random ();
        }

        public Texture2D.from_file (string filename, TextureAccess type) {
            bool file_exists = FileUtils.test (filename, GLib.FileTest.EXISTS);
            GameState state = Game.get_state ();

            if (file_exists) {
                int width, height, channels;

                void* pixels = Stbi.load (filename, out width, out height, out channels);

                _texture = Texture.create (
                    state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, type, width, height
                );

                _texture.update (null, pixels, channels * width);
                _texture.set_blend_mode (BlendMode.BLEND);

                _channels = channels;

                Stbi.image_free (pixels);
            }

            _texture_id = Uuid.string_random ();
        }

        public Rectangle get_bounds () {
            int width, height;

            _texture.query (null, null, out width, out height);

            return new Rectangle (0, 0, width, height);
        }
    }
}
