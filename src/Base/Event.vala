using SDL;

namespace Virgil.Base {
    public class Event {
        private SDL.Event _event;

        public signal void on_close ();

        public void poll () {
            while (SDL.Event.poll (out _event) == 1) {
                switch (_event.type) {
                    case EventType.QUIT:
                        on_close ();
                        break;
                }
            }
        }
    }
}
