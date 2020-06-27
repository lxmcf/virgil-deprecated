namespace Virgil {
    public class GameState {
        public static GLib.Once<WindowManager> window;
        public static GLib.Once<RenderManager> render;

        public static GLib.Once<EventManager> event;
        public static GLib.Once<FramerateManager> framerate;
        public static GLib.Once<KeyboardManager> keyboard;
        public static GLib.Once<MouseManager> mouse;

        public static unowned WindowManager? get_window_state () {
            return window.once (() => {
                return new WindowManager ();
            });
        }

        public static unowned RenderManager? get_render_state () {
            return render.once (() => {
                return new RenderManager ();
            });
        }

        public static unowned EventManager? get_event_state () {
            return event.once (() => {
                return new EventManager ();
            });
        }

        public static unowned FramerateManager? get_framerate_state () {
            return framerate.once (() => {
                return new FramerateManager ();
            });
        }

        public static unowned KeyboardManager? get_keyboard_state () {
            return keyboard.once (() => {
                return new KeyboardManager ();
            });
        }

        public static unowned MouseManager? get_mouse_state () {
            return mouse.once (() => {
                return new MouseManager ();
            });
        }
    }
}
