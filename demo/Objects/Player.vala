using Virgil;
using Virgil.Graphics;

using SDL.Input;

namespace Virgil {
    public class Player {
        public Vector2 transform { get; private set; }
        public Texture2D sprite { get; private set; }

        private double speed;

        public Player () {
            sprite = new Texture2D.from_resource ("/virgil/image/default.png");

            transform = new Vector2 (32.0, 32.0);
            speed = 100.0;
        }

        public void update (double delta_time) {
            var keyboard = Game.keyboard;

            double xaxis = (keyboard.check_key_raw (Keycode.d) - keyboard.check_key_raw (Keycode.a)) * speed;
            double yaxis = (keyboard.check_key_raw (Keycode.s) - keyboard.check_key_raw (Keycode.w)) * speed;

            double move_x = xaxis * delta_time;
            double move_y = yaxis * delta_time;

            transform.add (new Vector2 (move_x, move_y));
        }
    }
}
