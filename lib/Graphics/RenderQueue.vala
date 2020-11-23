using Virgil;

using SDL.Video;

namespace Virgil.Graphics {
    public class RenderQueue {
        public RenderQueueMode sort_mode;

        private List<RenderQueueItem> _item_list;
        private bool _has_reversed;

        private unowned Renderer _renderer;

        public RenderQueue () {
            _item_list = new List<RenderQueueItem> ();
            sort_mode = RenderQueueMode.DEFAULT;

            _has_reversed = false;

            _renderer = Game.renderer.to_sdl ();
        }

        public void begin (RenderQueueMode mode = RenderQueueMode.DEFAULT, bool free_list = true) {
            sort_mode = mode;

            if (free_list) {
                _item_list.foreach ((item) => {
                    _item_list.remove (item);
                });
            }
        }

        public void draw (Texture2D texture, Vector2 position) {
            RenderQueueItem item = new RenderQueueItem (texture, (int)position.x, (int)position.y, 1.0, 1.0, 0.0);
            _filter_item (item);
        }

        public void draw_scale (Texture2D texture, Vector2 position, double scale_x, double scale_y) {
            RenderQueueItem item = new RenderQueueItem (
                texture,
                (int)position.x,
                (int)position.y,
                scale_x, scale_y,
                0.0
            );

            _filter_item (item);
        }

        /*
        FIXME: This doesn't work, dont know why

        Fails at line 61 due to segmentation fault despite sdl_font not returning null
        */
        public void draw_string (Font font, string text, Vector2 position) {
            unowned SDLTTF.Font sdl_font = font.get_sdl_font ();

            Colour colour = new Colour (255, 255, 255);

            Surface surf = sdl_font.render (text, colour.get_sdl_colour ());

            Texture texture = Texture.create_from_surface (_renderer, surf);

            int width, height;

            texture.query (null, null, out width, out height);

            Utility.Log.print (width.to_string () + " \\ " + height.to_string (), "DEBUG");

            Rectangle source = new Rectangle (0, 0, width, height);
            Rectangle destination = new Rectangle (16, 16, width, height);

            _renderer.copy (texture, source.get_sdl_rect (), destination.get_sdl_rect ());
        }

        public void end () {
            if (sort_mode == RenderQueueMode.IMMEDIATE) {
                _has_reversed = false;
                return;
            }

            if (sort_mode == RenderQueueMode.REVERSED && !_has_reversed) {
                _item_list.reverse ();

                _has_reversed = true;
            }

            foreach (RenderQueueItem item in _item_list) {
                _render_item (item);
            }
        }

        private void _render_item (RenderQueueItem item) {
            _renderer.copy (item.output_texture, item.texture_rectangle, item.output_rectangle);
        }

        private void _filter_item (RenderQueueItem item) {
            if (sort_mode != RenderQueueMode.IMMEDIATE) {
                _item_list.append (item);
            } else {
                _render_item (item);
            }
        }
    }
}
