namespace Virgil {
    public class Vector2 {
        public double x { get; set; }
        public double y { get; set; }

        public Vector2 (double x, double y) {
            this.x = x;
            this.y = y;
        }

        public Vector2.zero () {
            x = 0.0f;
            y = 0.0f;
        }

        public void get_value (out double x, out double y) {
            x = this.x;
            y = this.y;
        }

        public void get_value_int (out int x, out int y) {
            x = (int)this.x;
            y = (int)this.y;
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
    }
}
