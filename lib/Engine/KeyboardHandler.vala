using SDL.Input;
using Virgil.Input;

namespace Virgil.Engine {
    public class KeyboardHandler {
        private List<KeyItem> _key_list;

        public KeyboardHandler () {
            _key_list = new List<KeyItem> ();
        }

        public void add_key (Keycode key) {
            var item = _key_exists (key);

            if (item == null) {
                _key_list.append (new KeyItem (key));
            } else {
                warning ("Attempted to add already monitored key");
            }
        }

        public bool check_key (Keycode key) {
            var item = _key_exists (key);

            if (item != null) {
                return item.is_down;
            }

            return false;
        }

        public int check_key_raw (Keycode key) {
            var item = _key_exists (key);

            if (item != null) {
                if (item.is_down) {
                    return KeyState.DOWN;
                }
            }

            return KeyState.UP;
        }

        public bool check_key_pressed (Keycode key) {
            var item = _key_exists (key);

            if (item != null) {
                if (item.is_down && !item.is_pressed) {
                    item.is_pressed = true;

                    return true;
                }
            }

            return false;
        }

        public bool check_key_released (Keycode key) {
            var item = _key_exists (key);

            if (item != null) {
                if (!item.is_down && !item.is_released) {
                    item.is_released = true;

                    return true;
                }
            }

            return false;
        }

        public void update_key (Keycode key, bool is_down) {
            var item = _key_exists (key);

            if (item != null) {
                if (!is_down && item.is_pressed) {
                    item.is_pressed = false;
                }

                if (is_down && item.is_released) {
                    item.is_released = false;
                }

                item.is_down = is_down;
            }
        }

        private unowned KeyItem? _key_exists (Keycode key) {
            for (int i = 0; i < _key_list.length (); i++) {
                KeyItem item = _key_list.nth_data (i);

                if (item.key == key) {
                    return _key_list.nth_data (i);
                }
            }

            return null;
        }
    }
}
