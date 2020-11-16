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
            for (int i = 0; i < _directories.length; i++) {

            }

            return 0;
        }

        public T load_file <T> (string filename) {
            return 0;
        }

        public int add_directory (string directory) {
            if (_directory_exists (directory)) {
                return 1;
            } else {
                _directories += directory;

                return 0;
            }
        }

        public int add_directories (string[] directories) {
            int length = directories.length;

            if (length != 0) {
                for (int i = 0; i < length; i++) {
                    string directory = directories[i];

                    if (!_directory_exists (directory)) {
                        _directories += directory;
                    }
                }

                return 0;
            }

            return 1;
        }

        public string get_uuid (int content_id) {
            return Uuid.string_random ();
        }

        private bool _directory_exists (string directory) {
            int length = _directories.length;

            if (length != 0) {
                for (int i = 0; i < length; i++) {
                    if (_directories[i] == directory) {
                        return true;
                    }
                }
            }

            return false;
        }
    }
}
