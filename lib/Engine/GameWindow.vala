using SDL.Video;

namespace Virgil.Engine {
    public class GameWindow {
        private Window? _sdl_window;

        public const int CENTERED = Window.POS_CENTERED;

        public string title {
            get { return _sdl_window.title; }
            set { _sdl_window.title = value; }
        }

        public GameWindow () {
            _sdl_window = new Window ("Virgil", CENTERED, CENTERED, 640, 360, 0);
        }

        public unowned Window to_sdl () {
            return _sdl_window;
        }

        public Rectangle to_rectangle () {
            int x, y, width, height;

            get_position (out x, out y);
            get_size (out width, out height);

            return new Rectangle (x, y, width, height);
        }

        public void set_position (int x, int y) {
            _sdl_window.set_position (x, y);
        }

        public void set_size (int width, int height) {
            _sdl_window.set_size (width, height);
        }

        public void get_position (out int x, out int y) {
            _sdl_window.get_position (out x, out y);
        }

        public void get_size (out int width, out int height) {
            _sdl_window.get_size (out width, out height);
        }

        public bool destory () {
            if (_sdl_window != null) {
                _sdl_window.destroy ();

                _sdl_window = null;
            }

            return false;
        }
    }
}
