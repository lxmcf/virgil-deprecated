namespace Virgil.Input {
    public class MouseItem {
        public MouseButton button;
        public bool is_down;
        public bool is_pressed;

        public MouseItem (Virgil.Input.MouseButton button) {
            this.button = button;

            is_down = false;
            is_pressed = false;
        }
    }
}
