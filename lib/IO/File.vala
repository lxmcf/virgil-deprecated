namespace Virgil.IO {
    public class File {
        public static bool exists (string file) {
            bool file_exists = FileUtils.test (file, FileTest.EXISTS);

            return file_exists;
        }
    }
}
