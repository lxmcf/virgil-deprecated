namespace Virgil.Graphics {
    public class RenderQueueCall {
        private unowned Texture2D _texture;
        private Point _point;

        public Texture2D texture {
            get { return _texture; }
        }

        public Point point {
            get { return _point; }
        }

        public RenderQueueCall (Texture2D texture, int x, int y) {
            _point = new Point (x, y);
            _texture = texture;
        }
    }
}
