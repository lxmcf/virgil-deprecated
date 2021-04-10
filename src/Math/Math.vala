namespace Virgil.Math {
    public static int lerp (int a, int b, int amount) {
        return a + amount * (b - a);
    }

    public static float flerp (float a, float b, float amount) {
        return a + amount * (b - a);
    }
}
