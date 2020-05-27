using SDL;
using SDL.Video;

using Virgil.Graphics;

namespace Virgil {
    public class Game {
        public bool running;

        public WindowManager manager_window;
        public EventManager manager_event;
        public FramerateManager manager_framerate;
        public KeyboardManager manager_keyboard;

        public Game () {
            SDL.init (SDL.InitFlag.EVERYTHING);

            manager_window = new WindowManager ();
            manager_framerate = new FramerateManager ();

            manager_keyboard = new KeyboardManager ();

            manager_event = new EventManager ();
            link_events ();
        }

        public void initialise () {
            manager_window.create_window ();
            manager_window.create_renderer ();

            running = true;
        }

        public void run () {
            start ();

            while (running) {
                manager_framerate.update ();

                manager_window.renderer_begin ();

                manager_event.update ();

                update ();
                draw ();

                manager_window.renderer_end ();
            }

            SDL.quit ();
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        private void link_events () {
            // Link basic quit event
            manager_event.close_event.connect (() => {
                running = false;
            });

            manager_event.key_down_event.connect ((e, key) => {
                manager_keyboard.update_key (key.keysym.sym, true);
            });

            manager_event.key_up_event.connect ((e, key) => {
                manager_keyboard.update_key (key.keysym.sym, false);
            });
        }
    }
}
