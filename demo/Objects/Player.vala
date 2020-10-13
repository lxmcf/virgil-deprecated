using Virgil;
using Virgil.Graphics;
using Virgil.FileSystem;

using SDL.Input;

namespace Virgil {
    public class Player {
        public Vector2 transform { get; private set; }
        public Texture2D sprite { get; private set; }

        private double speed;

        public Player () {
            sprite = new Texture2D (
                new Asset.from_resource ("/virgil/image/default.png")
            );

            transform = new Vector2.zero ();
            speed = 100.0;
        }

        public void update (double delta_time) {
            var keyboard = Game.keyboard;

            double xaxis = (keyboard.check_key_raw (Keycode.d) - keyboard.check_key_raw (Keycode.a)) * speed;
            double yaxis = (keyboard.check_key_raw (Keycode.s) - keyboard.check_key_raw (Keycode.w)) * speed;

            double test = delta_time / 1000.0;

            double move_x = xaxis * test;
            double move_y = yaxis * test;

            transform.add (new Vector2 ((float)move_x, (float)move_y));
        }
    }
}


