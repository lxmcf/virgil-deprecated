using Virgil.Debug;

namespace Virgil.Input {
    public class Mouse {
        private static List<Button> _button_list;

        private static Point _position;
        private static Point _position_relative;

        public static int x {
            get { return _position.x; }
        }
        public static int y {
            get { return _position.y; }
        }

        public static int relative_x {
            get { return _position_relative.x; }
        }

        public static int relative_y {
            get { return _position_relative.y; }
        }

        public static void init () {
            _button_list = new List<Button> ();

            _button_list.append (new Button (MouseButton.LEFT));
            _button_list.append (new Button (MouseButton.RIGHT));
            _button_list.append (new Button (MouseButton.MIDDLE));
            _button_list.append (new Button (MouseButton.BACK));
            _button_list.append (new Button (MouseButton.FORWARD));

            _position = new Point.zero ();
            _position_relative = new Point.zero ();
        }

        public static bool check_button (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                return item.is_down;
            }

            return false;
        }
        public static int check_button_raw (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                return 1;
            }

            return 0;
        }

        public static bool check_button_pressed (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                if (item.is_down && !item.is_pressed) {
                    item.is_pressed = true;

                    return true;
                }
            }

            return false;
        }

        public static bool check_button_released (MouseButton button) {
            var item = _button_exists (button);

            if (item != null) {
                if (!item.is_down && !item.is_released) {
                    item.is_released = true;

                    return true;
                }
            }

            return false;
        }

        public static void get_position (out int x, out int y) {
            x = _position.x;
            y = _position.y;
        }

        public static Point get_position_point () {
            return new Point (x, y);
        }

        public static void set_position (int x, int y) {
            _position.x = x;
            _position.y = y;
        }

        public static void set_position_point (Point point) {
            _position.x = point.x;
            _position.y = point.y;
        }

        public static void update_button (MouseButton button, bool is_down) {
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

        private static unowned Button? _button_exists (MouseButton button) {
            for (int i = 0; i < _button_list.length (); i++) {
                Button item = _button_list.nth_data (i);

                if (item.button == button) {
                    return _button_list.nth_data (i);
                }
            }

            return null;
        }

        public static int print_buttons () {
            if (_button_list.length () == 0) {
                return 1;
            }

            print_message ("=== BEGIN BUTTON PRINT ===");

            for (int i = 0; i < _button_list.length (); i++) {
                Button item = _button_list.nth_data (i);

                print_message (item.to_string ());
            }

            print_message ("==== END BUTTON PRINT ====");

            return 0;
        }
    }
}
