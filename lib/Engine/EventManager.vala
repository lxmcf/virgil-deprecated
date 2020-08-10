using SDL;

namespace Virgil {
    public class EventManager {
        private Event _event;

        public EventManager () { }

        public signal void close_event ();

        public signal void key_down_event (KeyboardEvent key);
        public signal void key_up_event (KeyboardEvent key);

        public signal void mouse_down_event (MouseButtonEvent mouse);
        public signal void mouse_up_event (MouseButtonEvent mouse);
        public signal void mouse_motion_event (MouseMotionEvent mouse);

        public void update () {
            while (Event.poll (out _event) == 1) {
                switch (_event.type) {
                    case EventType.QUIT:
                        close_event ();
                    break;

                    case EventType.KEYDOWN:
                        key_down_event (_event.key);
                    break;

                    case EventType.KEYUP:
                        key_up_event (_event.key);
                    break;

                    case EventType.MOUSEBUTTONDOWN:
                        mouse_down_event (_event.button);
                    break;

                    case EventType.MOUSEBUTTONUP:
                        mouse_up_event (_event.button);
                    break;

                    case EventType.MOUSEMOTION:
                        mouse_motion_event (_event.motion);
                    break;
                }
            }
        }
    }
}
