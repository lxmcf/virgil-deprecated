using SDL.Input;

namespace Virgil.Input {
    public class KeyboardState {
        private List<Key> _key_list;

        public KeyboardState () {
            _key_list = new List<Key> ();
        }

        public void add_key (Keycode keycode) {
            var item = key_exists (keycode);

            if (item == null) {
                _key_list.append (new Key (keycode));
            } else {
                warning ("Attempted to add already monitored key");
            }
        }

        public bool check_key (Keycode keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                return item.is_down;
            }

            return false;
        }

        public int check_key_raw (Keycode keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                if (item.is_down) {
                    return KeyState.DOWN;
                }
            }

            return KeyState.UP;
        }

        public bool check_key_pressed (Keycode keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                if (item.is_down && !item.is_pressed) {
                    item.is_pressed = true;

                    return true;
                }
            }

            return false;
        }

        public bool check_key_released (Keycode keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                if (!item.is_down && !item.is_released) {
                    item.is_released = true;

                    return true;
                }
            }

            return false;
        }

        public void update_key (Keycode keycode, bool is_down) {
            var item = key_exists (keycode);

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

        private unowned Key? key_exists (Keycode keycode) {
            for (int i = 0; i < _key_list.length (); i++) {
                Key item = _key_list.nth_data (i);

                if (item.key == keycode) {
                    return _key_list.nth_data (i);
                }
            }

            _key_list.append (new Key (keycode));

            // Will always return null on first call
            return null;
        }
    }
}
