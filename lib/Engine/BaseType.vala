using Virgil.FileSystem;

namespace Virgil.Engine {
    public class BaseType {
        private Bytes? _bytes;

        public int length {
            get {
                if (_bytes != null) {
                    return _bytes.length;
                } else return 0;
            }
        }

        public BaseType () {
            _bytes = null;
        }

        public BaseType.from_rwops (SDL.RWops rwops, bool free_source = false) {
            uint8[] rwops_data = new uint8[1];

            for (int i = 0; i < rwops.size; i++) {
                rwops_data += rwops.read_u8 ();
            }

            _bytes = new Bytes (rwops_data);

            if (free_source) {
                rwops.close ();
            }
        }

        public BaseType.from_data (uint8[] data) {
            _bytes = new Bytes (data);
        }

        public BaseType.from_asset (Asset asset) {
            _bytes = new Bytes (asset.get_data ());
        }

        public void set_data (uint8[]? data) {
            _bytes = new Bytes (data);
        }

        public uint8[]? get_data () {
            return (_bytes == null) ? null : _bytes.get_data ();
        }
    }
}