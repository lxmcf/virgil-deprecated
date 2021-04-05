namespace Virgil.Graphics {
    [Flags]
    public enum TextureType {
        STATIC,
        STREAMING,
        TARGET;

        public string to_string () {
            switch (this) {
                case STATIC:
                    return "STATIC";

                case STREAMING:
                    return "STREAMING";

                case TARGET:
                    return "TARGET";

                default:
                    return "UNKOWN";
            }
        }
    }
}
