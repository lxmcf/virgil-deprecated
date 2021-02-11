namespace Virgil {
    public class Vector2 {
        public float x;
        public float y;

        public Vector2 (float x, float y) {
            this.x = x;
            this.y = y;
        }

        public Vector2.zero () {
            x = 0.0f;
            y = 0.0f;
        }

        public bool equals (Vector2 vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;

            return (does_x && does_y);
        }

        public void add (Vector2 vector) {
            x += vector.x;
            y += vector.y;
        }

        public void subtract (Vector2 vector) {
            x -= vector.x;
            y -= vector.y;
        }

        public void multiply (Vector2 vector) {
            x *= vector.x;
            y *= vector.y;
        }

        public void divide (Vector2 vector) {
            x /= vector.x;
            y /= vector.y;
        }

        public Point to_point () {
            return new Point ((int)x, (int)y);
        }

        public string to_string () {
            string string_x = x.to_string ();
            string string_y = y.to_string ();

            return @"{ x: $string_x, y: $string_y }";
        }
    }
}
