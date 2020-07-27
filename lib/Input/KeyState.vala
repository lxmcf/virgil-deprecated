namespace Virgil.Input {
    public enum KeyState {
        UP = 0,
        DOWN = 1;

        public string to_string () {
            switch (this) {
                case UP:
                    return "UP";

                case DOWN:
                    return "DOWN";

                default:
                    return "UNDEFINED";
            }
        }
    }
}
