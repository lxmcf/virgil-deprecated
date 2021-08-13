namespace Virgil.Engine.Interfaces {
    public interface IGenericComponent {
        public abstract void load_content ();
        public abstract void unload_content ();

        public abstract void initialise ();
        public abstract void update ();
        public abstract void draw ();
    }
}
