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
            texture.query (null, null, out width, out height);

            texture_rectangle.x = 0;
            texture_rectangle.y = 0;

            texture_rectangle.w = width;
            texture_rectangle.h = height;

            renderer = sprite_renderer;
        }

        // Not yet implimented
        public Sprite.from_spritesheet () { }

        // Not yet implimented
        public Sprite.from_tilesheets () { }

        public bool draw (int position_x, int position_y) {
            if(texture != null) {
                var destination_rectange = Rect ();
                destination_rectange.x = position_x;
                destination_rectange.y = position_y;
                destination_rectange.w = width;
                destination_rectange.h = width;

                renderer.copy (texture, texture_rectangle, destination_rectange);

                return true;
            } else {
                return false;
            }
        }
    }
}
