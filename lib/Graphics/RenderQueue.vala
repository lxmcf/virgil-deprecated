using Virgil;

using SDL.Video;

namespace Virgil.Graphics {
    public class RenderQueue {
        public RenderQueueMode sort_mode;

        private List<RenderQueueItem> _item_list;
        private bool _has_reversed;

        private unowned Renderer renderer;

        public RenderQueue () {
            _item_list = new List<RenderQueueItem> ();
            sort_mode = RenderQueueMode.DEFAULT;

            _has_reversed = false;

            renderer = Game.renderer.to_sdl ();
        }

        public void begin (RenderQueueMode mode = RenderQueueMode.DEFAULT, bool free_list = true) {
            sort_mode = mode;

            if (free_list) {
                _item_list.foreach ((item) => {
                    _item_list.remove(item);
                });
            }
        }


        public void draw (Sprite sprite, Vector2 position) {
            RenderQueueItem item = new RenderQueueItem.from_sprite (sprite, (int)position.x, (int)position.y, 1.0, 1.0, 0.0);
            _filter_item (item);
        }

        public void draw_scale (Sprite sprite, Vector2 position, double scale_x, double scale_y) {
            RenderQueueItem item = new RenderQueueItem.from_sprite (
                sprite,
                (int)position.x,
                (int)position.y,
                scale_x, scale_y,
                0.0
            );

            _filter_item (item);
        }

        // public void draw_string (Font font, string text, int x, int y, Colour colour) {
        //     RenderQueueItem item = new RenderQueueItem.from_string (
        //         font, text, x, y, colour
        //     );
        // }

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
            //renderer.copyex (item.texture, item.sprite_rectangle, item.output_rectangle, 0.0, null, RendererFlip.NONE);
            renderer.copy (item.texture, item.sprite_rectangle, item.output_rectangle);
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
