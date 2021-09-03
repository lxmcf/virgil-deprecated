namespace Virgil.Input {
    public class Button {
        private MouseButton _button;

        public bool is_down;
        public bool is_pressed;
        public bool is_released;

        public MouseButton button {
            get { return _button; }
        }

        public Button (MouseButton button) {
            _button = button;

            is_down = false;
            is_pressed = false;
            is_released = true;
        }
    }
}
