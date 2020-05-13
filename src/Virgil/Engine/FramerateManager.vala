using SDL;

namespace Virgil {
    public class FramerateManager {
        // TODO:
        public uint32 frame_count { get; private set; }

        // TODO: Rename to more accurate variables after initial SDL port
        public float rate_ticks;
        public uint32 base_ticks;
        public uint32 last_ticks;

        public uint32 target_framerate;

        public uint32 delta_time;

        public FramerateManager (uint32 framerate = 60) {
            frame_count = 0;
            target_framerate = framerate;

            rate_ticks = 1000.0f / (float)target_framerate;
            base_ticks = get_ticks ();
            last_ticks = get_ticks ();
        }

        private uint32 get_ticks () {
            uint32 ticks = SDL.Timer.get_ticks ();

            if (ticks == 0) {
                return 1;
            } else {
                return ticks;
            }
        }

        // TODO: Document this returns as ms, maybe look to convert to float
        public uint32 run () {
            uint32 current_ticks = get_ticks ();
            uint32 target_ticks;

            frame_count++;

            delta_time = current_ticks - last_ticks;
            last_ticks = current_ticks;

            target_ticks = base_ticks + (uint32)((float)frame_count * rate_ticks);

            if (current_ticks <= target_ticks) {
                SDL.Timer.delay (target_ticks - current_ticks);
            } else {
                frame_count = 0;
                base_ticks = get_ticks();
            }

            return delta_time;
        }

        public int set_target_framerate (int framerate) {
            if (framerate > 0) {
                frame_count = 0;
                target_framerate = framerate;

                rate_ticks = (1000.0f / (float)target_framerate);

                return 0;
            } else {
                return 1;
            }
        }

        public int get_target_framerate () {
            return (int)target_framerate;
        }

        public int get_framecount () {
            return (int)frame_count;
        }

        public int get_delta_time () {
            return (int)delta_time;
        }
    }
}
