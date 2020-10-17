using Virgil.FileSystem;

using SDL.Video;

namespace Virgil.Graphics {
    public class Texture2D {
        private Bytes _data;

        public int width { get; private set; }
        public int height { get; private set; }

        public int length {
            get {
                return _data.length;
            }
        }

        public Texture2D (int width, int height) {
            set_size (width, height);
        }

        public Texture2D.from_rwops (int width, int height, SDL.RWops rwops, bool free_source = false) {
            set_size (width, height);
            
            uint8[] rwops_data = new uint8[1];

            for (int i = 0; i < rwops.size; i++) {
                rwops_data += rwops.read_u8 ();
            }

            _data = new Bytes (rwops_data);

            if (free_source) {
                rwops.close ();
            }
        }

        public Texture2D.from_data (int width, int height, uint8[] data) {
            set_size (width, height);

            _data = new Bytes (data);
        }

        public Texture2D.from_asset (int width, int height, Asset asset) {
            set_size (width, height);

            _data = new Bytes (asset.get_data ());
        }

        public void set_data (uint8[]? data) {
            _data = new Bytes (data);
        }

        public void set_size (int width, int height) {
            this.width = width;
            this.height = height;
        }

        public Rectangle get_bounds () {
            return new Rectangle (0, 0, width, height);
        }

        public uint8[] get_data () {
            return _data.get_data ();
        }
    }
}
