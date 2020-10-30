namespace Virgil {
    public class Vector3 {
        public float x;
        public float y;
        public float z;

        public Vector3 (float x, float y, float z) {
            this.x = x;
            this.y = y;
            this.z = z;
        }

        public Vector3.zero () {
            x = 0.0f;
            y = 0.0f;
            z = 0.0f;
        }

        public void get_value (out float x, out float y, out float z) {
            x = this.x;
            y = this.y;
            z = this.z;
        }

        public void get_value_int (out int x, out int y) {
            x = (int)this.x;
            y = (int)this.y;
            z = (int)this.z;
        }

        public bool equals (Vector3 vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;
            bool does_z = this.z == vector.z;

            return (does_x && does_y && does_z);
        }

        public void add (Vector3 vector) {
            x += vector.x;
            y += vector.y;
            z += vector.z;
        }

        public void subtract (Vector3 vector) {
            x -= vector.x;
            y -= vector.y;
            z -= vector.z;
        }

        public void multiply (Vector3 vector) {
            x *= vector.x;
            y *= vector.y;
            z *= vector.z;
        }

        public void divide (Vector3 vector) {
            x /= vector.x;
            y /= vector.y;
            z /= vector.z;
        }
    }
}
