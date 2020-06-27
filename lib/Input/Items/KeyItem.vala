namespace Virgil.Input {
    public class KeyItem {
        public SDL.Input.Keycode keycode;
        public bool is_down;
        public bool is_pressed;

        public KeyItem (SDL.Input.Keycode keycode) {
            this.keycode = keycode;

            is_down = false;
            is_pressed = false;
        }
    }
}
