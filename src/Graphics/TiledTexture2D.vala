using Virgil;

namespace Virgil.Graphics {
    public class TiledTexture2D {
        private unowned Texture2D _source_texture;
        private Rectangle _quad;

        public TiledTexture2D (Texture2D texture, uint width, uint height) {
            _source_texture = texture;

            _quad = new Rectangle (0, 0, width, height);
        }

        public void set_size (uint width, uint height) {
            _quad.set_size (width, height);
        }
    }
}
