using SDL;

namespace Virgil.IO {
    public class File {
        public string filename;
        public bool exists;

        public uint8[] byte_data;
        public RWops rwops_data;

        public int length;

        public File (string file) {
            if (FileUtility.file_exists (file, false)) {
                rwops_data = new RWops.from_file (file, "rb");

                uint8[] data_array = new uint8[1];

                for (int i = 0; i < rwops_data.size; i++) {
                    data_array += rwops_data.read_u8 ();
                }

                byte_data = data_array;
                length = byte_data.length;
            }
        }

        public File.from_gresource (string file) {
            try {
                Bytes data_bytes = resources_lookup_data (file, ResourceLookupFlags.NONE);

                byte_data = data_bytes.get_data ();
                length = byte_data.length;

                rwops_data = new RWops.from_mem (byte_data, byte_data.length);
            } catch (Error e) {
                error (e.message);
            }
        }

        public File.from_bundle (Resource bundle, string file) {

        }

        public unowned uint8[] get_data () {
            return byte_data;
        }

        public unowned RWops get_rwops () {
            return rwops_data;
        }

        //  public static bool exists (string file, bool is_gresource = true) {
        //      bool file_exists = false;

        //      if (is_gresource) {
        //          try {
        //              file_exists = resources_get_info (file, ResourceLookupFlags.NONE, null, null);
        //          } catch (Error e) {
        //              error (e.message);
        //          }
        //      } else {
        //          file_exists = FileUtils.test (file, FileTest.EXISTS);
        //      }

        //      return file_exists;
        //  }
    }
}
