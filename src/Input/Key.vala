using SDL.Input;

namespace Virgil.Input {
    public class Key {
        public Keycode key { get; private set; }

        public bool is_down;
        public bool is_pressed;
        public bool is_released;

        public Key (Keycode key) {
            this.key = key;

            is_down = false;
            is_pressed = false;
            is_released = true;
        }

        public string to_string () {
            string string_keycode = key.get_name ();
            string string_down = is_down.to_string ();
            string string_pressed = is_pressed.to_string ();
            string string_released = is_released.to_string ();

            return @"{ keycode: $string_keycode, is_down: $string_down,
                is_pressed: $string_pressed, is_released: $string_released }";
        }
    }
}
