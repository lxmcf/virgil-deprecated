using Virgil;

using SDL.Video;

namespace Virgil.Graphics {
    public class SpriteBatch {
        private List<SpriteBatchItem> _item_list;
        private SpriteBatchMode sort_mode;

        private unowned Renderer renderer;

        public SpriteBatch () {
            _item_list = new List<SpriteBatchItem> ();
            sort_mode = SpriteBatchMode.DEFAULT;

            renderer = Game.renderer.to_sdl ();
        }

        public void begin (SpriteBatchMode mode = SpriteBatchMode.DEFAULT, bool free_list = true) {
            sort_mode = mode;

            //  if (free_list) {
            //      _item_list.foreach ((item) => {
            //          _item_list.remove(item); 
            //      });
            //  }
        }

        public void draw (Sprite sprite, int x, int y) {
            SpriteBatchItem item = new SpriteBatchItem (sprite, x, y, 1.0, 1.0, 0.0);
            _filter_item (item);
        }

        public void draw_scale (Sprite sprite, Vector2 position, double scale_x, double scale_y) {
            SpriteBatchItem item = new SpriteBatchItem (
                sprite,
                (int)position.x,
                (int)position.y,
                scale_x, scale_y,
                0.0
            );

            _filter_item (item);
        }

        public void end () {
            if (sort_mode == SpriteBatchMode.IMMEDIATE) return;

            if (sort_mode == SpriteBatchMode.REVERSED) {
                _item_list.reverse ();
            }

            foreach (SpriteBatchItem item in _item_list) {
                _render_item (item);
            }
        }

        private void _render_item (SpriteBatchItem item) {
            //renderer.copyex (item.texture, item.sprite_rectangle, item.output_rectangle, 0.0, null, RendererFlip.NONE);
            renderer.copy (item.texture, item.sprite_rectangle, item.output_rectangle);
        }

        private void _filter_item (SpriteBatchItem item) {
            if (sort_mode != SpriteBatchMode.IMMEDIATE) {
                _item_list.append (item);
            } else {
                _render_item (item);
            }
        }
    }
}
