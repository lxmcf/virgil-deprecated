using Virgil.Input;

namespace Virgil {
    public class MouseManager {
        private List<MouseItem> button_list;

        public MouseManager () {
            button_list = new List<MouseItem> ();

            button_list.append (new MouseItem (MouseButton.LEFT));
            button_list.append (new MouseItem (MouseButton.RIGHT));
            button_list.append (new MouseItem (MouseButton.MIDDLE));
            button_list.append (new MouseItem (MouseButton.BACK));
            button_list.append (new MouseItem (MouseButton.FORWARD));
        }

        public bool check_button (uint8 button) {
            bool button_down = false;

            foreach (MouseItem item in button_list) {
                if (item.button == button) {
                    if (item.is_down) {
                        button_down = true;

                        break;
                    }
                }
            }

            return button_down;
        }

        public void update_button (uint8 button, bool down) {
            foreach (MouseItem item in button_list) {
                if (item.button == button) {
                    item.is_down = down;
                }
            }
        }
    }
}
