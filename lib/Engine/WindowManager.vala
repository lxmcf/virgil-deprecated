using SDL.Video;

using Virgil.Graphics;

namespace Virgil {
    public class WindowManager {
        private Window? window;
        private Renderer? renderer;

        public uint32 window_flags;
        public uint32 renderer_flags;

        public int window_width;
        public int window_height;
        public string window_title;

        public Colour background_colour;

        public WindowManager (uint32 window_flags = SDL.Video.WindowFlags.ALLOW_HIGHDPI | SDL.Video.WindowFlags.FOREIGN, uint32 renderer_flags = SDL.Video.RendererFlags.ACCELERATED) {
            this.window_flags = window_flags;
            this.renderer_flags = renderer_flags;

            window_width = 640;
            window_height = 360;
            window_title = Config.PROJECT_NAME + " v" + Config.PROJECT_VERSION;

            background_colour = new Colour ();
        }

        public void create_window () {
            window = new Window (window_title , Window.POS_CENTERED, Window.POS_CENTERED, window_width, window_height, window_flags);
        }

        public void create_renderer () {
            if (window != null) {
                this.renderer = Renderer.create (window, -1, renderer_flags);

                renderer.set_logical_size (window_width, window_height);

                set_background_colour (background_colour);
                renderer.clear ();
            } else {
                this.renderer = null;
            }
        }

        public void set_background_colour (Colour colour) {
            background_colour = colour;

            renderer.set_draw_color (colour.red, colour.green, colour.blue, colour.alpha);
        }

        public unowned Window? get_window () {
            return window;
        }

        public unowned Renderer? get_renderer () {
            return renderer;
        }

        public int get_window_size (out int? width, out int? height) {
            if (window != null) {
                width = window_width;
                height = window_height;

                return 0;
            } else {
                width = null;
                height = null;

                return 1;
            }
        }

        public void set_window_flags (uint32 flags) {
            window_flags = flags;
        }

        public void set_renderer_flags (uint32 flags) {
            renderer_flags = flags;
        }

        public int renderer_begin () {
            if (renderer != null) {
                renderer.clear ();

                return 0;
            } else {
                return 1;
            }
        }

        public int renderer_end () {
            if (renderer != null) {
                renderer.present ();

                return 0;
            } else {
                return 1;
            }
        }
    }
}
