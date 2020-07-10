using SDL.Input;

namespace Virgil.Input {
    public class KeyItem {
        public Keycode keycode;
        public bool is_down;
        public bool is_pressed;

        public KeyItem (Keycode keycode) {
            this.keycode = keycode;

            is_down = false;
            is_pressed = false;
        }
    }
}
