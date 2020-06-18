namespace Virgil.Input {
    public class MouseButton {
        public MouseCode button;
        public bool is_down;

        public MouseButton (MouseCode button) {
            this.button = button;

            is_down = false;
        }
    }

    // TODO: Replace enum name with MouseButton and finish main class
    public enum MouseCode {
        LEFT = 1,
        RIGHT = 2,
        MIDDLE = 3,
        BACK = 4,
        FORWARD = 5;

        public string to_string () {
            switch (this) {
                case LEFT:
                    return "LEFT";

                case RIGHT:
                    return "RIGHT";

                case MIDDLE:
                    return "MIDDLE";

                case BACK:
                    return "BACK";

                case FORWARD:
                    return "FORWARD";

                default:
                    return "UNDEFINED";
            }
        }
    }
}
