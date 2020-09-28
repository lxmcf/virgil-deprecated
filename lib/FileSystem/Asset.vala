using SDL;

namespace Virgil.FileSystem {
    public class Asset {
        public string filename { get; private set; }

        public Bytes? bytes { get; private set; }
        public RWops? rwops { get { return _rwops; } }

        public int length { get; private set; }

        private RWops? _rwops;

        public Asset.from_file (string file) {
            filename = file;

            if (FileUtils.test (filename, FileTest.EXISTS)) {
                _rwops = new RWops.from_file (filename, "rb");

                uint8[] data = new uint8[1];

                for (int i = 0; i < _rwops.size; i++) {
                    data += _rwops.read_u8 ();
                }

                bytes = new Bytes (data);
            } else {
                warning (@"The file at ?$file? does not exist");
            }

            length = bytes.length;
        }

        public Asset.from_resource (string file) {
            filename = file;

            try {
                bytes = GLib.resources_lookup_data (filename, ResourceLookupFlags.NONE);
                _rwops = new RWops.from_mem (bytes.get_data (), bytes.length);
            } catch (Error e) {
                warning (e.message);
            }

            length = bytes.length;
        }

        public uint8[]? get_data () {
            return (bytes == null) ? null : bytes.get_data ();
        }
    }
}
