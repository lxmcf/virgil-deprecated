namespace Virgil {
    public class Vector2i {
        public int x = 0;
        public int y = 0;

        public Vector2i (int destination_x = 0, int destination_y = 0) {
            this.x = destination_x;
            this.y = destination_y;
        }

        public bool equals (Vector2i vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;

            return (does_x && does_y);
        }

        public void add (Vector2D vector) {
            x += vector.x;
            y += vector.y;
        }

        public void subtract (Vector2D vector) {
            x -= vector.x;
            y -= vector.y;
        }

        public void multiply (Vector2D vector) {
            x *= vector.x;
            y *= vector.y;
        }

        public void divide (Vector2D vector) {
            x /= vector.x;
            y /= vector.y;
        }
    }
}
