using Virgil.Engine;
using Virgil.FileSystem;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D : BaseType {
        public int width { get; private set; }
        public int height { get; private set; }

        public Texture2D (int width, int height) {
            base ();
            
            set_size (width, height);
        }

        public Texture2D.from_rwops (int width, int height, SDL.RWops rwops, bool free_source = false) {
            base.from_rwops (rwops, free_source);

            set_size (width, height);
        }

        public Texture2D.from_data (int width, int height, uint8[] data) {
            base.from_data (data);

            set_size (width, height);
        }

        public Texture2D.from_asset (int width, int height, Asset asset) {
            base.from_asset (asset);

            set_size (width, height);
        }

        public void set_size (int width, int height) {
            this.width = width;
            this.height = height;
        }

        public Rectangle get_bounds () {
            return new Rectangle (0, 0, width, height);
        }

        public Texture? to_sdl () {
            if (get_data () == null) {
                return null;
            }

            return SDLImage.load_texture_rw (
                Game.renderer.to_sdl (),
                new SDL.RWops.from_mem (get_data (), length)
            );
        }
    }
}
