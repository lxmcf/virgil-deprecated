namespace Virgil {
    public class Vector3f {
        public float x;
        public float y;
        public float z;

        public Vector3f (float destination_x, float destination_y, float destination_z) {
            this.x = destination_x;
            this.y = destination_y;
            this.z = destination_z;
        }

        public Vector3f.zero () {
            this.x = 0.0f;
            this.y = 0.0f;
            this.z = 0.0f;
        }

        public bool equals (Vector3f vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;
            bool does_z = this.z == vector.z;

            return (does_x && does_y && does_z);
        }

        public void add (Vector3f vector) {
            x += vector.x;
            y += vector.y;
            z += vector.z;
        }

        public void subtract (Vector3f vector) {
            x -= vector.x;
            y -= vector.y;
            z -= vector.z;
        }

        public void multiply (Vector3f vector) {
            x *= vector.x;
            y *= vector.y;
            z *= vector.z;
        }

        public void divide (Vector3f vector) {
            x /= vector.x;
            y /= vector.y;
            z /= vector.z;
        }

        public Vector2f to_vector2 () {
            return new Vector2f (x, y);
        }
    }
}
