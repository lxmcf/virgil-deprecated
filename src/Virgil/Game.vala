using SDL;
using SDL.Video;
using SDLGraphics;

using Virgil.Graphics;

namespace Virgil {
    public class Game {
        public int window_width;
        public int window_height;

        public bool running;

        public Window main_window;
        public Renderer main_renderer;
        public FramerateManager main_framerate { get; private set; }

        public Colour draw_colour;

        public Game () {
            SDL.init (SDL.InitFlag.EVERYTHING);

            main_framerate = FramerateManager ();
            main_framerate.init ();

            draw_colour = new Colour ();
        }

        public void initialise (int width, int height, string window_title = "Virgil Game Engine", uint32 window_flags = SDL.Video.WindowFlags.ALLOW_HIGHDPI | SDL.Video.WindowFlags.SHOWN) {
            main_window = new Window (window_title, Window.POS_CENTERED, Window.POS_CENTERED, width, height, window_flags);
            main_renderer = Renderer.create (main_window, -1, RendererFlags.ACCELERATED | RendererFlags.PRESENTVSYNC);

            window_width = width;
            window_height = height;

            main_renderer.set_draw_color (0, 0, 0, 255);
            main_renderer.clear ();

            running = true;
        }

        public void run () {
            start ();

            print ("Game started\n");

            while (running) {
                main_framerate.run ();

                main_renderer.clear ();

                events ();
                update ();
                draw ();

                main_renderer.present ();
            }

            SDL.quit ();

            print ("Game ended\n");
        }

        public void events () {
            Event event;

            while (Event.poll (out event) == 1) {
                switch (event.type) {
                    case EventType.QUIT:
                        running = false;
                    break;
                }
            }
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public void set_draw_colour (Colour colour) {
            draw_colour = colour;

            main_renderer.set_draw_color (draw_colour.red, draw_colour.green, draw_colour.blue, draw_colour.alpha);
        }

    }
}
