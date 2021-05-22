using Virgil.Graphics;
using Virgil.Debug;

namespace Virgil.Scene {
    public class Scene {
        private RenderQueue _render_queue;
        private string _name;
        private bool _activated;

        public RenderQueue render_queue {
            get { return _render_queue; }
        }

        public string name {
            get { return _name; }
        }

        public Scene (string name) {
            _render_queue = new RenderQueue ();
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

        public virtual void start () {
            on_start ();
        }

        public virtual void update () {
            on_update ();
        }

        public virtual void draw () {
            on_draw (_render_queue);

            _render_queue.render ();
        }

        public virtual void load () { }
        public virtual void unload () { }

        public signal void on_start ();
        public signal void on_update ();
        public signal void on_draw (RenderQueue render_queue);
        public signal void on_load ();
        public signal void on_unload ();
    }
}
