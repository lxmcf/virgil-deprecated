using Virgil.Engine;
using Virgil.FileSystem;

using SDL;
using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;
        private uint8[] _data;

        public int width { get; private set; }
        public int height { get; private set; }

        public Texture2D (int width, int height, TextureType type) {
            _texture = Texture.create (
                Game.renderer.to_sdl (),
                PixelRAWFormat.RGBA8888,
                type.to_sdl (),
                width, height
            );

            _data = new uint8[0];

            _set_size (width, height);
        }

        public Texture2D.from_rwops (int width, int height, SDL.RWops rwops, bool free_source = false) {
            for (int i = 0; i < rwops.size; i++) {
                _data += rwops.read_u8 ();
            }

            _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, free_source);

            _set_size (width, height);
        }

        public Texture2D.from_data (int width, int height, uint8[] data) {
            SDL.RWops rwops = new SDL.RWops.from_mem (_data, _data.length);

            _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, true);

            _set_size (width, height);
        }

        public Texture2D.from_asset (int width, int height, Asset asset) {
            _data = asset.get_data ();

            SDL.RWops rwops = new SDL.RWops.from_mem (_data, _data.length);

            _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, true);

            _set_size (width, height);
        }

        private void _set_size (int width, int height) {
            this.width = width;
            this.height = height;
        }

        public Rectangle get_bounds () {
            return new Rectangle (0, 0, width, height);
        }

        public unowned Texture? get_sdl_texture () {
            return _texture;
        }
    }
}
