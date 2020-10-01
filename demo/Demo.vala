using Virgil.Engine;
using Virgil.Graphics;
using Virgil.FileSystem;

using SDL.Input;

namespace Virgil {
    public class Demo : Game {
        public Sprite sprite;
        public SpriteBatch batch;

        public override void start () {
            window.title = "Virgil Demo";

            keyboard.add_key (Keycode.LCTRL);
            keyboard.add_key (Keycode.q);

            keyboard.add_key (Keycode.ESCAPE);

            sprite = new Sprite (new Asset.from_resource ("/virgil/image/default.png"));
            batch = new SpriteBatch ();
        }

        public override void update () {
            
        }

        public override void draw () {
            renderer.clear_colour (new Colour (88, 151, 233));

            batch.begin ();
            batch.draw (sprite, 128, 128);
            batch.end ();
        }
    }
}

public static int main (string[] args) {
    Virgil.Demo demo = new Virgil.Demo ();

    return demo.run ();
}
