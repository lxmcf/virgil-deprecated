namespace Virgil.Scenes {
    public class SceneManager {
        private Game _game;
        private List<Scene> _scenes;

        public SceneManager (Game game) {
            _scenes = new List<Scene> ();
            _game = game;
        }
    }
}
