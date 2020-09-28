namespace Virgil.Input {
    public enum KeyState {
        UP = 0,
        DOWN = 1;

        public bool to_bool () {
            switch (this) {
                case UP:
                    return false;

                case DOWN:
                    return true;

                default:
                    return false;
            }
        }
    }
}
