using SDL.Video;

namespace Virgil.Util.SDL {
    internal static Rect rectanle_to_sdl_rect (Rectangle rectangle) {
        Rect rect = {
            rectangle.x,
            rectangle.y,
            rectangle.width,
            rectangle.height
        };

        return rect;
    }

    internal static Color colour_to_sdl_color (Colour colour) {
        Color col = {
            colour.red,
            colour.green,
            colour.blue,
            colour.alpha
        };

        return col;
    }
}
