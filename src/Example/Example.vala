using Virgil;
using Virgil.Graphics;
using Virgil.Input;

using SDL.Input;

namespace Example {
    public class ExampleGame : Virgil.Game {
        public Sprite sprite;

        public int count = 0;
        public int xaxis = 0;
        public int yaxis = 0;

        public int x = 0;
        public int y = 0;

        public override void start () {
            sprite = new Sprite (manager_window.get_renderer (), "assets/default.png");

            manager_window.set_background_colour (new Colour (88, 151, 233));

            keyboard.add_key (new Virgil.Input.Key (Keycode.w));
            keyboard.add_key (new Virgil.Input.Key (Keycode.a));
            keyboard.add_key (new Virgil.Input.Key (Keycode.s));
            keyboard.add_key (new Virgil.Input.Key (Keycode.d));

            keyboard.add_key (new Virgil.Input.Key (Keycode.SPACE));
        }

        public override void update () {
            xaxis = (int)keyboard.check_key (Keycode.d) - (int)keyboard.check_key (Keycode.a);
            yaxis = (int)keyboard.check_key (Keycode.s) - (int)keyboard.check_key (Keycode.w);

            x += xaxis;
            y += yaxis;

            if (keyboard.check_key (Keycode.SPACE)) {
                unowned SDL.Video.Renderer rend = manager_window.get_renderer ();
                int out_width = 0;
                int out_height = 0;

                rend.get_logical_size (out out_width, out out_height);
                print ("Logic Width: " + out_width.to_string () + "\nLogic Height: " + out_height.to_string () + "\n");

                rend.get_output_size (out out_width, out out_height);
                print ("Out Width: " + out_width.to_string () + "\nOut Height: " + out_height.to_string () + "\n");
            }
        }

        public override void draw () {
            sprite.draw (x, y);
        }
    }
}
