namespace Virgil.Debug {
    public delegate void AnonymousBlock ();

    public static void block_timer (string id, AnonymousBlock block) {
        GLib.Timer* timer = new GLib.Timer ();

        block ();

        timer->stop ();

        int elapsed = (int)(1000.0 * timer->elapsed ());
        print_debug (@"Function [\033[1m$(id.up ())\033[0m] took a total of $(elapsed.to_string ()) milliseconds!");

        delete timer;
    }

    public static void block_timer_seconds (string id, AnonymousBlock block) {
        GLib.Timer* timer = new GLib.Timer ();

        block ();

        timer->stop ();

        // Use float to avoid excessively long times for the seconds
        float elapsed = (float)timer->elapsed ();
        print_debug (@"Function [\033[1m$(id.up ())\033[0m] took a total of $(elapsed.to_string ()) seconds!");

        delete timer;
    }

    public static void block_timer_microseconds (string id, AnonymousBlock block) {
        GLib.Timer* timer = new GLib.Timer ();

        block ();

        timer->stop ();

        ulong elapsed;

        timer->elapsed (out elapsed);
        print_debug (@"Function [\033[1m$(id.up ())\033[0m] took a total of $(elapsed.to_string ()) microseconds!");

        delete timer;
    }
}
