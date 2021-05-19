using Virgil.Debug;

namespace Virgil.Scene {
    public class SceneManager {
        private List<Scene> _scenes_list;

        public SceneManager () {
            _scenes_list = new List<Scene> ();
        }

        public int add_scene (Scene scene) {
            if (_scene_exists (scene) != null) {
                print_warning ("Scene with the name of $(scene.name) already loaded into manager!");

                return EXIT_FAIL_DUPLICATE;
            }

            _scenes_list.append (scene);

            return EXIT_SUCCESS;
        }

        private Scene? _scene_exists (Scene scene) {
            for (uint i = 0; i < _scenes_list.length (); i++) {
                Scene item = _scenes_list.nth_data (i);

                if (item.name == scene.name) {
                    return item;
                }
            }

            return null;
        }
    }
}
