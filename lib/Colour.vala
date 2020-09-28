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

        public Colour.from_int (uint32 colour) {
            red = (uint8)(colour & 0xff);
            green = (uint8)((colour >> 8) & 0xff);
            blue = (uint8)((colour >> 16) & 0xff);
            alpha = (uint8)((colour >> 24) & 0xff);
        }

        public Colour copy () {
            return new Colour (red, green, blue, alpha);
        }

        public bool equals (Colour colour) {
            bool does_red = red == (colour.red);
            bool does_green = green == (colour.green);
            bool does_blue = blue == (colour.blue);
            bool does_alpha = alpha == (colour.alpha);

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
