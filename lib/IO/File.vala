using SDL;

namespace Virgil.IO {
    public class File {
        public string filename;

        public uint8[] raw_data;
        public RWops sdl_data;

        public bool exists;

        public File (string file) {
            if (check_exists (file, false)) {
                sdl_data = new RWops.from_file (file, "rb");

                uint8[] data_array = new uint8[1];

                for (int i = 0; i < sdl_data.size; i++) {
                    data_array += sdl_data.read_u8 ();
                }

                raw_data = data_array;
            }
        }

        public File.from_gresource (string file) {
            try {
                GLib.Bytes data_bytes = GLib.resources_lookup_data (file, GLib.ResourceLookupFlags.NONE);

                raw_data = data_bytes.get_data ();

                sdl_data = new RWops.from_mem (raw_data, raw_data.length);
            } catch (Error e) {
                GLib.error (e.message);
            }
        }

        public File.from_bundle (GLib.Resource bundle, string file) {

        }

        public unowned uint8[] get_data () {
            // TODO: Actually return data array

            return raw_data;
        }

        public unowned SDL.RWops get_rwops () {
            // TODO: Impliment conversion of data array to SDL.Rwops

            return sdl_data;
        }

        private bool check_exists (string file, bool is_gresource) {
            bool file_exists = false;

            if (is_gresource) {
                try {
                file_exists = GLib.resources_get_info (file, GLib.ResourceLookupFlags.NONE, null, null);
                } catch (Error e) {
                    GLib.error (e.message);
                }
            } else {
                file_exists = FileUtils.test (file, FileTest.EXISTS);
            }

            return file_exists;
        }
    }
}
