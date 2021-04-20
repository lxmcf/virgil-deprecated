namespace Virgil.Debug {
    private static PrintLevel? _level;

    private static void _print (string text, string head) {
        GLib.print (@"[$head]:\t$text\n");
    }

    public static void set_print_level (PrintLevel level) {
        _level = level;
    }

    public PrintLevel? get_print_level () {
        return _level;
    }

    public static int print_message (string text) {
        if (_level <= PrintLevel.MESSAGE) {
            _print (text, "\033[39;1mMESSAGE\033[0m");

            return Virgil.EXIT_SUCCESS;
        }

        return EXIT_FAIL;
    }

    public static int print_debug (string text) {
        if (_level <= PrintLevel.MESSAGE) {
            _print (text, "\033[90;1mDEBUG\033[0m");

            return Virgil.EXIT_SUCCESS;
        }

        return EXIT_FAIL;
    }

    public static int print_warning (string text) {
        if (_level <= PrintLevel.WARNING) {
            _print (text, "\033[93;1mWARNING\033[0m");

            return EXIT_SUCCESS;
        }

        return EXIT_FAIL;
    }

    public static int print_error (string text) {
        if (_level <= PrintLevel.ERROR) {
            _print (text, "\033[91;1mERROR\033[0m");

            return EXIT_SUCCESS;
        }

        return EXIT_FAIL;
    }
}
