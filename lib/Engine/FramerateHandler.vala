namespace Virgil.Engine {
    public class FramerateHandler {
        public uint32 frame_count;
        public uint32 base_ticks;
		public uint32 last_ticks;
		public uint32 rate;

        public float rate_ticks;

        public FramerateHandler (int framerate = 60) {
            frame_count = 0;
            rate = framerate;
            rate_ticks = (1000.0f / (float)framerate);
            base_ticks = _get_ticks ();
            last_ticks = base_ticks;
        }

        public double update () {
            uint32 current_ticks;
            uint32 target_ticks;
            uint32 the_delay;
            double time_passed;

            frame_count++;

            current_ticks = _get_ticks ();
            time_passed = current_ticks - last_ticks;
            last_ticks = current_ticks;
            target_ticks = base_ticks + (uint32)((float)frame_count * rate_ticks);

            if (current_ticks <= target_ticks) {
                the_delay = target_ticks - current_ticks;
                SDL.Timer.delay (the_delay);
            } else {
                frame_count = 0;
                base_ticks = _get_ticks ();
            }

            return time_passed;
        }

        public void set_framerate (int framerate) {
            frame_count = 0;
            rate = framerate;
            rate_ticks = (1000.0f / (float)framerate);
        }

        private uint32 _get_ticks () {
            uint32 ticks = SDL.Timer.get_ticks ();

            if (ticks == 0) {
                return 1;
            } else {
                return ticks;
            }
        }
    }
}
