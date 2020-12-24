using Virgil.Engine;
using Virgil.Graphics;

using SDL.Input;

namespace Virgil {
    public class Demo : Game {
        public Player player;
        public RenderQueue queue;
        public Font font;

        public override void start () {
            window.title = "Virgil Demo";

            player = new Player ();

            queue = new RenderQueue ();

            font = new Font.from_file ("cc.ttf", 32);
        }

        public override void update () {
            player.update (delta_time / 1000);
        }

        public override void draw () {
            renderer.clear_colour (new Colour (88, 151, 233));

            queue.begin ();
            queue.draw (player.sprite, player.transform);
            queue.end ();
        }
    }
}

public static int main (string[] args) {
    Virgil.Demo demo = new Virgil.Demo ();

    return demo.run ();
}
