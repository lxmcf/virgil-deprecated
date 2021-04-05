using Virgil;

namespace Virgil.Graphics {
    public class RenderQueue {
        public Queue<RenderQueueCall> _queue;

        //  private SDL.Video.Texture _texture;
        //  private BlendMode _blend;

        public RenderQueue () {
            _queue = new Queue<RenderQueueCall> ();
        }
    }
}
