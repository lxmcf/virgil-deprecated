using Virgil.Graphics;

namespace Virgil.Scene {
    public class Scene {
        private RenderQueue _render;
        private string _name;

        public RenderQueue render {
            get { return _render; }
        }

        public string name {
            get { return _name; }
        }

        public Scene (string name) {
            _render = new RenderQueue ();
            _name = name;
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }
    }
}
