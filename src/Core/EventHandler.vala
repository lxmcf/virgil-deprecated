using SDL;

using Virgil.Input;

namespace Virgil.Core {
    public class EventHandler {
        private Event _event;

        public signal void on_close ();

        public signal void on_key_update (string key, bool is_down);

        public signal void on_mouse_update (MouseButton mouse, bool is_down);
        public signal void on_mouse_motion (int x, int y, int relative_x, int relative_y);

        public void update () {
            while (Event.poll (out _event) == 1) {
                switch (_event.type) {
                    case EventType.QUIT:
                        on_close ();
                        break;

                    case EventType.KEYDOWN:
                    case EventType.KEYUP:
                        string key = _event.key.keysym.sym.get_name ();

                        on_key_update (key, (_event.type == EventType.KEYDOWN) ? true : false);
                        break;

                    case EventType.MOUSEBUTTONDOWN:
                    case EventType.MOUSEBUTTONUP:
                        bool is_down = (_event.type == EventType.MOUSEBUTTONDOWN) ? true : false;

                        on_mouse_update ((MouseButton)_event.button.button, is_down);
                        break;

                    case EventType.MOUSEMOTION:
                        MouseMotionEvent motion = _event.motion;

                        on_mouse_motion (motion.x, motion.y, motion.xrel, motion.yrel);
                        break;

                    // TODO: Work on controller input
                    case EventType.CONTROLLERBUTTONDOWN:
                    case EventType.CONTROLLERBUTTONUP:

                        break;

                    case EventType.CONTROLLERDEVICEADDED:
                    case EventType.CONTROLLERDEVICEREMOVED:

                        break;
                }
            }
        }
    }
}
