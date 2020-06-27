namespace Virgil {
    public class Vector2f {
        public float x = 0.0f;
        public float y = 0.0f;

        public Vector2f (float destination_x = 0.0f, float destination_y = 0.0f) {
            this.x = destination_x;
            this.y = destination_y;
        }

        public Vector2f.zero () {
            this.x = 0.0f;
            this.y = 0.0f;
        }

        public bool equals (Vector2f vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;

            return (does_x && does_y);
        }

        public void add (Vector2f vector) {
            x += vector.x;
            y += vector.y;
        }

        public void subtract (Vector2f vector) {
            x -= vector.x;
            y -= vector.y;
        }

        public void multiply (Vector2f vector) {
            x *= vector.x;
            y *= vector.y;
        }

        public void divide (Vector2f vector) {
            x /= vector.x;
            y /= vector.y;
        }

        public void set_value (float? destination_x, float? destination_y) {
            if (destination_x != null) {
                x = destination_x;
            }

            if (destination_y != null) {
                y = destination_y;
            }
        }
    }
}
