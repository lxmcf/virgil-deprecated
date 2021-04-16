// TODO: Refactor, a lot of data is reused and/or redundant
namespace Virgil.Core {
    public class FramerateHandler {
        public uint32 _frame_count;
        public uint32 _base_ticks;
        public uint32 _last_ticks;
        public uint32 _rate;

        private float _rate_ticks;
        private float _delta_time;

        public uint32 frame_count {
            get { return _frame_count; }
        }

        public float delta_time {
            get { return _delta_time; }
        }

        public FramerateHandler (int framerate = 60) {
            _frame_count = 0;
            _rate = framerate;
            _rate_ticks = (1000.0f / (float)framerate);
            _base_ticks = _get_ticks ();
            _last_ticks = _base_ticks;
        }

        public void update () {
            uint32 current_ticks;
            uint32 target_ticks;
            uint32 the_delay;
            float time_passed;

            _frame_count++;

            current_ticks = _get_ticks ();
            time_passed = current_ticks - _last_ticks;
            _last_ticks = current_ticks;
            target_ticks = _base_ticks + (uint32)((float)_frame_count * _rate_ticks);

            if (current_ticks <= target_ticks) {
                the_delay = target_ticks - current_ticks;

                SDL.Timer.delay (the_delay);
            } else {
                _frame_count = 0;
                _base_ticks = _get_ticks ();
            }

            _delta_time = time_passed;
        }

        public void set_framerate (int? framerate) {
            _frame_count = 0;
            _rate = framerate;
            _rate_ticks = (1000.0f / (float)framerate);
        }

        private uint32 _get_ticks () {
            uint32 ticks = SDL.Timer.get_ticks ();

            return ticks;
        }
    }
}
