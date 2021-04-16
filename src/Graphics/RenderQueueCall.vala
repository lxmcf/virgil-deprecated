namespace Virgil.Graphics {
    public class RenderQueueCall {
        private unowned Texture2D _texture;
        private Point _point;

        private bool _free_texture;
        private int _depth;

        public Texture2D* texture {
            get { return _texture; }
        }

        public Point point {
            get { return _point; }
        }

        public bool free_texture {
            get { return _free_texture; }
        }

        public int depth {
            get { return _depth; }
        }

        public RenderQueueCall (Texture2D* texture, int x, int y, int depth = -1, bool free_texture = false) {
            _point = new Point (x, y);
            _texture = texture;

            _depth = depth;
            _free_texture = free_texture;
        }
    }
}
