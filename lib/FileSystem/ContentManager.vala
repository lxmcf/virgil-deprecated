using SDL;

using Virgil.Graphics;

namespace Virgil.FileSystem {
    public class ContentManager {
        private List <ContentItem> _content;
        private string[] _directories;

        public ContentManager (string[] directories, bool import_default = true) {
            _content = new List<ContentItem> ();

            if(directories.length > 0) {
                for (int i = 0; i < directories.length; i++) {
                    _directories.copy ();
                }
            }

            if (import_default) _directories += "/virgil/";
        }

        public T load_resource <T> (string filename) {
            return 0;
        }

        public T load_file <T> (string filename) {
            return 0;
        }

        public string get_uuid (int id) {
            return Uuid.string_random ();
        }
    }
}
