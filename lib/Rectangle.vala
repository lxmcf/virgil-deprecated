using SDL.Video;

namespace Virgil {
    public class Rectangle {
        public int x;
        public int y;
        public uint width;
        public uint height;

        public Rectangle (int x, int y, uint width, uint height) {
            this.x = x;
            this.y = y;

            this.width = width;
            this.height = height;
        }

        public Rectangle.from_rect (Rect rectangle) {
            x = rectangle.x;
            y = rectangle.y;

            width = rectangle.w;
            height = rectangle.h;
        }

        public Rectangle.empty () {
            x = 0;
            y = 0;
            width = 0;
            height = 0;
        }

        public void get_size (out uint width, out uint height) {
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

        // TODO: Remove use of intersection_rect to stop double handling Rect data
        public Rectangle? get_intersect_rectangle (Rectangle target) {
            Rect self = get_sdl_rect ();
            Rect result;

            self.intersection_rect (target.get_sdl_rect (), out result);

            return new Rectangle.from_rect (result);
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
