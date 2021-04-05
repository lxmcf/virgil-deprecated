namespace Virgil.Debug {
    private static PrintLevel? _level;

    private void _init () {
        if (_level == null) {
            _level = PrintLevel.MESSAGE;
        }
    }

    private static void _print (string text, string head) {
        GLib.print (@"[$head]:\t$text\n");
    }

    public static void set_print_level (PrintLevel level) {
        _init ();

        _level = level;
    }

    public PrintLevel? get_print_level () {
        return _level;
    }

    public static int print_message (string text) {
        _init ();

        if (_level <= PrintLevel.MESSAGE) {
            _print (text, "\033[1mMESSAGE\033[0m");

            return 0;
        }

        return 1;
    }

    public static int print_warning (string text) {
        _init ();

        if (_level <= PrintLevel.WARNING) {
            _print (text, "\033[93;1mWARNING\033[0m");

            return 0;
        }

        return 1;
    }

    public static int print_error (string text) {
        _init ();

        if (_level <= PrintLevel.ERROR) {
            _print (text, "\033[91;1mERROR\033[0m");

            return 0;
        }

        return 1;
    }
}
