using SDL.Video;

namespace Virgil {
    public class Rectangle {
        private Rect _sdl_rect;

        public int x;
        public int y;
        public int width;
        public int height;

        public Rectangle (int x, int y, int width, int height) {
            this.x = x;
            this.y = y;

            this.width = width;
            this.height = height;

            _sdl_rect = Rect () { x = x, y = y, w = width, h = height };
        }

        public Rectangle.empty () {
            x = 0;
            y = 0;
            width = 0;
            height = 0;

            _sdl_rect = Rect () { x = 0, y = 0, w = 0, h = 0 };
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

        public Rectangle? get_intersect_rectangle (Rectangle target) {
            if (target.is_empty ()) return null;

            if (point_intersect (target.x, target.y)) {
                //TODO: Work out rectangle math

                return null;
            } else return null;
        }

        public Rect to_sdl () {
            return _sdl_rect;
        }

        public bool is_empty () {
            return _sdl_rect.is_empty ();
        }

        public bool is_equal (Rectangle rectangle) {
            bool does_position = (x == rectangle.x) && (y == rectangle.y);
            bool does_size = (width == rectangle.width) && (height == rectangle.height);

            return does_position && does_size;
        }
    }
}
