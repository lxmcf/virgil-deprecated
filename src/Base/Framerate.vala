using SDL;

// TODO: Move to using GLib timer's, should allow for uncapped framerates with accurate delta time
namespace Virgil.Base {
    public class Framerate {
        private static Framerate? _instance = null;

        private uint32 _frame_count;
        private uint32 _base_ticks;
        private uint32 _last_ticks;
        private uint32 _rate;

        private float _rate_ticks;

        public uint32 frame_count {
            get { return _frame_count; }
        }

        public Framerate (int framerate = 60) {
            _frame_count = 0;
            _rate = framerate;
            _rate_ticks = (1000.0f / (float)framerate);
            _base_ticks = SDL.Timer.get_ticks ();
            _last_ticks = _base_ticks;

            _instance = this;
        }

        public float update () {
            uint32 current_ticks;
            uint32 target_ticks;
            uint32 the_delay;
            float time_passed;

            _frame_count++;

            current_ticks = SDL.Timer.get_ticks ();
            time_passed = current_ticks - _last_ticks;
            _last_ticks = current_ticks;
            target_ticks = _base_ticks + (uint32)((float)_frame_count * _rate_ticks);

            if (current_ticks <= target_ticks) {
                the_delay = target_ticks - current_ticks;

                SDL.Timer.delay (the_delay);
            } else {
                _frame_count = 0;
                _base_ticks = SDL.Timer.get_ticks ();
            }

            return time_passed;
        }

        public void set_framerate (int framerate) {
            _frame_count = 0;
            _rate = framerate;
            _rate_ticks = (1000.0f / (float)framerate);
        }
    }
}
