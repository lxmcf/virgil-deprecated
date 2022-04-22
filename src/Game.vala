using Virgil.Base;

namespace Virgil {
    public class Game {
        private bool _is_running;

        private Window? _window;
        private Renderer? _renderer;

        public Game () {
            SDL.init (SDL.InitFlag.VIDEO);

            _is_running = true;
        }

        public int run () {
            start ();

            while (_is_running) {
                update (0.0f);

                draw ();
            }

            SDL.quit ();

            return 0;
        }

        public virtual void start () { }
        public virtual void update (float elapsed) { }
        public virtual void draw () { }
    }
}
