using SDL;

namespace Virgil.Graphics {
    public enum BlendMode {
        NONE = 0,
        BLEND = 1,
        ADDITIVE = 2,
        MODULATE = 3;

        internal Video.BlendMode to_sdl () {
            switch (this) {
                case NONE:
                    return Video.BlendMode.NONE;

                case BLEND:
                    return Video.BlendMode.BLEND;

                case ADDITIVE:
                    return Video.BlendMode.ADD;

                case MODULATE:
                    return Video.BlendMode.MOD;

                default:
                    return Video.BlendMode.NONE;
            }
        }
    }
}
