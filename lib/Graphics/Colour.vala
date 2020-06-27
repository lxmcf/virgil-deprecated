namespace Virgil.Graphics {
    public class Colour {
        public uint8 red;
        public uint8 green;
        public uint8 blue;
        public uint8 alpha;

        public Colour (uint8 r = 0, uint8 g = 0, uint8 b = 0, uint8 a = 255) {
            red = r;
            green = g;
            blue = b;
            alpha = a;
        }

        public Colour.from_colour (Colour colour) {
            red = colour.red;
            green = colour.green;
            blue = colour.blue;
            alpha = colour.alpha;
        }

        public bool equals (Colour colour) {
            bool does_red = this.red == (colour.red);
            bool does_green = this.green == (colour.green);
            bool does_blue = this.blue == (colour.blue);
            bool does_alpha = this.alpha == (colour.alpha);

            return (does_red && does_green && does_blue && does_alpha);
        }

        public uint32 to_int () {
            uint8 r = red;
            uint8 g = green << 8;
            uint8 b = blue << 16;
            uint8 a = alpha << 24;

            uint32 colour = (a + b + g + r);

            return colour;
        }
    }
}
