using Virgil.Engine;

using SDL;
using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;

        public int width { get; private set; }
        public int height { get; private set; }

        public bool is_locked { get; private set; }

        public TextureType texture_type { get; private set; }

        public Texture2D (int width, int height, TextureType type = TextureType.STREAM) {
            _texture = Texture.create (
                Game.renderer.to_sdl (),
                PixelRAWFormat.RGBA8888,
                type.to_sdl (),
                width, height
            );

            texture_type = type;
            is_locked = false;

            _set_size (width, height);
        }

        public Texture2D.from_file (string filename) {
            RWops rwops = new RWops.from_file (filename, "rb");

            if (rwops != null) {
                _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, true);
                is_locked = false;

                _texture.query (null, null, out _width, out _height);
            } else {
                Utility.Log.error (@"Failed to create Texture2D from file \'$filename\'");
            }
        }

        public Texture2D.from_resource (string filename) {
            try {
                Bytes bytes = GLib.resources_lookup_data (filename, ResourceLookupFlags.NONE);
                RWops rwops = new RWops.from_mem (bytes.get_data (), bytes.length);

                _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, true);
                is_locked = false;

                _texture.query (null, null, out _width, out _height);
            } catch (Error e) {
                string code = e.code.to_string ();

                Utility.Log.error (@"Failed to create Texture2D from resource \'$filename\' with error code \'$code\'");
            }
        }

        // TODO: Remove width and height (Deprecated due to RenderQueue allowing scaling)
        public Texture2D.from_rwops (SDL.RWops rwops, bool free_source = false) {
            _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, free_source);
            is_locked = false;

            _set_size (width, height);
        }

        [Version (experimental_until = "0.0.5")]
        public void set_pixels (Rectangle rectangle, void* pixels, int? pitch = null) {
            if (texture_type == TextureType.STATIC) {
                int width;

                if (pitch == null) {
                    width = rectangle.width * 4;
                } else {
                    width = pitch;
                }

                _texture.update (rectangle.get_sdl_rect (), pixels, pitch);
            } else {
                Utility.Log.warning ("set_pixels () can only be used on static textures");
            }
        }

        [Version (experimental_until = "0.0.5")]
        public void @lock (Rectangle bounds, ref void* pixels, ref int pitch) {
            if (is_locked) {
                Utility.Log.warning ("Texture is already locked");
                return;
            }

            _texture.do_lock (
                bounds.get_sdl_rect (),
                out pixels,
                out pitch
            );

            is_locked = true;
        }

        [Version (experimental_until = "0.0.5")]
        public void @unlock () {
            if (!is_locked) {
                Utility.Log.warning ("Texture is already unlocked");
                return;
            }

            _texture.unlock ();

            is_locked = false;
        }

        public Rectangle get_bounds () {
            return new Rectangle (0, 0, _width, _height);
        }

        public unowned Texture? get_sdl_texture () {
            return _texture;
        }

        private void _set_size (int width, int height) {
            this.width = width;
            this.height = height;
        }
    }
}
