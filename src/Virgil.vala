// NOTE: Keep linked with global initialisation and engine related methods

using Virgil.Debug;

namespace Virgil {
    private static bool? _is_initialised;

    private static InitFlag? _flags;
    private static List<InitFlag> _initialised_flags;

    public static int init (InitFlag? flags = null) {
        if (_is_initialised) {
            return 1;
        }

        _initialised_flags = new List<InitFlag> ();

        InitFlag[] _flag_array = {
            InitFlag.EVERYTHING, InitFlag.KEYBOARD,
            InitFlag.MOUSE, InitFlag.SDL,
            InitFlag.SDL_TTF
        };

        if (InitFlag.EVERYTHING in flags) {
            for (int i = 0; i < _flag_array.length; i++) {
                int _result = init_subsystem (_flag_array[i]);

                if (_result > 0) {
                    print_error (@"Failed to initialised module [$(_flag_array[i].to_string())]!");
                }
            }

            return 0;
        }

        _flags = flags;

        return 0;
    }

    public static int init_subsystem (InitFlag flag) {
        if (flag == InitFlag.EVERYTHING) {
            print_warning ("Can only initialise all systems at for init");

            return 1;
        }

        if (flag in _flags) {
            print_warning (@"Subsystem $(flag.to_string ()) already initialised!");

            return 1;
        }

        int _result;

        switch (flag) {
            case InitFlag.KEYBOARD:
                _result = Input.Keyboard.init ();
                break;

            case InitFlag.MOUSE:
                _result = Input.Mouse.init ();
                break;

            case InitFlag.SDL:
                _result = SDL.init (SDL.InitFlag.EVERYTHING);
                break;

            case InitFlag.SDL_TTF:
                _result = SDLTTF.init ();
                break;

            default:
                _result = 1;
                break;
        }

        if (_result == 0) {
            _initialised_flags.append (flag);
        }

        return _result;
    }

    public static int quit () {
        for (int i = 0; i < _initialised_flags.length (); i++) {

        }

        return 0;
    }
}
