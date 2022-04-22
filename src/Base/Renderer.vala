using SDL;

namespace Virgil.Base {
    public class Renderer {
        internal Video.Renderer _renderer;
        internal unowned Video.Window _window;

        private static Renderer? _instance;

        public class Renderer (Window window) {
            uint32 flags = Video.RendererFlags.ACCELERATED | Video.RendererFlags.TARGETTEXTURE;

            _window = window._window;
            _renderer = Video.Renderer.create (_window, -1, flags);

            _instance = this;
        }

        // Not sure if this is nice? Been away from OOP too late
        public static Renderer? get_instance () {
            return _instance;
        }
    }
}
