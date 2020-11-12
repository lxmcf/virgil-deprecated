using Virgil.Engine;
using Virgil.Utility;

namespace Virgil {
    public class Game {
        public bool is_running;

        // TODO: Consider marking these as private and implementing an actual method to return an unowned reference
        public static GameWindow? window { get; private set; }
        public static GameRenderer? renderer { get; private set; }

        public static EventHandler event { get; private set; }
        public static KeyboardHandler keyboard { get; private set; }
        public static MouseHandler mouse { get; private set; }
        public static FramerateHandler framerate { get; private set; }

        public static Utility.Log log { get; private set; }

        // FIXME: Work out a less scuffed implimentation of DT
        public double delta_time;

        public Game () {
            int sdl_init = SDL.init ();

            SDLTTF.init ();

            delta_time = 0;

            if (sdl_init == 0) {
                log = new Utility.Log ();

                window = new GameWindow () {
                    title = @"$PROJECT_NAME v$PROJECT_VERSION"
                };

                window.center ();

                renderer = new GameRenderer (window);

                event = new EventHandler ();
                keyboard = new KeyboardHandler ();
                mouse = new MouseHandler ();
                framerate = new FramerateHandler (165);

                _link_events ();

                is_running = true;
            } else {
                log.error (SDL.get_error ());
            }
        }

        public int run () {
            start ();

            while (is_running) {
                delta_time = framerate.update ();
                renderer.clear ();

                event.update ();

                update ();

                draw ();

                renderer.present ();
            }

            SDL.quit ();

            return EXIT_SUCCESS;
        }

        // Default runtime methods
        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public void quit () {
            is_running = false;
        }

        private void _link_events () {
            event.on_close.connect (() => {
                quit ();
            });

            event.on_key_update.connect ((key, is_down) => {
                keyboard.update_key (key.keysym.sym, is_down);
            });

            event.on_mouse_update.connect ((button, is_down) => {
                mouse.update_button (button, is_down);
            });

            event.on_mouse_motion.connect ((motion) => {
                mouse.update_position (motion);
            });
        }
    }
}
