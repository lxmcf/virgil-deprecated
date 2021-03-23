// TODO: Impliment per pixel modification


namespace Virgil.Graphics {
    public class TextureRaw {
        private uint8* _pixels;

        private uint _width;
        private uint _height;
        private uint _pitch;
        private uint _channels;

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

        public TextureRaw (uint width, uint height, uint channels = 4) {
            set_size (width, height);

            _channels = channels;
            _pitch = _width * _channels;

            _pixels = new uint8[_pitch * _height];

            // Sets each pixel to 0xFFFFFFFF
            for (uint i = 0; i < _pitch * height; i++) {
                _pixels[i] = 255;
            }
        }

        public TextureRaw.from_file (string filename) {
            _pixels = Stbi.load (filename, out _width, out _height, out _channels);
        }

        ~TextureRaw () {
            delete _pixels;
        }

        public void set_size (uint width, uint height) {
            _width = width;
            _height = height;
        }

        public int set_pixel (int x, int y, uint8 red, uint8 green, uint8 blue, uint8 alpha = 255) {
            return 0;
        }

        public uint8* get_pixels () {
            return _pixels;
        }

        public void get_size (out uint width, out uint height) {
            width = _width;
            height = _height;
        }

        public int get_pixel (int x, int y, out uint8 red, out uint8 green, out uint8 blue, out uint8 alpha) {
            red = 0;
            green = 0;
            blue = 0;
            alpha = 0;

            return 0;
        }
    }
}
