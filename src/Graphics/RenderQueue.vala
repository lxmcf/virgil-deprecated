using Virgil;
using Virgil.Debug;

namespace Virgil.Graphics {
    public class RenderQueue {
        public Queue<RenderQueueCall> _queue;

        private TargetTexture2D _texture;

        // TODO: Impliment texture caching to allow text rendering (That isn't totally [ADVERTISER FRIENDLY WORDING])
        private Texture2D[] _texture_cache;

        private BlendMode _blend_mode;

        public RenderQueue (BlendMode blend_mode = BlendMode.NONE, RenderSortMode sort_mode = RenderSortMode.DEFERED) {
            _queue = new Queue<RenderQueueCall> ();

            _blend_mode = blend_mode;

            int width, height;

            GameState state = Game.get_state ();
            state.window.get_size (out width, out height);

            _texture = new TargetTexture2D (width, height);
            _texture.set_blend_mode (_blend_mode);
        }

        public int render_texture (Texture2D texture, int x, int y) {
            if (texture.texture_type == TextureType.TARGET) {
                print_error ("RenderQueue's do not support target textures in queue calls!");

                return EXIT_FAIL_UNSUPPORTED_TYPE;
            }

            _queue.push_tail (new RenderQueueCall (texture, x, y));

            return EXIT_SUCCESS;
        }

        public void render (bool clear = false) {
            GameState state = Game.get_state ();

            RenderQueueCall? queue_call = null;

            state.renderer.set_target (_texture);

            while ((queue_call = _queue.pop_head ()) != null) {
                state.renderer.render_texture_point (queue_call.texture, queue_call.point);
            }

            // Future proofing for when multithreading is implimented
            if (clear && (_queue.get_length () > 0)) {
                _queue.clear ();
            }

            state.renderer.reset_target ();
        }
    }
}
