using Virgil;
using Virgil.Debug;

namespace Virgil.Graphics {
    public class RenderQueue {
        public Queue<RenderQueueCall> _queue;

        private Surface _surface;

        // TODO: Impliment texture caching to allow text rendering (That isn't totally [ADVERTISER FRIENDLY WORDING])
        //  private Texture2D[] _texture_cache;

        private BlendMode _blend_mode;

        public RenderQueue (BlendMode blend_mode = BlendMode.NONE, RenderSortMode sort_mode = RenderSortMode.DEFERED) {
            _queue = new Queue<RenderQueueCall> ();

            _blend_mode = blend_mode;

            int width, height;

            GameState state = Game.get_state ();
            state.window.get_size (out width, out height);

            _surface = new Surface (width, height);
            _surface.set_blend_mode (_blend_mode);
        }

        public int render_texture (Texture2D texture, int x, int y) {
            if (texture.texture_type == TextureType.TARGET) {
                print_error ("RenderQueue's do not support target textures in queue calls!");

                return EXIT_FAIL_UNSUPPORTED_TYPE;
            }

            _queue.push_tail (new RenderQueueCall (texture, x, y, 0, false, 90.0));

            return EXIT_SUCCESS;
        }

        public void render (bool clear = false) {
            GameState state = Game.get_state ();

            RenderQueueCall? queue_call = null;

            state.renderer.set_target (_surface);
            state.renderer.clear_colour_rgb (0xFF, 0xFF, 0xFF);

            while ((queue_call = _queue.pop_head ()) != null) {
                state.renderer.render_texture_point (queue_call.texture, queue_call.point);
            }

            // Future proofing for when multithreading is implimented
            // Will prevent memory leaks if we add new queue calls from another thread
            // mid way through final render phase
            if (clear && (_queue.get_length () > 0)) {
                _queue.clear ();
            }

            state.renderer.reset_target ();

            state.renderer.render_texture (_surface, 0, 0);
        }
    }
}
