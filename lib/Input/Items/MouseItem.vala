namespace Virgil.Input {
    public class MouseItem {
        public MouseButton button { get; private set; }
        public bool is_down;
        public bool is_pressed;
        public bool is_released;

        public MouseItem (Virgil.Input.MouseButton button) {
            this.button = button;

            is_down = false;
            is_pressed = false;
            is_released = true;
        }
    }
}

