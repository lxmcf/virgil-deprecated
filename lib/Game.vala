using SDL;

using Virgil.Graphics;
using Virgil.Input;
using Virgil.Core;

namespace Virgil {
    public class Game {
        public bool running;

        // TODO: Remove GameState object and migrate to be within main game class
        public unowned WindowManager window;
        public unowned RenderManager render;

        public unowned EventManager event;
        public unowned FramerateManager framerate;
        public unowned KeyboardManager keyboard;
        public unowned MouseManager mouse;

        public Game () {
            SDL.init ();

            window = GameState.get_window_state ();
            render = GameState.get_render_state ();

            event = GameState.get_event_state ();
            framerate = GameState.get_framerate_state ();
            keyboard = GameState.get_keyboard_state ();
            mouse = GameState.get_mouse_state ();

            window.initialise ();
            render.initialise (window);

            running = true;
            _link_events ();
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

            return EXIT_SUCCESS;
        }

        public virtual void start () { }
        public virtual void update () { }
        public virtual void draw () { }

        public void quit () {
            running = false;
        }

        private void _link_events () {
            event.close_event.connect (() => {
                quit ();
            });

            event.key_down_event.connect (key => {
                keyboard.update_key (key.keysym.sym, true);
            });

            event.key_up_event.connect (key => {
                keyboard.update_key (key.keysym.sym, false);
            });

            event.mouse_down_event.connect (sdl_mouse => {
                mouse.update_button (sdl_mouse.button, true);
            });

            event.mouse_up_event.connect (sdl_mouse => {
                mouse.update_button (sdl_mouse.button, false);
            });

            event.mouse_motion_event.connect (sdl_mouse => {
                mouse.update_position (sdl_mouse);
            });
        }
    }
}
