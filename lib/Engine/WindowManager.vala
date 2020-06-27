using SDL.Video;

namespace Virgil {
    public class WindowManager {
        public Window? window;

        public int width;
        public int height;
        public uint32 flags;
        public string title;

        public void initialise (uint32 flags = 0) {
            title = Config.PROJECT_NAME + " v" + Config.PROJECT_VERSION;
            width = 640;
            height = 360;
            this.flags = flags;

            window = new Window (title, Window.POS_CENTERED, Window.POS_CENTERED, width, height, flags);
        }

        public unowned Window? get_window () {
            return window;
        }

        public void get_window_size (out int? window_width, out int? window_height) {
            if (window != null) {
                window_width = width;
                window_height = height;
            } else {
                window_width = null;
                window_height = null;
            }
        }

        public void set_title (string new_title) {
            title = new_title;

            window.title = title;
        }
    }
}
