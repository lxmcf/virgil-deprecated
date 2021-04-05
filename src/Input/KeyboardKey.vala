using SDL.Input;

namespace Virgil.Input {
    public class KeyboardKey {
        private string _key;

        public bool is_down;
        public bool is_pressed;
        public bool is_released;

        public string key {
            get { return _key; }
        }

        public KeyboardKey (string key) {
            _key = key;

            is_down = false;
            is_pressed = false;
            is_released = true;
        }

        public string to_string () {
            string keycode = key;
            string down = is_down.to_string ();
            string pressed = is_pressed.to_string ();
            string released = is_released.to_string ();

            return @"{ keycode: $(keycode), is_down: $(down), is_pressed: $(pressed), is_released: $(released) }";
        }
    }
}
