using SDL;
using SDL.Video;
using SDLGraphics;

namespace Virgil {
    public class Game {
        public int window_width;
        public int window_height;

        public bool running;

        public static Window main_window;
        public static Renderer main_renderer;
        public static FramerateManager main_framerate { get; private set; }

        public Game () {
            SDL.init (SDL.InitFlag.EVERYTHING);

            main_framerate = FramerateManager ();
            main_framerate.init ();
        }

        public void initialise (int width, int height, string window_title = "Virgil Game Engine", uint32 window_flags = SDL.Video.WindowFlags.ALLOW_HIGHDPI | SDL.Video.WindowFlags.SHOWN) {
            main_window = new Window (window_title, Window.POS_CENTERED, Window.POS_CENTERED, width, height, window_flags);
            main_renderer = Renderer.create (main_window, -1, RendererFlags.ACCELERATED | RendererFlags.PRESENTVSYNC);

            window_width = width;
            window_height = height;

            running = true;
        }

        public void run () {
            start ();

            while (running) {
                main_framerate.run ();

                events ();
                update ();
                draw ();
            }

            SDL.quit ();
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

        public virtual void start () {}
        public virtual void update () { }
        public virtual void draw () { }
    }
}
