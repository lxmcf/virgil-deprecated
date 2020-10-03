using Virgil;
using Virgil.Graphics;
using Virgil.FileSystem;

using SDL.Input;

namespace Virgil {
    public class Player {
        public Vector2 transform { get; private set; }
        public Sprite sprite { get; private set; }

        public Player () {
            sprite = new Sprite (
                new Asset.from_resource ("/virgil/image/default.png")
            );

            transform = new Vector2.zero ();
        }

        public void update (uint32 delta_time) {
            var keyboard = Game.keyboard;

            double xaxis = (keyboard.check_key_raw (Keycode.d) - keyboard.check_key_raw (Keycode.a)) * (delta_time / 100000);
            double yaxis = (keyboard.check_key_raw (Keycode.s) - keyboard.check_key_raw (Keycode.w)) * (delta_time / 100000);
        
            transform.add (new Vector2 ((float)xaxis * 200.0f, (float)yaxis * 200.0f));
        }
    }
}