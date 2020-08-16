namespace Virgil {
    public class Vector2i {
        public int x;
        public int y;

        public Vector2i (int destination_x, int destination_y) {
            this.x = destination_x;
            this.y = destination_y;
        }

        public Vector2i.zero () {
            this.x = 0;
            this.y = 0;
        }

        public bool equals (Vector2i vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;

            return (does_x && does_y);
        }

        public void add (Vector2i vector) {
            x += vector.x;
            y += vector.y;
        }

        public void subtract (Vector2i vector) {
            x -= vector.x;
            y -= vector.y;
        }

        public void multiply (Vector2i vector) {
            x *= vector.x;
            y *= vector.y;
        }

        public void divide (Vector2i vector) {
            x /= vector.x;
            y /= vector.y;
        }
    }
}
