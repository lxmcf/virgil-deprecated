namespace Virgil {
    public class Rectangle {
        public int x;
        public int y;
        public int width;
        public int height;

        public int left {
            get { return x; }
        }

        public int right {
            get { return x + width; }
        }

        public int top {
            get { return y; }
        }

        public int bottom {
            get { return y + height; }
        }

        public Rectangle (int x, int y, int width, int height) {
            this.x = x;
            this.y = y;

            this.width = width;
            this.height = height;
        }

        public Rectangle.from_rectangle (Rectangle rectangle) {
            set_size (rectangle.width, rectangle.height);
            set_position (rectangle.x, rectangle.y);
        }

        public Rectangle.empty () {
            x = 0;
            y = 0;
            width = 0;
            height = 0;
        }

        public void set_size (int width, int height) {
            this.width = width;
            this.height = height;
        }

        public void set_position (int x, int y) {
            this.x = x;
            this.y = y;
        }

        public void get_size (out uint width, out uint height) {
            width = this.width;
            height = this.height;
        }

        public void get_position (int x, int y) {
            x = this.x;
            y = this.y;
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
            return (width == 0 || height == 0);
        }
    }
}
