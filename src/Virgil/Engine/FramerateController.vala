using SDL;

namespace Virgil { 
    public class FramerateManager {
        public uint32? frame_cap;
        public uint32 frame_count { get; private set; }

        // public float 

        public uint32 delta_time;

        public FramerateManager () {

        }

        private uint32 get_ticks () {
            uint32 ticks = SDL.Timer.get_ticks ();

            if (ticks == 0) {
                return 1;
            } else {
                return ticks;
            }
        }

        public void run () {

        }

        public void set_framerate (int framerate) {

        }

        public int get_framerate () {
            return 0;
        }
    }
}
