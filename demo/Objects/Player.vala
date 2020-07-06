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
        private unowned MouseManager mouse;
        private unowned RenderManager render;

        public Player () {
            transform = new Vector2i (0, 0);

            sprite = new Sprite ("assets/default.png");
            keyboard = GameState.get_keyboard_state ();
            mouse = GameState.get_mouse_state ();
            render = GameState.get_render_state ();
        }

        public override void update () {
            xaxis = (int)keyboard.check_key (Keycode.d) - (int)keyboard.check_key (Keycode.a);
            yaxis = (int)keyboard.check_key (Keycode.s) - (int)keyboard.check_key (Keycode.w);

            transform.add (new Vector2i (xaxis, yaxis));
        }

        public override void draw () {
            render.draw_sprite (sprite, transform.x, transform.y);
        }
    }
}
