using Virgil;
using Virgil.Graphics;

using SDL.Input;

namespace Example {
    public class ExampleGame : Virgil.Game {
        public Sprite sprite;

        public int count = 0;

        public ExampleGame () {
            initialise (640, 360, "Example Project");
        }

        public override void start () {
            sprite = new Sprite (main_renderer, "assets/default.png");

            set_draw_colour (new Colour (88, 151, 233));
        }

        public override void update () {
            count++;
        }

        public override void draw () {
            sprite.draw (count, count);
        }
    }
}
