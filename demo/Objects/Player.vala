using Virgil;
using Virgil.Graphics;

using SDL.Video;
using SDL.Input;

namespace Virgil {
    public class Player : GameObject {
        public Vector2i transform;
        public int xaxis;
        public int yaxis;

        public Sprite sprite;

        private unowned KeyboardManager keyboard;

        public Player (KeyboardManager keyboard_manager, Renderer renderer) {
            transform = new Vector2i (0, 0);

            sprite = new Sprite (renderer, "assets/default.png");
            keyboard = keyboard_manager;
        }

        public override void update () {
            xaxis = (int)keyboard.check_key (Keycode.d) - (int)keyboard.check_key (Keycode.a);
            yaxis = (int)keyboard.check_key (Keycode.s) - (int)keyboard.check_key (Keycode.w);

            transform.add (new Vector2i (xaxis, yaxis));
        }

        public override void draw () {
            sprite.draw (transform.x, transform.y);
        }
    }
}
