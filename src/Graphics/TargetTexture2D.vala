namespace Virgil.Graphics {
    public class TargetTexture2D : Texture2D {
        public TargetTexture2D (uint width, uint height) {
            base (width, height, TextureType.TARGET);
        }
    }
}
