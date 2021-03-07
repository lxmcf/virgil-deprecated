using Virgil.Graphics;

namespace Virgil {
    public class Camera {
        private Texture2D* _texture;

        private Rectangle _view;

        public Texture2D texture {
            get { return _texture; }
        }

        public Camera (uint width, uint height) {
            _view = new Rectangle (0, 0, width, height);

            _refresh_texture ();
        }

        public Camera.from_rectangle (Rectangle rect) {
            _view = new Rectangle.from_rectangle (_view);

            _refresh_texture ();
        }

        ~Camera () {
            delete _texture;
        }

        public void set_view_size (uint width, uint height) {
            _view.set_size (width, height);

            delete _texture;

            _refresh_texture ();
        }

        public Rectangle get_view () {
            return _view;
        }

        private void _refresh_texture () {
            _texture = new Texture2D (_view.width, _view.height, SDL.Video.TextureAccess.TARGET);
        }
    }
}
