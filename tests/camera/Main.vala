using Virgil;
using Virgil.Input;
using Virgil.Core;
using Virgil.Graphics;

//  Player player;

public static int main (string[] args) {
    Game game = new Game ();

    Player player = new Player (0f, 0f, 200f);
    StaticTexture2D texture = new StaticTexture2D.from_file ("res/images/default.png");
    RenderQueue queue = new RenderQueue ();

    game.on_start.connect (() => {
        unowned FramerateHandler frame = FramerateHandler.instance;
        frame.set_framerate (165);
    });

    game.on_update.connect (() => {
        unowned FramerateHandler frame = FramerateHandler.instance;
        player.update (frame.delta_time);
    });

    game.on_draw.connect (() => {
        queue.render_texture (texture, (int)player.x, (int)player.y);
        queue.render_texture (texture, 128, 128);
        queue.render ();

        int width = Window.instance.width / 2;
        int height = Window.instance.height / 2;

        Renderer.instance.set_viewport ((int)player.x + width, (int)player.y + height);
    });

    return game.run ();
}

public class Player {
    public float x;
    public float y;
    public float speed;

    public Player (float x, float y, float speed) {
        this.x = x;
        this.y = y;
        this.speed = speed;
    }

    public void update (float delta) {
        int xaxis = Keyboard.check_key_raw ("D") - Keyboard.check_key_raw ("A");
        int yaxis = Keyboard.check_key_raw ("S") - Keyboard.check_key_raw ("W");

        x += ((float)xaxis * speed) * (delta / 1000.0f);
        y += ((float)yaxis * speed) * (delta / 1000.0f);
    }
}
