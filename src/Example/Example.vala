using Virgil;
using Virgil.Graphics;
using Virgil.Input;

using SDL.Input;

namespace Example {
    public class ExampleGame : Virgil.Game {
        public Sprite sprite;
        public Vector2D sprite_position;

        public int count = 0;

        public ExampleGame () {
            initialise ();
        }

        public override void start () {
            sprite = new Sprite (manager_window.get_renderer (), "assets/default.png");
            sprite_position = new Vector2D (0.0f, 0.0f);

            manager_window.set_background_colour (new Colour (88, 151, 233));

            manager_keyboard.add_key (new Virgil.Input.Key (SDL.Input.Keycode.ESCAPE));
        }

        public override void update () {
            if (manager_keyboard.check_keyboard (SDL.Input.Keycode.ESCAPE)) {
                count++;
            }
        }

        public override void draw () {
            sprite.draw (count, count);
        }
    }
}
