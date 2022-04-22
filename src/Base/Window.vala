using SDL;

namespace Virgil.Base {
    public class Window {
        internal Video.Window _window;

        private static Window? _instance;

        private int _width;
        private int _height;

        public const int CENTERED = (int)Video.Window.POS_CENTERED;

        public Window (string title, int width, int height) {
            uint32 flags = Video.WindowFlags.OPENGL | Video.WindowFlags.ALLOW_HIGHDPI;

            _window = new Video.Window (title, CENTERED, CENTERED, width, height, flags);
        }

        // Not sure if this is nice? Been away from OOP too late
        public static Window? get_instance () {
            return _instance;
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
