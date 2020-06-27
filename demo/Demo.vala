using Virgil;
using Virgil.Graphics;
using Virgil.Input;

using SDL.Input;

namespace Virgil {
    public class Demo : Game {
        public Player player;

        public override void start () {
            player = new Player ();

            render.set_background_colour (new Colour (88, 151, 233));

            keyboard.add_key (Keycode.w);
            keyboard.add_key (Keycode.a);
            keyboard.add_key (Keycode.s);
            keyboard.add_key (Keycode.d);

            keyboard.add_key (Keycode.SPACE);
        }

        public override void update () {
            player.update ();
        }

        public override void draw () {
            player.draw ();
        }
    }

    public static int main (string[] args) {
        var demo = new Virgil.Demo ();

        return demo.run ();
    }
}
