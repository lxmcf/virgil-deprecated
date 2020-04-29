namespace Virgil {
    public class Vector2D {
        public float x = 0.0f;
        public float y = 0.0f;

        public Vector2D (float destination_x, float destination_y) {
            this.x = destination_x;
            this.y = destination_y;
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