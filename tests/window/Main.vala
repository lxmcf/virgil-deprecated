using Virgil;

public static int main (string[] args) {
    Game game = new Game ();

    game.on_start.connect (() => {
        Debug.print_message ("START!");
    });

    return game.run ();
}
