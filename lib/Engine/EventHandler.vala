using SDL;

namespace Virgil.Engine {
    public class EventHandler {
        private Event _event;

        public signal void on_close ();

        public signal void on_key_update (KeyboardEvent key, bool is_down);

        public signal void on_mouse_down (MouseButtonEvent mouse);
        public signal void on_mouse_up (MouseButtonEvent mouse);
        public signal void on_mouse_move (MouseMotionEvent mouse);

        public void update () {
            while (Event.poll (out _event) == 1) {
                switch (_event.type) {
                    case EventType.QUIT:
                        on_close ();
                    break;


                    case EventType.KEYDOWN:
                    case EventType.KEYUP:
                        on_key_update (_event.key, (_event.type == EventType.KEYDOWN) ? true : false);
                    break;

                    case EventType.MOUSEBUTTONDOWN:
                        on_mouse_down (_event.button);
                    break;

                    case EventType.MOUSEBUTTONUP:
                        on_mouse_up (_event.button);
                    break;

                    case EventType.MOUSEMOTION:
                        on_mouse_move (_event.motion);
                    break;
                }
            }
        }
    }
}
