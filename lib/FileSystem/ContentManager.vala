using Virgil.Graphics;

// TODO: Decide where this should actually go
namespace Virgil.FilSystem {
    public class ContentManager {
        private List<Object> _loaded_content;

        public string content_directory;

        public ContentManager (string? directory = null) {
            load<Texture2D> ("", "");
        }

        public bool load<T> (string file, string id) {
            return true;
        }
     }
}
