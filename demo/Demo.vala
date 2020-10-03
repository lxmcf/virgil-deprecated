using Virgil.Engine;
using Virgil.Graphics;
using Virgil.FileSystem;

using SDL.Input;

namespace Virgil {
    public class Demo : Game {
        public Player player;
        public SpriteBatch batch;

        public override void start () {
            window.title = "Virgil Demo";

            keyboard.add_key (Keycode.w);
            keyboard.add_key (Keycode.a);
            keyboard.add_key (Keycode.s);
            keyboard.add_key (Keycode.d);

            player = new Player ();

            batch = new SpriteBatch ();
        }

        public override void update () {
            player.update (delta_time);

            // print (((double)test_var / (double)10000).to_string () + "\n");
        }

        public override void draw () {
            renderer.clear_colour (new Colour (88, 151, 233));

            batch.begin ();
            batch.draw (player.sprite, (int)player.transform.x, (int)player.transform.y);
            batch.end ();
        }
    }
}

public static int main (string[] args) {
    Virgil.Demo demo = new Virgil.Demo ();

    return demo.run ();
}
