// TODO: Remove Texture2D inherit

namespace Virgil.Graphics {
    public class Surface : Texture2D {
        public Surface (uint width, uint height) {
            base (width, height, TextureType.TARGET);
        }
    }
}
