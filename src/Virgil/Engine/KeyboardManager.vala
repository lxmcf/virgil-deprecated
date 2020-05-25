// TODO: Create ID based reference system to avoid so many foreach statements

namespace Virgil {
    public class KeyboardManager {
        private GLib.List<Virgil.Input.Key> key_list;

        public KeyboardManager () {
            key_list = new GLib.List<Virgil.Input.Key> ();
        }

        public bool add_key (Virgil.Input.Key key) {
            if (!key_exists (key.keycode)) {
                key_list.append (key);

                return true;
            }

            return false;
        }

        public bool check_keyboard (SDL.Input.Keycode key) {
            bool key_down = false;

            if (key_exists (key)) {
                foreach (Virgil.Input.Key item in key_list) {
                    if(item.is_down) {
                        key_down = true;

                        break;
                    }
                }
            }

            return key_down;
        }

        public void update_key (SDL.Input.Keycode key, bool down = false) {
            if (key_exists (key)) {
                foreach (Virgil.Input.Key item in key_list) {
                    if (item.keycode == key) {
                        item.is_down = down;
                    }
                }
            }
        }

        private bool key_exists (SDL.Input.Keycode key) {
            bool found_key = false;

            foreach (Virgil.Input.Key item in key_list) {
                if (item.keycode == key) {
                    found_key = true;

                    break;
                }
            }

            return found_key;
        }
    }
}
