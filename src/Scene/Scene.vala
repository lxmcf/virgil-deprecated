using Virgil.Graphics;
using Virgil.Debug;

namespace Virgil.Scene {
    public class Scene {
        private string _name;
        private bool _activated;

        public string name {
            get { return _name; }
        }

        public Scene (string name) {
            _name = name;

            _activated = false;
        }

        public int activate () {
            if (!_activated) {
                _activated = true;

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
