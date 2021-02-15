namespace Virgil {
    public class Colour {
        public uint8 red;
        public uint8 green;
        public uint8 blue;
        public uint8 alpha;

        public Colour (uint8 red = 0, uint8 green = 0, uint8 blue = 0, uint8 alpha = 255) {
            this.red = red;
            this.green = green;
            this.blue = blue;
            this.alpha = alpha;
        }

        public Colour.from_colour (Colour colour) {
            red = colour.red;
            green = colour.green;
            blue = colour.blue;
            alpha = colour.alpha;
        }

        public bool equals (Colour colour) {
            bool does_red = red == (colour.red);
            bool does_green = green == (colour.green);
            bool does_blue = blue == (colour.blue);
            bool does_alpha = alpha == (colour.alpha);

            return (does_red && does_green && does_blue && does_alpha);
        }

        public string to_string () {
            string string_red = red.to_string ();
            string string_green = green.to_string ();
            string string_blue = blue.to_string ();
            string string_alpha = alpha.to_string ();

            return @"{ red: $string_red, green: $string_green, blue: $string_blue, alpha: $string_alpha }";
        }
    }
}
