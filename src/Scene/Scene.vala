using Virgil.Graphics;
using Virgil.Debug;

namespace Virgil.Scene {
    public class Scene {
        private string _name;
        private bool _activated;
        private bool _persistent;

        public string name {
            get { return _name; }
        }

        public bool is_active {
            get { return _activated; }
        }

        public bool is_persistent {
            get { return _persistent; }
        }

        public Scene (string name) {
            _name = name;

            _activated = false;
        }

        public int activate () {
            if (!_activated) {
                _activated = true;

                start ();

                return EXIT_SUCCESS;
            }

            print_warning (@"Scene with name $(name) already activated!");

            return EXIT_FAIL;
        }

        public int deactivate () {
            if (_activated) {
                _activated = false;
            }

            return 1;
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }
        public virtual void unload () { }
    }
}
