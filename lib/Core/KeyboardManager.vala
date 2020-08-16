using SDL.Input;
using Virgil.Input;

namespace Virgil.Core {
    public class KeyboardManager {
        private List<KeyItem> _key_list;

        public KeyboardManager () {
            _key_list = new List<KeyItem> ();
        }

        public bool add_key (Keycode key) {
            if (!_key_exists (key)) {
                _key_list.append (new KeyItem (key));

                return true;
            }

            return false;
        }

        public bool check_key (Keycode key) {
            bool key_down = false;

            if (_key_exists (key)) {
                foreach (KeyItem item in _key_list) {
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

        public bool check_key_pressed (Keycode key) {
            bool key_pressed = false;

            if (_key_exists (key)) {
                foreach (KeyItem item in _key_list) {
                    if (item.keycode == key) {
                        if (item.is_down && !item.is_pressed) {
                            key_pressed = true;
                            item.is_pressed = true;
                        }
                    }
                }
            }

            return key_pressed;
        }

        public int check_key_raw (Keycode key) {
            int key_state = KeyState.UP;

            if (_key_exists (key)) {
                foreach (KeyItem item in _key_list) {
                    if (item.keycode == key) {
                        if (item.is_down) {
                            key_state = KeyState.DOWN;

                            break;
                        }
                    }
                }
            }

            return key_state;
        }



        public void update_key (Keycode key, bool down) {
            if (_key_exists (key)) {
                foreach (KeyItem item in _key_list) {
                    if (item.keycode == key) {
                        //  if (!down && item.is_pressed) {
                        //      item.is_pressed = false;
                        //  }

                        item.is_down = down;
                    }
                }
            }
        }

        private bool _key_exists (Keycode key) {
            bool found_key = false;

            foreach (KeyItem item in _key_list) {
                if (item.keycode == key) {
                    found_key = true;

                    break;
                }
            }

            return found_key;
        }
    }
}
