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
    }
}
