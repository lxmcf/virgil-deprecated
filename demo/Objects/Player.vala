using Virgil;
using Virgil.Graphics;
using Virgil.Core;

using SDL.Video;
using SDL.Input;

// FIXME: Migrate all mentions of SDL to Virgil equal
namespace Demo {
    public class Player : IGameObject {
        public Vector2i transform;

        public Sprite sprite;

        private unowned KeyboardManager keyboard;
        private unowned MouseManager mouse;
        private unowned RenderManager render;

        public Player () {
            transform = new Vector2i.zero ();

            sprite = new Sprite.from_gresource ("/virgil/image/default.png");
            keyboard = GameState.get_keyboard_state ();
            mouse = GameState.get_mouse_state ();
            render = GameState.get_render_state ();
        }

        public void update () {
            int xaxis = keyboard.check_key_raw (Keycode.d) - keyboard.check_key_raw (Keycode.a);
            int yaxis = keyboard.check_key_raw (Keycode.s) - keyboard.check_key_raw (Keycode.w);

            transform.add (new Vector2i (xaxis, yaxis));
        }

        public void draw () {
            render.draw_sprite (sprite, (int)transform.x, (int)transform.y);
        }
    }
}
