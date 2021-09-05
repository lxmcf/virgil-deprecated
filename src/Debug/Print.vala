namespace Virgil.Debug {
    private static void _print (string message, string head) {
        GLib.print ("---- [%s]:\n\tMessage: %s\n", head, message);
    }

    public static void print_message (string text) {
        _print (text, "\033[39;1mMESSAGE\033[0m");
    }

    public static void print_debug (string text) {
        _print (text, "\033[90;1mDEBUG\033[0m");
    }

    public static void print_warning (string text) {
        _print (text, "\033[93;1mWARNING\033[0m");
    }

    public static void print_error (string text) {
        _print (text, "\033[91;1mERROR\033[0m");
    }
}
