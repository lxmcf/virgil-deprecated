using SDL.Video;

namespace Virgil { 
    public class WindowManager {
        public Window? window { get; private set; }
        public Renderer? renderer { get; private set; }

        public uint32 window_flags;
        public uint32 renderer_flags;

        public int window_width;
        public int window_height;
        public string window_title;

        public WindowManager(uint32 window_flags = WindowFlags.ALLOW_HIGHDPI | WindowFlags.SHOWN, uint32 renderer_flags = RendererFlags.ACCELERATED | RendererFlags.PRESENTVSYNC) {
            this.window_flags = window_flags;
            this.renderer_flags = renderer_flags;

            window_width = 640;
            window_height = 360;
            window_title = Constants.PROJECT_NAME + " v" + Constants.PROJECT_VERSION;
        }

        public void create_window () {
            this.window = new Window (window_title , Window.POS_CENTERED, Window.POS_CENTERED, window_width, window_height, window_flags);
        }

        public void create_renderer () {
            if (window != null) {
                this.renderer = Renderer.create (window, -1, renderer_flags);
            } else {
                this.renderer = null;
            }
        }

        public void set_window_flags (uint32 flags) {
            window_flags = flags;
        }

        public void set_renderer_flags (uint32 flags) {
            renderer_flags = flags;
        }
    }
}
