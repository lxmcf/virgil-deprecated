using Virgil.Engine;

using SDL.Input;

namespace Virgil {
    public class Demo : Game {
        public override void start () {
            window.title = "Virgil Demo";

            keyboard.add_key (Keycode.LCTRL);
            keyboard.add_key (Keycode.q);

            keyboard.add_key (Keycode.ESCAPE);
        }

        public override void update () {
            if (keyboard.check_key (Keycode.LCTRL) && keyboard.check_key_pressed (Keycode.q)) {
                quit ();
            }

            if (mouse.check_button_pressed (Input.MouseButton.LEFT)) {
                print ("Left pressed!\n");
            }

            if (mouse.check_button_released (Input.MouseButton.LEFT)) {
                print ("Left released!\n");
            }
        }

        public override void draw () {
            renderer.clear_colour (new Colour (88, 151, 233));
        }
    }
}

public static int main (string[] args) {
    Virgil.Demo demo = new Virgil.Demo ();

    return demo.run ();
}
