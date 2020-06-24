namespace Virgil.IO {
    public class File {
        public static bool exists (string file) {
            Glib.File file_to_check = File.new_for_path (file);

            return file.query_exists ();
        }
    }
}
