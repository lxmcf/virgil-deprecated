namespace Virgil {
    public class Point {
        public int x;
        public int y;

        public Point (int x, int y) {
            this.x = x;
            this.y = y;
        }

        public Point.zero () {
            x = 0;
            y = 0;
        }

        public bool equals (Point point) {
            bool does_x = this.x == point.x;
            bool does_y = this.y == point.y;

            return (does_x && does_y);
        }

        public void add (Point point) {
            x += point.x;
            y += point.y;
        }

        public void subtract (Point point) {
            x -= point.x;
            y -= point.y;
        }

        public void multiply (Point point) {
            x *= point.x;
            y *= point.y;
        }

        public void divide (Point point) {
            x /= point.x;
            y /= point.y;
        }

        public string to_string () {
            string string_x = x.to_string ();
            string string_y = y.to_string ();

            return @"{ x: $string_x, y: $string_y }";
        }
    }
}
