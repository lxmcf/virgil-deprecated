namespace Virgil {
    public class GameState {
        public static GLib.Once<EventManager> event;
        public static GLib.Once<FramerateManager> framerate;
        public static GLib.Once<KeyboardManager> keyboard;

        public static unowned EventManager get_event_state () {
            return event.once(() => {
                return new EventManager ();
            });
        }

        public static unowned FramerateManager get_framerate_state () {
            return framerate.once(() => {
                return new FramerateManager ();
            });
        }
        
        [Description (nick="test1", blurb="This is some example text")]
        public static unowned KeyboardManager get_keyboard_state () {
            return keyboard.once(() => {
                return new KeyboardManager ();
            });
        }
    }
}
