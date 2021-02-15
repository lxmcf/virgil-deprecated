using Virgil;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;

        public Texture sdl_texture {
            get { return _texture; }
        }

        public Texture2D (int width, int height) {
            GameState state = Game.get_state ();

            _texture = Texture.create (
                state.renderer.sdl_renderer, PixelRAWFormat.ARGB8888, TextureAccess.STREAMING, width, height
            );
        }
    }
}
