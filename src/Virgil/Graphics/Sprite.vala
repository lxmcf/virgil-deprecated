using Virgil;

using SDL.Video;
using SDLImage;

namespace Virgil.Graphics {
    public class Sprite {
        public Texture? texture;
        public Rect texture_rectangle;

        public int width;
        public int height;

        public int scale_x = 1;
        public int scale_y = 1;

        private unowned Renderer renderer;

        public Sprite (Renderer sprite_renderer, string sprite_file = "") {
            texture = load_texture (sprite_renderer, sprite_file);
            texture.query (out texture_format, null, out width, out height);

            texture_rectangle.x = 0;
            texture_rectangle.y = 0;

            texture_rectangle.w = width;
            texture_rectangle.h = height;
        }

        // Not yet implimented
        public Sprite.from_spritesheet () { }

        // Not yet implimented
        public Sprite.from_tilesheets () { }

        public bool draw (int position_x = 0, int position_y = 0) {
            if(texture != null) {
                Rect destination_rectange = {
                    x = position_x,
                    y = position_y,
                    w = width * scale_x,
                    h = height * scale_y
                }

                renderer.copy (texture, destination_rectange, texture_rectangle);

                return true;
            } else {
                return false;
            }
        }
    }
}
