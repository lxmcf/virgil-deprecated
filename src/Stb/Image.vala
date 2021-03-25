// NOTE: Work out some way to not require this

namespace Virgil.Stb.Image {
    enum Channels {
        DEFAULT = 0,
        GREY = 1,
        GREY_ALPHA = 2,
        RGB = 3,
        RGB_ALPHA = 4
    }

    public static uchar* load (string file, out int width, out int height, out int channels, int desired_channels = 4) {
        return Stbi.__load (file, out width, out height, out channels, desired_channels);
    }

    public static int load_info (string file, out int width, out int height, out int channels) {
        return Stbi.__load_info (file, out width, out height, out channels);
    }
}
