// TODO: Split into gamecomponent class

using Virgil.Graphics;
using Virgil.Debug;

namespace Virgil.Scenes {
    public class Scene {
        public Game game;

        private bool _paused;
        private bool _enabled;

        public bool paused {
            set { _paused = value; }
            get { return _paused; }
        }

        public bool enabled {
            set {
                _enabled = value;

                if (_enabled) {
                    initialise ();
                }
            }

            get {
                return _enabled;
            }
        }

        public Scene (Game game) {
            this.game = game;
        }

        ~Scene () {
            unload_content ();
        }

        // NOTE: Potentially look at removing, may be redundent?
        public virtual void load_content () {
            on_load_content ();
        }

        public virtual void unload_content () {
            on_unload_content ();
        }

        public virtual void initialise () {
            on_initialise ();
        }

        public virtual void update () {
            on_update ();
        }

        public virtual void draw () {
            on_draw ();
        }

        // Signals
        public signal void on_load_content ();
        public signal void on_unload_content ();

        public signal void on_initialise ();
        public signal void on_update ();
        public signal void on_draw ();
    }
}
