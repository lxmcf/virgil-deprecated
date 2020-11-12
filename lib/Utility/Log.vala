namespace Virgil.Utility {
    public class Log {
        private LogLevel _level;

        public Log (LogLevel level = LogLevel.MESSAGE) {
            _level = level;
        }

        public void set_level (LogLevel level) {
            _level = level;
        }

        public void print (string text, string head = "*") {
            GLib.print (@"[$head]:\t$text");
        }

        public int message (string text) {
            if (_level <= LogLevel.MESSAGE) {
                GLib.print (@"[MESSAGE]:\t$text \n");

                return 0;
            }

            return 1;
        }

        public int warning (string text) {
            if (_level <= LogLevel.WARNING) {
                GLib.print (@"[WARNING]:\t$text \n");

                return 0;
            }

            return 1;
        }

        public int error (string text) {
            if (_level <= LogLevel.ERROR) {
                GLib.print (@"[ERROR]:\t$text \n");

                return 0;
            }

            return 1;
        }
    }
}
