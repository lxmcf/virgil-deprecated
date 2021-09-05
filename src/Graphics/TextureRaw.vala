using Virgil.Stb;

namespace Virgil.Graphics {
    public class TextureRaw {
        private uchar* _pixels;

        private uint _width;
        private uint _height;
        private uint _pitch;
        private uint _channels;
        private uint _pixel_count;

        public uint width {
            get { return _width; }
        }

        public uint height {
            get { return _height; }
        }

        public uint pitch {
            get { return _pitch; }
        }

        public uint channels {
            get { return _channels; }
        }

        public uint pixel_count {
            get { return _pixel_count; }
        }

        public uint length {
            get { return _pixel_count * _channels; }
        }

        public TextureRaw (uint width, uint height, uint channels = 4) {
            set_size (width, height);

            _channels = channels;
            _pitch = _width * _channels;
            _pixel_count = _width * height;

            _pixels = new uchar[_pitch * _height];

            // Sets each pixel to 0x000000FF (Opaque black)
            for (uint i = 0; i < _pitch * height; i++) {
                if ((i + 1) % 4 == 0) {
                    // Alpha
                    _pixels[i] = 0xFF;
                } else {
                    _pixels[i] = 0x00;
                }
            }
        }

        public TextureRaw.from_file (string filename) {
            _pixels = Image.load (filename, out _width, out _height, out _channels);

            _pixel_count = _width * height;
        }

        ~TextureRaw () {
            delete _pixels;
        }

        public void set_size (uint width, uint height) {
            _width = width;
            _height = height;
        }

        public int set_pixel (int x, int y, uint8 red, uint8 green, uint8 blue, uint8 alpha = 255) {
            uint pixel = _channels * (y * width + x);

            if (pixel + (_channels - 1) > length) {
                return EXIT_FAIL;
            }

            _pixels[pixel + 0] = red;
            _pixels[pixel + 1] = green;
            _pixels[pixel + 2] = blue;
            _pixels[pixel + 3] = alpha;

            return EXIT_SUCCESS;
        }

        // TODO: Impliment ByteArray to allow to avoid memory leaks, this will do for now
        public int set_pixels (uchar* pixels) {
            Memory.copy (_pixels, pixels, length);

            return 0;
        }

        public int set_pixel_colour (int x, int y, Colour colour) {
            return set_pixel (x, y, colour.red, colour.green, colour.blue, colour.alpha);
        }

        public uchar* get_pixels () {
            return _pixels;
        }

        public void get_size (out uint width, out uint height) {
            width = _width;
            height = _height;
        }

        public int get_pixel (int x, int y, out uint8 red, out uint8 green, out uint8 blue, out uint8 alpha) {
            uint pixel = _channels * (y * width + x);

            red = 0;
            green = 0;
            blue = 0;
            alpha = 0;

            if (pixel + (_channels - 1) > length) {
                return EXIT_FAIL;
            }

            red = _pixels[pixel];
            green = _pixels[pixel + 1];
            blue = _pixels[pixel + 2];
            alpha = _pixels[pixel + 3];

            return EXIT_SUCCESS;
        }

        public void clear () {
            for (uint i = 0; i < _pitch * _height; i++) {
                if ((i + 1) % 4 == 0) {
                    // Alpha
                    _pixels[i] = 0xFF;
                } else {
                    _pixels[i] = 0x00;
                }
            }
        }

        public void clear_colour (Colour colour) {
            for (uint i = 0; i < _pixel_count; i++) {
                _pixels[(i * _channels) + 0] = colour.red;
                _pixels[(i * _channels) + 2] = colour.blue;
                _pixels[(i * _channels) + 3] = colour.alpha;
                _pixels[(i * _channels) + 1] = colour.green;
            }
        }
    }
}
