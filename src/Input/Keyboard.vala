namespace Virgil.Input {
    // TODO: Complete main keyboard class to allow for multiple keystates in future
    public class Keyboard {
        private static unowned KeyboardState _state;

        public static int init (KeyboardState state) {
            _state = state;

            return 0;
        }

        public static unowned KeyboardState get_state () {
            return _state;
        }
    }
}
