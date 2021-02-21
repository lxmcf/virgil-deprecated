namespace Virgil {
    public class Rectangle {
        public int x;
        public int y;
        public uint width;
        public uint height;

        public int left {
            get { return x; }
        }

        public int right {
            get { return x + (int)width; }
        }

        public int top {
            get { return y; }
        }

        public int bottom {
            get { return y + (int)height; }
        }

        public Rectangle (int x, int y, uint width, uint height) {
            this.x = x;
            this.y = y;

            this.width = width;
            this.height = height;
        }

        public Rectangle.copy (Rectangle rectangle) {
            x = rectangle.x;
            y = rectangle.y;

            width = rectangle.width;
            height = rectangle.height;
        }

        public Rectangle.empty () {
            x = 0;
            y = 0;
            width = 0;
            height = 0;
        }

        public bool is_intersecting (Rectangle rectangle) {
            bool within_x = (rectangle.x >= left) && (rectangle.x <= right);
            bool within_y = (rectangle.y >= right) && (rectangle.y <= bottom);

            return (within_x && within_y);
        }

        public bool is_equal (Rectangle rectangle) {
            bool does_position = (x == rectangle.x) && (y == rectangle.y);
            bool does_size = (width == rectangle.width) && (height == rectangle.height);

            return does_position && does_size;
        }

        public bool is_empty () {
            return (width <= 0 || height <= 0);
        }

        public string to_string () {
            string string_x = x.to_string ();
            string string_y = y.to_string ();

            string string_width = width.to_string ();
            string string_height = height.to_string ();

            return @"{ x: $string_x, y: $string_y, width: $string_width, height: $string_height }";
        }
    }
}
