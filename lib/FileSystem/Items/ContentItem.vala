using Virgil.Graphics;

namespace Virgil.FileSystem {
    public class ContentItem <T> {
        private T _content;

        private string _uuid;
        private int _id;

        public ContentItem (T content, int id) {
            _content = content;

            _id = id;
            _uuid = Uuid.string_random ();
        }
    }
}
