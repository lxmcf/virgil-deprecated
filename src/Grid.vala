using Virgil.Debug;

namespace Virgil {
    public class Grid <T> {
        private T[,] _cells;

        private uint _width;
        private uint _height;

        public uint width {
            get { return _width; }
        }

        public uint height {
            get { return _height; }
        }

        public Grid (uint width, uint height) {
            _width = width;
            _height = height;

            _cells = new T[_width, _height];
        }

        public Grid.with_value (uint width, uint height, T value) {
            _width = width;
            _height = height;

            _cells = new T[_width, _height];

            fill (value);
        }

        public void fill (T value) {
            for (uint x = 0; x < _width; x++) {
                for (uint y = 0; y < _height; y++) {
                    set_cell (x, y, value);
                }
            }
        }

        public int set_cell (uint x, uint y, T value) {
            bool within_x = x >= 0 && x <= _width;
            bool within_y = y >= 0 && y <= _height;

            if (within_x && within_y) {
                _cells[x, y] = value;

                return EXIT_SUCCESS;
            } else {
                print_warning (@"Grid coordinates [$(x), $(y)] exceed grid size");

                return EXIT_FAIL;
            }
        }

        public void set_region (uint x, uint y, uint width, uint height, T value) {
            for (uint grid_x = 0; grid_x < width; grid_x++) {
                for (uint grid_y = 0; grid_y < height; grid_y++) {
                    set_cell (x + grid_x, y + grid_y, value);
                }
            }
        }

        public void set_region_rectangle (Rectangle rectangle, T value) {
            set_region (rectangle.x, rectangle.y, rectangle.width, rectangle.height, value);
        }

        public T get_cell (uint x, uint y) {
            return _cells[x, y];
        }
    }
}
