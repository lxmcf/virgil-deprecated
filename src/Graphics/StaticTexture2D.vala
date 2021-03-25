using Virgil;
using Virgil.Debug;

using SDL.Video;

namespace Virgil.Graphics {
    public class StaticTexture2D : Texture2D {
        public StaticTexture2D (uint width, uint height) {
            base (width, height, TextureType.STATIC);
        }

        public StaticTexture2D.from_file (string filename) {
            base.from_file (filename, TextureType.STATIC);
        }

        public int set_pixels (uchar* pixels) {
            int width, height;

            sdl_texture.query (null, null, out width, out height);

            return sdl_texture.update (
                null,
                pixels,
                width * channels
            );
        }
    }
}
