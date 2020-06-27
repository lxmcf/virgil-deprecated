using SDL.Input;
using Virgil.Input;

namespace Virgil {
    public class KeyboardManager {
        private GLib.List<Virgil.Input.KeyItem> key_list;

        public KeyboardManager () {
            key_list = new GLib.List<Virgil.Input.KeyItem> ();
        }

        public bool add_key (Keycode key) {
            if (!key_exists (key)) {
                key_list.append (new KeyItem (key));

                return true;
            }

            return false;
        }

        public bool check_key (Keycode key) {
            bool key_down = false;

            if (key_exists (key)) {
                foreach (Virgil.Input.KeyItem item in key_list) {
                    if (item.keycode == key) {
                        if (item.is_down) {
                            key_down = true;

                            break;
                        }
                    }
                }
            }

            return key_down;
        }

        public void update_key (Keycode key, bool down) {
            if (key_exists (key)) {
                foreach (Virgil.Input.KeyItem item in key_list) {
                    if (item.keycode == key) {
                        item.is_down = down;
                    }
                }
            }
        }

        private bool key_exists (Keycode key) {
            bool found_key = false;

            foreach (Virgil.Input.KeyItem item in key_list) {
                if (item.keycode == key) {
                    found_key = true;

                    break;
                }
            }

            return found_key;
        }
    }
}
