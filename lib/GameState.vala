namespace Virgil {
    public class GameState {
        public static EventManager? event;
        public static FramerateManager? framerate;
        public static KeyboardManager? keyboard;

        public static unowned EventManager get_event_state () {
            if (event == null) {
                event = new EventManager ();
            }

            return event;
        }

        public static unowned FramerateManager get_framerate_state () {
            if (framerate == null) {
                framerate = new FramerateManager ();
            }

            return framerate;
        }

        public static unowned KeyboardManager get_keyboard_state () {
            if (keyboard == null) {
                keyboard = new KeyboardManager ();

                print ("New keyboard manager!\n");
            }

            return keyboard;
        }
    }
}
