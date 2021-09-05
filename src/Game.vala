using Virgil.Core;
using Virgil.Input;

namespace Virgil {
    public class Game {
        private bool _running;

        private Window _window;
        private Renderer _renderer;

        private EventHandler _event;
        private FramerateHandler _framerate;

        public Game () {
            Virgil.init ();

            _window = new Window ();
            _renderer = new Renderer (_window);

            _event = new EventHandler ();
            _framerate = new FramerateHandler ();

            _running = true;

            _link_events ();
        }

        ~Game () {
            Virgil.quit ();
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
    }
}
