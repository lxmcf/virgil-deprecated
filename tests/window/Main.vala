using Virgil;

public static int main (string[] args) {
    Game game = new Game ();

    game.on_start.connect (() => {
        print ("START!\n");
    });

    return game.run ();
}
