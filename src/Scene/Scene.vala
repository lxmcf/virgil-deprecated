using Virgil.Graphics;

namespace Virgil.Scene {
    public class Scene {
        private RenderQueue _render_queue;
        private string _name;

        public RenderQueue render_queue {
            get { return _render_queue; }
        }

        public string name {
            get { return _name; }
        }

        public Scene (string name) {
            _render_queue = new RenderQueue ();
            _name = name;
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () {
            _render_queue.render ();
        }
    }
}
