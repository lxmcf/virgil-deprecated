using SDL;

namespace Virgil {
    public class EventManager {
        private Event event;

        public EventManager () { }

        public signal void close_event ();

        public signal void key_down_event (SDL.KeyboardEvent key);

        public signal void key_up_event (SDL.KeyboardEvent key);

        public void run () {
            while (Event.poll (out event) == 1) {
                switch (event.type) {
                    case EventType.QUIT:
                        close_event ();
                    break;

                    case EventType.KEYDOWN:
                        key_down_event (event.key);
                    break;

                    case EventType.KEYUP:
                    key_up_event (event.key);
                    break;
                }
            }
        }
    }
}
