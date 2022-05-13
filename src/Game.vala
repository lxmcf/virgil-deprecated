using Virgil.Base;

namespace Virgil {
    public class Game {
        private static Game? _instance;
        private bool _is_running;

        private Window? _window;
        private Renderer? _renderer;

        private Framerate? _framerate;
        private Event? _event;

        public Game (string[] args) {
            SDL.init (SDL.InitFlag.VIDEO);

            _instance = this;
            _is_running = true;

            _window = new Window ("Hello World!", 1280, 720);
            _renderer = new Renderer (_window);

            _framerate = new Framerate (60);
            _event = new Event ();

            _link_events ();
        }

        public static Game? get_instance () {
            return _instance;
        }

        public int run () {
            start ();

            while (_is_running) {
                float delta = _framerate.update ();
                update (delta);

                _event.poll ();

                draw ();
            }

            SDL.quit ();

            return 0;
        }

        public virtual void start () { }
        public virtual void update (float elapsed) { }
        public virtual void draw () { }

        public Window? get_window () {
            return _window;
        }

        public Renderer? get_renderer () {
            return _renderer;
        }

        private void _link_events () {
            _event.on_close.connect (() => {
                _is_running = false;
            });
        }
    }
}
