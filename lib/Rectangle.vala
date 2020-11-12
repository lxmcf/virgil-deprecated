using SDL.Video;

namespace Virgil {
    public class Rectangle {
        public int x;
        public int y;
        public int width;
        public int height;

        public Rectangle (int x, int y, int width, int height) {
            this.x = x;
            this.y = y;

            this.width = width;
            this.height = height;
        }

        public Rectangle.empty () {
            x = 0;
            y = 0;
            width = 0;
            height = 0;
        }

        public void get_size (out int width, out int height) {
            width = this.width;
            height = this.height;
        }

        public void get_position (out int x, out int y) {
            x = this.x;
            y = this.y;
        }

        public bool point_intersect (int x, int y) {
            bool within_x = (x >= this.x) && (x <= (x + width));
            bool within_y = (y >= this.y) && (y <= (y + height));

            return (within_x && within_y);
        }

        [Version (experimental_until = "0.0.5")]
        public Rectangle? get_intersect_rectangle (Rectangle target) {
            if (target.is_empty ()) return null;

            if (point_intersect (target.x, target.y)) {
                //TODO: Work out rectangle math

                return null;
            } else return null;
        }

        public Rect get_sdl_rect () {
            return Rect () { x = x, y = y, w = width, h = height };
        }

        public bool is_empty () {
            return (width <= 0 || height <= 0);
        }

        public bool is_equal (Rectangle rectangle) {
            bool does_position = (x == rectangle.x) && (y == rectangle.y);
            bool does_size = (width == rectangle.width) && (height == rectangle.height);

            return does_position && does_size;
        }
    }
}
