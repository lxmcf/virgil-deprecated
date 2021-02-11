using Virgil.Core;
using Virgil.Input;

namespace Virgil {
    public class Game {
        private bool _running;

        private InitFlags _initialised_modules;
        private KeyboardState _keyboard_state;
        private GameWindow _window;

        private EventHandler _event;

        public Game () {
            if (_init ()) {
                _window = new GameWindow ();
                _event = new EventHandler ();

                _keyboard_state = new KeyboardState ();
                Keyboard.init (_keyboard_state);

                _link_events ();



                _running = true;
            } else {
                // TODO: Create log systems
            }
        }

        ~Game () {
            if (InitFlags.SDL in _initialised_modules) SDL.quit ();
        }

        public int run () {
            start ();

            while (running ()) {
                _event.update ();

                update ();
                draw ();
            }

            return 0;
        }

        // Default runtime methods
        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public bool running () {
            return _running;
        }

        private bool _init () {
            int sdl_init = SDL.init ();

            if (sdl_init == 0) _initialised_modules += InitFlags.SDL;

            return (sdl_init == 0);
        }

        public int quit () {
            if (_running) {
                _running = false;

                return 0;
            }

            return 1;
        }

        private void _link_events () {
            _event.on_close.connect (() => {
                quit ();
            });

            _event.on_key_update.connect ((key, is_down) => {
                _keyboard_state.update_key (key.keysym.sym, is_down);
            });

            //  _event.on_mouse_update.connect ((button, is_down) => {
            //      mouse.update_button (button, is_down);
            //  });

            //  _event.on_mouse_motion.connect ((motion) => {
            //      mouse.update_position (motion);
            //  });
        }
    }
}
