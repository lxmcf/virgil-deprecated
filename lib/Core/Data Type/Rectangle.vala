using SDL.Video;

namespace Virgil {
    public class Rectangle {
        public int x { get; private set;}
        public int y { get; private set;}
        public int width { get; private set;}
        public int height { get; private set;}

        private Rect rectangle;

        public Rectangle (int x, int y, int width, int height) {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;

            rectangle = Rect () {
                x = x,
                y = y,
                w = width,
                h = height
            };
        }

        public Rect get_rectangle () {
            return rectangle;
        }
    }
}
