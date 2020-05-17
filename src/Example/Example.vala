using Virgil;
using Virgil.Graphics;

using SDL.Input;

namespace Example {
    public class ExampleGame : Virgil.Game {
        public Sprite sprite;

        public int count = 0;

        public ExampleGame () {
            initialise ();
        }

        public override void start () {
            sprite = new Sprite (main_window.get_renderer (), "assets/default.png");

            main_window.set_background_colour (new Colour (88, 151, 233));
        }

        public override void update () {
            count++;

            print (main_framerate.frame_count.to_string () + "\n");
        }

        public override void draw () {
            sprite.draw (count, count);
        }
    }
}
