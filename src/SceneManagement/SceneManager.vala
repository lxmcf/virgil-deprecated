using Virgil.Debug;

namespace Virgil.SceneManagement {
    public class SceneManager {
        private List<Scene> _scenes_list;
        private unowned Game? _game;
        private Scene? _current_scene;
        //  private bool _allow_persistence;

        public uint count {
            get { return _scenes_list.length (); }
        }

        public SceneManager (Game? game = null) {
            _scenes_list = new List<Scene> ();
            _game = game;
        }

        ~SceneManager () {
            for (uint i = 0; i < _scenes_list.length (); i++) {
                unowned Scene item = _scenes_list.nth_data (i);

                item.cleanup ();
            }
        }

        public int add_scene (Scene scene, bool force = false) {
            if (get_scene_by_type (scene) != null && !force) {
                print_warning (@"Scene with the name of $(scene.name) already loaded into manager!");

                return EXIT_FAIL_DUPLICATE;
            }

            _scenes_list.append (scene);

            return EXIT_SUCCESS;
        }

        public int remove_scene (string name) {
            unowned Scene? item = get_scene_by_name (name);

            if (item != null) {
                _scenes_list.remove (item);

                return EXIT_SUCCESS;
            } else {
                return EXIT_FAIL;
            }
        }

        public int load_scene (string name) {
            unowned Scene? item = get_scene_by_name (name);

            if (item != null) {
                _current_scene.unload ();
                _current_scene.deactivate ();

                _current_scene = item;

                _current_scene.activate ();
            }

            return EXIT_FAIL;
        }

        public int update () {
            _current_scene.update ();

            _current_scene.draw ();

            return EXIT_SUCCESS;
        }

        public unowned Scene? get_scene_by_name (string name) {
            for (uint i = 0; i < _scenes_list.length (); i++) {
                unowned Scene item = _scenes_list.nth_data (i);

                if (item.name == name) {
                    return item;
                }
            }

            return null;
        }

        public unowned Scene? get_scene_by_type (Scene scene) {
            for (uint i = 0; i < _scenes_list.length (); i++) {
                unowned Scene item = _scenes_list.nth_data (i);

                if (item.name == scene.name) {
                    return item;
                }
            }

            return null;
        }

        public unowned Scene? get_current_scene () {
            return _current_scene;
        }

        public unowned Scene? get_nth_scene (uint n) {
            return _scenes_list.nth_data (n);
        }
    }
}
