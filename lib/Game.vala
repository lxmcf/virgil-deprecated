using SDL;
using SDL.Video;

using Virgil.Graphics;
using Virgil.Input;

namespace Virgil {
    public class Game {
        public bool running;

        public unowned WindowManager window;
        public unowned RenderManager render;

        public unowned EventManager event;
        public unowned FramerateManager framerate;
        public unowned KeyboardManager keyboard;
        public unowned MouseManager mouse;

        public Game () {
            SDL.init (SDL.InitFlag.EVERYTHING);

            window = GameState.get_window_state ();
            render = GameState.get_render_state ();

            event = GameState.get_event_state ();
            framerate = GameState.get_framerate_state ();
            keyboard = GameState.get_keyboard_state ();
            mouse = GameState.get_mouse_state ();

            link_events ();

            window.initialise ();
            render.initialise (window);

            running = true;
        }

        public int run () {
            start ();

            while (running) {
                framerate.update ();

                render.clear ();

                event.update ();

                update ();
                draw ();

                render.present ();
            }

            SDL.quit ();

            return 0;
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public void quit () {
            running = false;
        }

        private void link_events () {
            event.close_event.connect (() => {
                quit ();
            });

            event.key_down_event.connect ((e, key) => {
                keyboard.update_key (key.keysym.sym, true);
            });

            event.key_up_event.connect ((e, key) => {
                keyboard.update_key (key.keysym.sym, false);
            });

            event.mouse_down_event.connect ((e, sdl_mouse) => {
                mouse.update_button (sdl_mouse.button, true);
            });

            event.mouse_up_event.connect ((e, sdl_mouse) => {
                mouse.update_button (sdl_mouse.button, false);
            });
        }
    }
}
