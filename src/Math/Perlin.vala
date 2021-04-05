using Virgil.Debug;

namespace Virgil.Math {
    public class Perlin {
        // TODO: Rewrite to use float rather than double
        // TODO: Clean everything up... This is a mess... The dev who did this should give up
        private static bool _is_initialised;

        private static int[] _hash;
        private static int _seed;

        public static void randomise () {
            _seed = Random.int_range (0, int32.MAX);

            print_message ("Seed: " + _seed.to_string ());
        }

        public static double get_noise_2D (double x, double y, double frequency, int depth) {
            _init ();

            double xa = x * frequency;
            double ya = y * frequency;

            double amp = 1.0;
            double fin = 0;
            double div = 0.0;

            for (int i = 0; i < depth; i++) {
                div += 256 * amp;
                fin += _noise_2D (xa, ya) * amp;
                amp /= 2;

                xa *= 2;
                ya *= 2;
            }

            return fin / div;
        }

        private static double _lerp (double x, double y, double value) {
            return x + value * (y - x);
        }

        private static double _lerp_smooth (double x, double y, double value) {
            double new_value = value * value * (3 - 2 * value);

            return _lerp (x, y, new_value);
        }

        private static int _noise_2 (int x, int y) {
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

        private static double _noise_2D (double x, double y) {
            int position_x = (int)x;
            int position_y = (int)y;

            double fractal_x = x - position_x;
            double fractal_y = y - position_y;

            int s = _noise_2 (position_x, position_y);
            int t = _noise_2 (position_x + 1, position_y);
            int u = _noise_2 (position_x, position_y + 1);
            int v = _noise_2 (position_x + 1, position_y + 1);

            double low = _lerp_smooth (s, t, fractal_x);
            double high = _lerp_smooth (u, v, fractal_x);

            return _lerp_smooth (low, high, fractal_y);
        }

        private static int _init () {
            if (_is_initialised) {
                return 1;
            }

            // Testing for now
            _seed = Random.int_range (0, 2048);

            // Still just testing
            _hash = new int[256] {
                208,34,231,213,32,248,233,56,161,78,24,140,71,48,140,254,245,255,247,247,40,
                185,248,251,245,28,124,204,204,76,36,1,107,28,234,163,202,224,245,128,167,204,
                9,92,217,54,239,174,173,102,193,189,190,121,100,108,167,44,43,77,180,204,8,81,
                70,223,11,38,24,254,210,210,177,32,81,195,243,125,8,169,112,32,97,53,195,13,
                203,9,47,104,125,117,114,124,165,203,181,235,193,206,70,180,174,0,167,181,41,
                164,30,116,127,198,245,146,87,224,149,206,57,4,192,210,65,210,129,240,178,105,
                228,108,245,148,140,40,35,195,38,58,65,207,215,253,65,85,208,76,62,3,237,55,89,
                232,50,217,64,244,157,199,121,252,90,17,212,203,149,152,140,187,234,177,73,174,
                193,100,192,143,97,53,145,135,19,103,13,90,135,151,199,91,239,247,33,39,145,
                101,120,99,3,186,86,99,41,237,203,111,79,220,135,158,42,30,154,120,67,87,167,
                135,176,183,191,253,115,184,21,233,58,129,233,142,39,128,211,118,137,139,255,
                114,20,218,113,154,27,127,246,250,1,8,198,250,209,92,222,173,21,88,102,219
            };

            _is_initialised = true;

            return 0;
        }
    }
}
