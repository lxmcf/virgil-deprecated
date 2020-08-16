namespace Virgil {
    public class Vector3i {
        public int x;
        public int y;
        public int z;

        public Vector3i (int destination_x, int destination_y, int destination_z) {
            this.x = destination_x;
            this.y = destination_y;
            this.z = destination_z;
        }

        public Vector3i.zero () {
            this.x = 0;
            this.y = 0;
            this.z = 0;
        }

        public bool equals (Vector3i vector) {
            bool does_x = this.x == vector.x;
            bool does_y = this.y == vector.y;
            bool does_z = this.z == vector.z;

            return (does_x && does_y && does_z);
        }

        public void add (Vector3i vector) {
            x += vector.x;
            y += vector.y;
            z += vector.z;
        }

        public void subtract (Vector3i vector) {
            x -= vector.x;
            y -= vector.y;
            z -= vector.z;
        }

        public void multiply (Vector3i vector) {
            x *= vector.x;
            y *= vector.y;
            z *= vector.z;
        }

        public void divide (Vector3i vector) {
            x /= vector.x;
            y /= vector.y;
            z /= vector.z;
        }

        public Vector2i to_vector2 () {
            return new Vector2i (x, y);
        }
    }
}
