namespace Virgil.Graphics.Cache {
    public class FontTexture {
        private Texture2D _texture;
        private string _identifier;

        public Texture2D texture {
            get { return _texture; }
        }

        public string identifier {
            get { return _identifier; }
        }

        public bool rendered;

        public FontTexture (owned Texture2D texture, string identifier) {
            _texture = (owned)texture;
            _identifier = identifier;

            rendered = false;
        }
    }
}
