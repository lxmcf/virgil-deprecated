using Virgil;

namespace Virgil.Graphics {
    public class TiledTexture2D {
        private unowned Texture2D _texture;
        private Rectangle _quad;

        public TiledTexture2D (Texture2D texture, uint width, uint height) {
            _texture = texture;

            _quad = new Rectangle (0, 0, width, height);
        }
    }
}
