using Virgil.Debug;

namespace Virgil.Filesystem {
    private static bool _is_initialised;
    private static string _global_directory;

    public static void init () {
        _is_initialised = true;
        _global_directory = "";
    }

    public static int set_global_directory (string directory) {
        if (!_is_initialised) {
            print_error ("Virgil filesystem is not initialised!");

            return EXIT_FAIL;
        }

        _global_directory = directory;

        return EXIT_SUCCESS;
    }

    public static string get_global_directory () {
        if (!_is_initialised) {
            print_error ("Virgil filesystem is not initialised!");

            return "";
        }

        return _global_directory;
    }
}
