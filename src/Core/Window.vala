using SDL;

namespace Virgil.Core {
    public class Window {
        private Video.Window _window;

        internal Video.Window sdl_window {
            get { return _window; }
        }

        private int _width;
        private int _height;

        public const int CENTERED = (int)Video.Window.POS_CENTERED;

        public string title {
            get { return _window.title; }
            set { _window.title = value; }
        }

        public int width {
            get { return _width; }
            set { set_size (value, _height); }
        }

        public int height {
            get { return _height; }
            set { set_size (width, value); }
        }

        public Window (int width = 640, int height = 360, string title = "Made with Virgil") {
            _window = new Video.Window (title, CENTERED, CENTERED, width, height, 0);

            set_size (width, height);
        }

        public void set_size (int width, int height) {
            _window.set_size (width, height);
            _window.get_size (out _width, out _height);
        }

        public void get_size (out int width, out int height) {
            width = _width;
            height = _height;
        }
    }
}
