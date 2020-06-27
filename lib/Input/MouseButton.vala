namespace Virgil.Input {
    public enum MouseButton {
        UNDEFINED = 0,
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
