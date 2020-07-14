namespace Virgil.IO {
    public class FileUtility {
        public static bool file_exists (string filename, bool is_gresource = false) {
            bool exists = true;

            if (is_gresource) {
                try {
                    exists = resources_get_info (filename, ResourceLookupFlags.NONE, null, null);
                } catch (Error e) {
                    error (e.message);
                }
            } else {
                exists = FileUtils.test (filename, FileTest.EXISTS);
            }

            return exists;
        }
    }
}