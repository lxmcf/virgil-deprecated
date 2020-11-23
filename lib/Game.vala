using Virgil.Engine;
using Virgil.Utility;

namespace Virgil {
    public class Game {
        private bool _running;
        private InitFlags _initialised;

        // TODO: Consider marking these as private and implementing an actual method to return an unowned reference
        public static GameWindow? window { get; private set; }
        public static GameRenderer? renderer { get; private set; }

        public static EventHandler event { get; private set; }
        public static KeyboardHandler keyboard { get; private set; }
        public static MouseHandler mouse { get; private set; }
        public static FramerateHandler framerate { get; private set; }

        // FIXME: Work out a less scuffed implimentation of DT
        public double delta_time;

        public Game () {
            if (_init ()) {
                Utility.Log.message ("SDL initialised successfully!");

                delta_time = 0;

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

                _running = true;
            } else {
                Utility.Log.error (SDL.get_error ());
            }
        }

        ~Game () {
            if (InitFlags.SDL in _initialised) SDL.quit ();
            if (InitFlags.SDL_TTF in _initialised) SDLTTF.quit ();
            if (InitFlags.SDL_IMAGE in _initialised) SDLImage.quit ();
        }

        public int run () {
            start ();

            while (running ()) {
                delta_time = framerate.update ();
                renderer.clear ();

                event.update ();

                update ();

                draw ();

                renderer.present ();
            }

            return EXIT_SUCCESS;
        }

        // Default runtime methods
        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public bool running () {
            return _running;
        }

        public void quit () {
            _running = false;
        }

        private bool _init () {
            Utility.Log.init ();

            int sdl_init = SDL.init ();
            int sdl_ttf_init = SDLTTF.init ();
            int sdl_image_init = SDLImage.init (SDLImage.InitFlags.ALL);

            if (sdl_init == 0) _initialised += InitFlags.SDL;
            if (sdl_ttf_init == 0) _initialised += InitFlags.SDL_TTF;
            if (sdl_image_init == SDLImage.InitFlags.ALL) _initialised += InitFlags.SDL_IMAGE;

            return (sdl_init == 0 && sdl_ttf_init == 0 && sdl_image_init == SDLImage.InitFlags.ALL);
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
