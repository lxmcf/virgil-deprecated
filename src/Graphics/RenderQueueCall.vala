namespace Virgil.Graphics {
    public class RenderQueueCall {
        private unowned Texture2D _texture;
        private Point _point;

        private bool _free_texture;
        private int _depth;
        private double _angle;

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

        public double angle {
            get { return _angle; }
        }

        public RenderQueueCall (Texture2D* texture, int x, int y, int depth, bool free_texture, double angle) {
            _point = new Point (x, y);
            _texture = texture;

            _depth = depth;
            _free_texture = free_texture;

            _angle = angle;
        }
    }
}
