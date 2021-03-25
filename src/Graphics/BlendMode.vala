using SDL;

namespace Virgil.Graphics {
    public enum BlendMode {
        NONE,
        BLEND,
        ADDITIVE,
        MODULATE;

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
