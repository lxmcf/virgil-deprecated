using SDL;

using Virgil.Input;

namespace Virgil.Engine {
    public class EventHandler {
        private Event _event;

        public signal void on_close ();

        public signal void on_key_update (KeyboardEvent key, bool is_down);

        public signal void on_mouse_update (MouseButton mouse, bool is_down);

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
                    case EventType.MOUSEBUTTONUP:
                        on_mouse_update (
                            (MouseButton)_event.button.button,
                            (_event.type == EventType.MOUSEBUTTONDOWN) ? true : false
                        );
                    break;
                }
            }
        }
    }
}
