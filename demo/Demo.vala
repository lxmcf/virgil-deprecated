using Virgil;
using Virgil.Graphics;
using Virgil.Input;

using SDL.Input;

namespace Virgil {
    public class Demo : Game {
        public Player player;

        public override void start () {
            player = new Player (manager_window.get_renderer ());

            manager_window.set_background_colour (new Colour (88, 151, 233));

            keyboard.add_key (new Virgil.Input.Key (Keycode.w));
            keyboard.add_key (new Virgil.Input.Key (Keycode.a));
            keyboard.add_key (new Virgil.Input.Key (Keycode.s));
            keyboard.add_key (new Virgil.Input.Key (Keycode.d));

            keyboard.add_key (new Virgil.Input.Key (Keycode.SPACE));
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
