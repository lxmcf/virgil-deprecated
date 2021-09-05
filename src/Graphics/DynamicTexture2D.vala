using Virgil;

using SDL.Video;

namespace Virgil.Graphics {
    public class DynamicTexture2D : Texture2D {
        private bool _locked;

        public DynamicTexture2D (uint width, uint height) {
            base (width, height, TextureType.STREAMING);

            _locked = false;
        }

        public DynamicTexture2D.from_file (string filename) {
            base.from_file (filename, TextureType.STREAMING);

            _locked = false;
        }

        public DynamicTexture2D.from_texture_raw (TextureRaw raw) {
            base.from_texture_raw (raw, TextureType.STREAMING);

            _locked = false;
        }

        // NOTE: Experimental, unsure if function will work as expected
        // IDEA: Impliment a dedicated pixel update method to avoid EU needing to use memset
        public int @lock (Rectangle? rect, out void* pixels, out int pitch) {
            pitch = 0;
            pixels = null;
            Rect? quad;

            if (_locked) {
                print ("DynamicTexture2D [%s] is already locked!\n", texture_id);

                return EXIT_FAIL;
            }

            if (rect == null) {
                quad = null;
            } else {
                quad = { rect.x, rect.y, rect.width, rect.height };
            }

            int test = sdl_texture.do_lock (
                quad,
                out pixels,
                out pitch
            );

            if (test != 0) {
                print ("%s", SDL.get_error ());
            }

            _locked = true;

            return EXIT_SUCCESS;
        }

        public int @unlock () {
            if (!_locked) {
                print ("DynamicTexture2D [%s] already unlocked!\n", texture_id);
            }

            sdl_texture.unlock ();
            _locked = false;

            return EXIT_SUCCESS;
        }
    }
}
