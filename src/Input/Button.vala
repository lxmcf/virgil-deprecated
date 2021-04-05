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

        public string to_string () {
            string button = _button.to_string ();
            string down = is_down.to_string ();
            string pressed = is_pressed.to_string ();
            string released = is_released.to_string ();

            return @"{ keycode: $(button), is_down: $(down), is_pressed: $(pressed), is_released: $(released) }";
        }
    }
}
