using SDL.Video;

using Virgil;

namespace Virgil.Graphics {
    public class RenderQueue {
        public Queue<RenderQueueCall> _queue;

        private Texture _texture;
        private BlendMode _blend;

        public RenderQueue (BlendMode blend_mode = BlendMode.NONE, RenderSortMode sort_mode = RenderSortMode.DEFERED) {
            _queue = new Queue<RenderQueueCall> ();

            int width, height;

            GameState state = Game.get_state ();
            state.window.get_size (out width, out height);

            _texture = SDL.Video.Texture.create (
                state.renderer.sdl_renderer, PixelRAWFormat.ABGR8888, TextureAccess.TARGET, width, height
            );
        }

        public void render_texture (Texture2D texture, int x, int y) {
            _queue.push_tail (new RenderQueueCall (texture, x, y));
        }

        public void render_queue () {
            GameState state = Game.get_state ();

            RenderQueueCall? queue_call = null;
            while ((queue_call = _queue.pop_head ()) != null) {
                state.renderer.render_texture_point (queue_call.texture, queue_call.point);
            }
        }
    }
}
