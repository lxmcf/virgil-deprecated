using Virgil.Input;

namespace Virgil {
    public class MouseHandler {
        private List<MouseItem> _button_list;

        private int _x { get; private set; }
        private int _y { get; private set; }

        public MouseHandler () {
            _button_list = new List<MouseItem> ();

            _button_list.append (new MouseItem (MouseButton.LEFT));
            _button_list.append (new MouseItem (MouseButton.RIGHT));
            _button_list.append (new MouseItem (MouseButton.MIDDLE));
            _button_list.append (new MouseItem (MouseButton.BACK));
            _button_list.append (new MouseItem (MouseButton.FORWARD));
        }

        public bool check_button (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                return item.is_down;
            }

            return false;
        }
        public int check_button_raw (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                return 1;
            }

            return 0;
        }

        public bool check_button_pressed (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                if (item.is_down && !item.is_pressed) {
                    item.is_pressed = true;

                    return true;
                }
            }

            return false;
        }

        public bool check_button_released (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                if (!item.is_down && !item.is_released) {
                    item.is_released = true;

                    return true;
                }
            }

            return false;
        }

        public void get_position (out int x, out int y) {
            x = _x;
            y = _y;
        }

        public void update_position (SDL.MouseMotionEvent mouse) {
            _x = mouse.x;
            _y = mouse.y;
        }

        public void update_button (MouseButton button, bool is_down) {
            var item = _button_exists (button);

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

        private unowned MouseItem? _button_exists (MouseButton button) {
            for (int i = 0; i < _button_list.length (); i++) {
                MouseItem item = _button_list.nth_data (i);

                if (item.button == button) {
                    return _button_list.nth_data (i);
                }
            }

            return null;
        }
    }
}
