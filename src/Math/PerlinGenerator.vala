namespace Virgil.Math {
    public class PerlinGenerator {
        private uint8[] _hash;
        private int _seed;

        public PerlinGenerator () {
            _generate_hash ();

            randomise ();
        }

        public void randomise () {
            _seed = Random.int_range (0, int32.MAX);
        }

        public void set_seed (int seed) {
            _seed = seed;
        }

        public int get_seed () {
            return _seed;
        }

        public float get_noise_2D (float x, float y, float frequency, int depth) {  // vala-lint=naming-convention
            float xa = x * frequency;
            float ya = y * frequency;

            float amp = 1.0f;
            float fin = 0;
            float div = 0.0f;

            for (int i = 0; i < depth; i++) {
                div += 256 * amp;
                fin += _get_noise_2D (xa, ya) * amp;
                amp /= 2;

                xa *= 2;
                ya *= 2;
            }

            return fin / div;
        }

        private float _lerp_smooth (float x, float y, float value) {
            float new_value = value * value * (3 - 2 * value);

            return flerp (x, y, new_value);
        }

        private int _get_hash_2D (int x, int y) {  // vala-lint=naming-convention
            int index_y = (y + _seed) % 256;

            if (index_y < 0) {
                index_y += 256;
            }

            int index_x = (_hash[index_y] + x) % 256;

            if (index_x < 0) {
                index_x += 256;
            }

            return _hash[index_x];
        }

        private float _get_noise_2D (float x, float y) { // vala-lint=naming-convention
            int int_x = (int)x;
            int int_y = (int)y;

            float remain_x = x - int_x;
            float remain_y = y - int_y;

            int top_left = _get_hash_2D (int_x, int_y);
            int top_right = _get_hash_2D (int_x + 1, int_y);
            int bottom_left = _get_hash_2D (int_x, int_y + 1);
            int bottom_right = _get_hash_2D (int_x + 1, int_y + 1);

            float low = _lerp_smooth (top_left, top_right, remain_x);
            float high = _lerp_smooth (bottom_left, bottom_right, remain_x);

            return _lerp_smooth (low, high, remain_y);
        }

        private void _generate_hash () {
            _hash = new uint8[256] {
                208, 34, 231, 213, 32, 248, 233, 56, 161, 78, 24, 140, 71, 48, 140, 254, 245, 255, 247, 247, 40,
                185, 248, 251, 245, 28, 124, 204, 204, 76, 36, 1, 107, 28, 234, 163, 202, 224, 245, 128, 167, 204,
                9, 92, 217, 54, 239, 174, 173, 102, 193, 189, 190, 121, 100, 108, 167, 44, 43, 77, 180, 204, 8, 81,
                70, 223, 11, 38, 24, 254, 210, 210, 177, 32, 81, 195, 243, 125, 8, 169, 112, 32, 97, 53, 195, 13,
                203, 9, 47, 104, 125, 117, 114, 124, 165, 203, 181, 235, 193, 206, 70, 180, 174, 0, 167, 181, 41,
                164, 30, 116, 127, 198, 245, 146, 87, 224, 149, 206, 57, 4, 192, 210, 65, 210, 129, 240, 178, 105,
                228, 108, 245, 148, 140, 40, 35, 195, 38, 58, 65, 207, 215, 253, 65, 85, 208, 76, 62, 3, 237, 55, 89,
                232, 50, 217, 64, 244, 157, 199, 121, 252, 90, 17, 212, 203, 149, 152, 140, 187, 234, 177, 73, 174,
                193, 100, 192, 143, 97, 53, 145, 135, 19, 103, 13, 90, 135, 151, 199, 91, 239, 247, 33, 39, 145,
                101, 120, 99, 3, 186, 86, 99, 41, 237, 203, 111, 79, 220, 135, 158, 42, 30, 154, 120, 67, 87, 167,
                135, 176, 183, 191, 253, 115, 184, 21, 233, 58, 129, 233, 142, 39, 128, 211, 118, 137, 139, 255,
                114, 20, 218, 113, 154, 27, 127, 246, 250, 1, 8, 198, 250, 209, 92, 222, 173, 21, 88, 102, 219
            };
        }
    }
}
