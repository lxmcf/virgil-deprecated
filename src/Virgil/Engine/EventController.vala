using SDL;

namespace Virgil {
    public class EventController {
        private Event event;

        public EventController () { }

        public signal void close_event ();

        public signal void keyboard_event ();

        public void run () {
            while (Event.poll (out event) == 1) {
                switch (event.type) {
                    case EventType.QUIT:
                        close_event ();
                    break;

                    case EventType.KEYDOWN:
                    break;

                    case EventType.KEYUP:
                    break;
                }
            }
        }
    }
}
