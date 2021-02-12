using Virgil.Engine;

using SDL;
using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Texture _texture;

        public Texture2D (int width, int height) {
            _texture = Texture.create (
                Game.renderer.to_sdl (),
                PixelRAWFormat.ARGB8888,
                TextureAccess.STATIC,
                width,
                height
            );
        }

        public Texture2D.from_file (string filename) {
            bool file_exists = FileUtils.test (filename, FileTest.EXISTS);

            if (file_exists) {
                int width, height, bytes_per_pixel;

                void* pixel_data = Stbi.load (filename, out width, out height, out bytes_per_pixel, 4);

                _texture = Texture.create (
                    Game.renderer.to_sdl (), PixelRAWFormat.ABGR8888, TextureAccess.STATIC, width, height
                );

                _texture.set_blend_mode (BlendMode.BLEND);
                _texture.update (null, pixel_data, bytes_per_pixel * width);

                delete pixel_data;
            } else {
                Utility.Log.error (@"Failed to create Texture2D from file \'$filename\'");
            }
        }

        public Texture2D.from_resource (string filename) {
            try {
                Bytes bytes = GLib.resources_lookup_data (filename, ResourceLookupFlags.NONE);

                int width, height, bytes_per_pixel;
                void* pixel_data = Stbi.load_from_memory (bytes.get_data (), bytes.length, out width, out height, out bytes_per_pixel);

                _texture = Texture.create (
                    Game.renderer.to_sdl (), PixelRAWFormat.ABGR8888, TextureAccess.STATIC, width, height
                );

                _texture.set_blend_mode (BlendMode.BLEND);
                _texture.update (null, pixel_data, bytes_per_pixel * width);

                delete pixel_data;
            } catch (Error e) {
                string code = e.code.to_string ();

                Utility.Log.error (@"Failed to create Texture2D from resource \'$filename\' with error code \'$code\'");
            }
        }

        //  public Texture2D.from_rwops (SDL.RWops rwops, bool free_source = false) {
        //      _texture = SDLImage.load_texture_rw (Game.renderer.to_sdl (), rwops, free_source);
        //      is_locked = false;
        //  }

        public Rectangle get_bounds () {
            int width, height;

            _texture.query (null, null, out width, out height);

            return new Rectangle (0, 0, width, height);
        }

        public int get_size (out int width, out int height) {
            if (_texture == null) {
                width = 0;
                height = 0;

                return 1;
            }

            _texture.query (null, null, out width, out height);

            return 0;
        }

        public unowned Texture? get_sdl_texture () {
            return _texture;
        }
    }
}
