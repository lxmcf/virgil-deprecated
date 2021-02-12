//TODO: Rename Log to something that doesn't conflict with GLib

namespace Virgil.Utility {
    public class Log {
        private static LogLevel? _level;

        public static int init (LogLevel level = LogLevel.MESSAGE) {
            if (_level != null) return 1;

            _level = level;

            return 0;
        }

        public static void set_level (LogLevel level) {
            _level = level;
        }

        public LogLevel? get_level () {
            return _level;
        }

        public static void print (string text, string head = "*") {
            GLib.print (@"[$head]:\t$text\n");
        }

        public static int message (string text) {
            if (_level <= LogLevel.MESSAGE) {
                print (text, "MESSAGE");

                return 0;
            }

            return 1;
        }

        public static int warning (string text) {
            if (_level <= LogLevel.WARNING) {
                print (text, "WARNING");

                return 0;
            }

            return 1;
        }

        public static int error (string text) {
            if (_level <= LogLevel.ERROR) {
                print (text, "ERROR");

                return 0;
            }

            return 1;
        }
    }
}
