using Virgil;
using Virgil.Graphics.Cache;

using Virgil.Core;

namespace Virgil.Graphics {
    public class RenderQueue {
        public Queue<RenderQueueCall> _queue;

        private Surface _surface;

        private List<FontTexture> _texture_cache;

        private BlendMode _blend_mode;
        private RenderSortMode _sort_mode;
        private Renderer _renderer;

        public RenderQueue (BlendMode blend_mode = BlendMode.NONE, RenderSortMode sort_mode = RenderSortMode.ORDERED) {
            _queue = new Queue<RenderQueueCall> ();
            _texture_cache = new List<FontTexture> ();

            _blend_mode = blend_mode;
            _sort_mode = sort_mode;

            int width, height;

            Window.instance.get_size (out width, out height);
            _renderer = Renderer.instance;

            _surface = new Surface (width, height);
            _surface.set_blend_mode (_blend_mode);
        }

        ~RenderQueue () {
        }

        public int render_texture (Texture2D texture, int x, int y) {
            if (texture.texture_type == TextureType.TARGET) {
                print ("RenderQueue's do not support target textures in queue calls!\n");

                return EXIT_FAIL;
            }

            _queue.push_tail (new RenderQueueCall (texture, x, y));

            return EXIT_SUCCESS;
        }

        public int render_text (Font font, int x, int y, string text, Colour colour) {
            string red, green, blue, alpha;

            red = colour.red.to_string ();
            green = colour.green.to_string ();
            blue = colour.blue.to_string ();
            alpha = colour.alpha.to_string ();

            string id = font.font_id + "|" + red + green + blue + alpha + "|" + text;
            FontTexture? cache_item = _cached_text_exists (id);

            if (cache_item == null) {
                Texture2D texture = font.render (text, colour);

                cache_item = new FontTexture (texture, id);

                _texture_cache.append (cache_item);
            }

            _queue.push_tail (new RenderQueueCall (cache_item.texture, x, y));
            cache_item.rendered = true;

            return EXIT_SUCCESS;
        }

        public void render () {
            if (_sort_mode == RenderSortMode.IMMEDIATE) {
                return;
            }

            if (_sort_mode == RenderSortMode.REVERSED) {
                _queue.reverse ();
            }

            RenderQueueCall queue_call;

            _renderer.set_target (_surface);
            _renderer.clear ();

            while ((queue_call = _queue.pop_head ()) != null) {
                _renderer.render_texture_point (queue_call.texture, queue_call.point);
            }

            foreach (FontTexture item in _texture_cache) {
                if (!item.rendered) {
                    _texture_cache.remove (item);
                } else {
                    item.rendered = false;
                }
            }

            _renderer.reset_target ();

            //  Future proofing for when multithreading is implimented
            //  Will prevent memory leaks if we add new queue calls from another thread
            //  mid way through final render phase
            if (_queue.get_length () > 0) {
                _queue.clear ();
            }

            _renderer.render_texture (_surface, 0, 0);
        }

        private FontTexture? _cached_text_exists (string text) {
            foreach (FontTexture item in _texture_cache) {
                if (item.identifier == text) {
                    return item;
                }
            }

            return null;
        }
    }
}
