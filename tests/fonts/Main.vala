using Virgil;
using Virgil.Graphics;

Font font;

public static int main (string[] args) {
    Game game = new Game ();

    font = new Font ("res/fonts/coders_crux.ttf", 96);
    RenderQueue queue = new RenderQueue ();

    game.on_draw.connect (() => {
        queue.render_text (font, 0, 0, "Hello World!", new Colour (255, 255, 255));

        queue.render ();
    });

    return game.run ();
}
