using Virgil.Core;
using Virgil.Input;
using Virgil.Debug;

namespace Virgil {
    public class Game {
        private bool _running;

        private static GameState _game_state;

        private InitFlags _initialised_modules;
        private GameWindow _window;
        private GameRenderer _renderer;

        private EventHandler _event;
        private FramerateHandler _framerate;

        public Game () {
            if (_init ()) {
                _window = new GameWindow ();
                _renderer = new GameRenderer (_window);

                _event = new EventHandler ();
                _framerate = new FramerateHandler ();

                Keyboard.init ();

                _game_state = new GameState () {
                    window = _window,
                    renderer = _renderer,
                    framerate = _framerate
                };

                _running = true;

                _link_events ();
            } else {
                print_error ("SDL failed to initialise! { SDL_Error: " + SDL.get_error () + "}");
            }
        }

        ~Game () {
            if (InitFlags.SDL in _initialised_modules) SDL.quit ();
        }

        public int run () {
            start ();

            while (running ()) {
                _framerate.update ();

                _renderer.clear ();
                _event.update ();

                update ();

                draw ();

                _renderer.present ();
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
                Keyboard.update_key (key.keysym.sym, is_down);
            });

            //  _event.on_mouse_update.connect ((button, is_down) => {
            //      mouse.update_button (button, is_down);
            //  });

            //  _event.on_mouse_motion.connect ((motion) => {
            //      mouse.update_position (motion);
            //  });
        }

        public static unowned GameState get_state () {
            return _game_state;
        }
    }
}
