using SDL.Input;
using Virgil.Debug;

namespace Virgil.Input {
    public class Keyboard {
        private static List<KeyboardKey> _key_list;
        private static bool _is_initialised;

        public static int init () {
            if (!_is_initialised) {
                _key_list = new List<KeyboardKey> ();

                _is_initialised = true;

                return 0;
            } else {
                print_warning ("Keyboard already initialised");

                return 1;
            }
        }

        public static void add_key (string keycode) {
            var item = key_exists (keycode);

            if (item == null) {
                _key_list.append (new KeyboardKey (keycode));
            } else {
                print_warning ("Attempted to add already monitored key");
            }
        }

        public static bool check_key (string keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                return item.is_down;
            }

            return false;
        }

        public static int check_key_raw (string keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                if (item.is_down) {
                    return KeyState.DOWN;
                }
            }

            return KeyState.UP;
        }

        public static bool check_key_pressed (string keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                if (item.is_down && !item.is_pressed) {
                    item.is_pressed = true;

                    return true;
                }
            }

            return false;
        }

        public static bool check_key_released (string keycode) {
            var item = key_exists (keycode);

            if (item != null) {
                if (!item.is_down && !item.is_released) {
                    item.is_released = true;

                    return true;
                }
            }

            return false;
        }

        public static void update_key (string keycode, bool is_down) {
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

        private static unowned KeyboardKey? key_exists (string keycode) {
            Keycode key = Keycode.from_name (keycode);

            if (key != Keycode.UNKNOWN) {
                for (int i = 0; i < _key_list.length (); i++) {
                    KeyboardKey item = _key_list.nth_data (i);

                    if (item.key == keycode) {
                        return _key_list.nth_data (i);
                    }
                }

                _key_list.append (new KeyboardKey (keycode));
            }

            // Will always return null on first call
            return null;
        }
    }
}
