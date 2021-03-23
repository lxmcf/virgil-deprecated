using Virgil;
using Virgil.Debug;

using SDL.Video;

namespace Virgil.Graphics {
    public class StaticTexture2D : Texture2D {
        private Texture _texture;
        private int _channels;

        public StaticTexture2D (uint width, uint height) {
            base (width, height, TextureAccess.STATIC);
        }

        public StaticTexture2D.from_file (string filename) {
            base.from_file (filename, TextureAccess.STATIC);
        }

        public int set_pixels (void* pixels) {
            int width, height;

            _texture.query (null, null, out width, out height);

            return _texture.update (
                { 0, 0, (uint)width, (uint)height },
                pixels,
                width * _channels
            );
        }
    }
}
