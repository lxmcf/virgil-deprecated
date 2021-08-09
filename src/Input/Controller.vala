using Virgil.Debug;

namespace Virgil.Input {
    public class Controller {
        private static List<Gamepad> _gamepad_list;
        private static bool _is_initialised;

        public static int init () {
            if (!_is_initialised) {
                _gamepad_list = new List<Gamepad> ();

                return 0;
            } else {
                print_warning ("Controller already initialised");

                return 1;
            }
        }

        public static bool check_button (uint index, string button) {
            return true;
        }

        public static bool check_button_pressed (uint index, string button) {
            return true;
        }

        public static bool check_button_released (uint index, string button) {
            return true;
        }

        public static float check_axis (uint index, string axis) {
            return 1.0f;
        }

        public static float check_trigger (uint index, string trigger) {
            return 1.0f;
        }
    }
}
