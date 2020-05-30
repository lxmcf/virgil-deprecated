using SDL;
using SDL.Video;

using Virgil.Graphics;

namespace Virgil {
    public class Game {
        public bool running;

        public WindowManager manager_window;
        public EventManager event;
        public FramerateManager framerate;
        public KeyboardManager keyboard;

        public Game () {
            SDL.init (SDL.InitFlag.EVERYTHING);

            manager_window = new WindowManager ();
            framerate = new FramerateManager ();

            keyboard = new KeyboardManager ();

            event = new EventManager ();
            link_events ();

            manager_window.create_window ();
            manager_window.create_renderer ();

            running = true;
        }

        public void run () {
            start ();

            while (running) {
                framerate.update ();

                manager_window.renderer_begin ();

                event.update ();

                update ();
                draw ();

                manager_window.renderer_end ();
            }

            SDL.quit ();
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public void quit () {
            running = false;
        }

        private void link_events () {
            event.close_event.connect (() => {
                quit ();
            });

            event.key_down_event.connect ((e, key) => {
                keyboard.update_key (key.keysym.sym, true);
            });

            event.key_up_event.connect ((e, key) => {
                keyboard.update_key (key.keysym.sym, false);
            });
        }
    }
}
