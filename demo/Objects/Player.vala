using Virgil;
using Virgil.Graphics;

using SDL.Video;
using SDL.Input;

namespace Virgil {
    public class Player : GameObject {
        public Vector2i transform;

        public Sprite sprite;

        private unowned KeyboardManager keyboard;
        private unowned MouseManager mouse;
        private unowned RenderManager render;
        private unowned FramerateManager frame;

        public Player () { 
            transform = new Vector2i.zero ();

            sprite = new Sprite ("assets/default.png");
            keyboard = GameState.get_keyboard_state ();
            mouse = GameState.get_mouse_state ();
            render = GameState.get_render_state ();
            frame = GameState.get_framerate_state ();
        }

        public override void update () {
            int xaxis = (int)keyboard.check_key (Keycode.d) - (int)keyboard.check_key (Keycode.a);
            int yaxis = (int)keyboard.check_key (Keycode.s) - (int)keyboard.check_key (Keycode.w);

            transform.add (new Vector2i (xaxis, yaxis));

            print (frame.delta_time.to_string () + "\n");
        }

        public override void draw () {
            render.draw_sprite (sprite, (int)transform.x, (int)transform.y);
        }
    }
}
