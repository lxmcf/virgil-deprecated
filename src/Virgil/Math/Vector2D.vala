namespace Virgil {
    public class Vector2D {
        public float x = 0.0f;
        public float y = 0.0f;

        public Vector2D (float destination_x, float destination_y) {
            this.x = destination_x;
            this.y = destination_y;
        }

        public void Add (Vector2D vector) {
            x += vector.x;
            y += vector.y;
        }

        public void Subtract (Vector2D vector) {
            x -= vector.x;
            y -= vector.y;
        }

        public void Multiply (Vector2D vector) {
            x *= vector.x;
            y *= vector.y;
        }

        public void Divide (Vector2D vector) {
            x /= vector.x;
            y /= vector.y;
        }
    }
}
