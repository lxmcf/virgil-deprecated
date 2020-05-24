using SDL;
using SDL.Video;

using Virgil.Graphics;

namespace Virgil {
    public class Game {
        public bool running;

        public WindowManager main_window;
        public EventManager main_event;
        public FramerateManager main_framerate;

        public Game () {
            SDL.init (SDL.InitFlag.EVERYTHING);

            main_window = new WindowManager ();
            main_framerate = new FramerateManager ();

            main_event = new EventManager ();
            main_event.close_event.connect (e => {
                running = false;
            });
        }

        public void initialise () {
            main_window.create_window ();
            main_window.create_renderer ();

            running = true;
        }

        public void run () {
            start ();

            while (running) {
                main_framerate.run ();

                main_window.renderer_begin ();

                main_event.run ();

                update ();
                draw ();

                main_window.renderer_end ();
            }

            SDL.quit ();
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }
    }
}
