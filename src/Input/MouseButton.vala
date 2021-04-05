namespace Virgil.Input {
    public enum MouseButton {
        UNDEFINED = 0,
        LEFT = 1,
        RIGHT = 2,
        MIDDLE = 3,
        BACK = 4,
        FORWARD = 5;

        public string to_string () {
            string[] buttons = new string[6];
            buttons = { "Undefined", "Left", "Right", "Middle", "Back", "Forward" };

            return buttons [this];
        }
    }
}
