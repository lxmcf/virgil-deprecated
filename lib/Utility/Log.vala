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
            GLib.print (@"[$head]:\t$text\n");
        }

        public int message (string text) {
            if (_level <= LogLevel.MESSAGE) {
                print (text, "MESSAGE");

                return 0;
            }

            return 1;
        }

        public int warning (string text) {
            if (_level <= LogLevel.WARNING) {
                print (text, "WARNING");

                return 0;
            }

            return 1;
        }

        public int error (string text) {
            if (_level <= LogLevel.ERROR) {
                print (text, "ERROR");

                return 0;
            }

            return 1;
        }
    }
}
