using SDL.Video;

namespace Virgil.Core {
    public class WindowManager {
        private Window? _window;

        private int _width;
        private int _height;
        private string _title;

        public uint32 flags { get; private set; }

        public void initialise (uint32 window_flags = 0) {
            _title = Config.PROJECT_NAME + " v" + Config.PROJECT_VERSION;
            _width = 640;
            _height = 360;
            flags = window_flags;

            _window = new Window (_title, Window.POS_CENTERED, Window.POS_CENTERED, _width, _height, flags);
        }

        public unowned Window? get_window () {
            return _window;
        }

        public DisplayMode get_display_mode () {
            DisplayMode mode;

            _window.get_display_mode (out mode);

            return mode;
        }

        public void get_window_size (out int? window_width, out int? window_height) {
            if (_window != null) {
                window_width = _width;
                window_height = _height;
            } else {
                window_width = null;
                window_height = null;
            }
        }

        public void set_window_size (int width, int height) {
            _window.set_size (width, height);
        }

        public void set_title (string title) {
            _title = title;

            _window.title = _title;
        }
    }
}
