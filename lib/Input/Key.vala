// TODO: Impliment is_pressed boolean

namespace Virgil.Input {
    public class Key {
        public SDL.Input.Keycode keycode;
        public bool is_down;

        public Key (SDL.Input.Keycode keycode) {
            this.keycode = keycode;

            is_down = false;
        }
    }
}
