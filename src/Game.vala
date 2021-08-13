using Virgil.Core;
using Virgil.Input;
using Virgil.Debug;

namespace Virgil {
    public class Game {
        private bool _running;

        private static GameState _game_state;

        private InitFlag _initialised_modules;
        private Window _window;
        private Renderer _renderer;

        private EventHandler _event;
        private FramerateHandler _framerate;

        public Game () {
            if (_init ()) {
                _window = new Window ();
                _renderer = new Renderer (_window);

                _event = new EventHandler ();
                _framerate = new FramerateHandler ();

                Keyboard.init ();
                Mouse.init ();

                _game_state = new GameState () {
                    window = _window,
                    renderer = _renderer,
                    framerate = _framerate
                };

                _running = true;

                _link_events ();

            } else {
                print_error ("{ SDL_Error: " + SDL.get_error () + "}");
            }
        }

        ~Game () {
            if (InitFlag.SDL in _initialised_modules) SDL.quit ();
            if (InitFlag.SDL_TTF in _initialised_modules) SDLTTF.quit ();
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

            return EXIT_SUCCESS;
        }

        // Default runtime methods
        public virtual void start () {
            on_start ();
        }

        public virtual void update () {
            on_update ();
        }

        public virtual void draw () {
            on_draw ();
        }

        public signal void on_start ();
        public signal void on_update ();
        public signal void on_draw ();

        public bool running () {
            return _running;
        }

        public int quit () {
            if (_running) {
                _running = false;

                return EXIT_SUCCESS;
            }

            return EXIT_FAIL;
        }

        private bool _init () {
            // SDL and external modules
            int sdl_init = SDL.init ();
            int sdl_ttf_init = SDLTTF.init ();

            // Internal modules
            set_print_level (PrintLevel.MESSAGE);

            if (sdl_init == 0) _initialised_modules += InitFlag.SDL;
            if (sdl_ttf_init == 0) _initialised_modules += InitFlag.SDL_TTF;

            return (sdl_init == 0) & (sdl_ttf_init == 0);
        }

        private void _link_events () {
            _event.on_close.connect (() => {
                quit ();
            });

            _event.on_key_update.connect ((key, is_down) => {
                Keyboard.update_key (key, is_down);
            });

            _event.on_mouse_update.connect ((button, is_down) => {
                Mouse.update_button (button, is_down);
            });

            _event.on_mouse_motion.connect ((x, y, relative_x, relative_y) => {
                Mouse.set_position (x, y);
            });
        }

        // TODO: Remove this and GameState
        public static unowned GameState get_state () {
            return _game_state;
        }
    }
}
